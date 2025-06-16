-- ****************************************************************************
-- pcbt_accumulator.vhd --
--
--     Partially-compact binary tree (PCBT) accumulator, as defined by
--     Ling Zhuo et al. in their 2007 publication titled "High-Performance
--     Reduction Circuits Using Deeply Pipelined Operators on FPGAs."
--
--     Essentially, a PCBT accumulator replaces a standard binary tree (BT)
--     accumulator (more commonly referred to as an "adder tree") with a
--     chain of adders, one for each level of the underlying binary tree,
--     having only a single new input entering the accumulator at any
--     given time. Overall, when the PCBT accumulator is compared to a
--     typical BT accumulator, the number of adders needed to accumulate
--     a set of `n` inputs is reduced from approximately `n` to exactly
--     `ceil(log2(n))`. Separately, a PCBT accumulator reduces throughput
--     by a factor of `n`. After an initial latency, a valid accumulation
--     result can be generated every `n` clock cycles, if a new input is
--     fed in every cycle. It is important to note that the number of inputs
--     that can be computed by this architecture is fixed at compile time.
--
--     A PCBT accumulator correctly accumulates an input set by having each
--     accumulator within the PCBT be preceded by a pair of shift registers,
--     one dedicated to storing a particular operand of the accumulator.
--     For every two valid inputs that are passed into the PCBT, the first
--     accumulator within the PCBT can compute and pass some valid
--     partial result to the shift register pair preceding the second
--     accumulator within the PCBT, if there exists any; for every four valid
--     inputs that are passed into the PCBT, the second accumulator
--     within the PCBT can compute and pass some valid partial to the shift
--     register pair preceding third accumulator within the PCBT, if there
--     exists any; and so on, until the last accumulator within the PCBT
--     computes the final output. Note that, for an input size `n` that is
--     not a power of two, certain adders must be directly routed to a
--     following adder, so that a valid output can be generated every `n`
--     clock cycles.
--
--     Although PCBT accumulators can significantly reduce circuit area when
--     compared to typical BT accumulators, they are still often considered
--     wasteful in terms of circuit area, since every adder except the first
--     within the PCBT will have low utilization. However, note that this
--     wasted area may be negligible for certain FPGA architectures and
--     certain applications.
--
--     To address the shortcoming of the PCBT architecture involving adder
--     utilization, there exist a number of other notable accumulator
--     architectures, e.g., the fully-compact binary tree (FCBT) architecture
--     introduced by Ling Zhuo et al. in their 2007 paper "High-Performance
--     Reduction Circuits Using Deeply Pipelined Operators on FPGAs." In brief,
--     an FCBT accumulator manages to reduce any typical BT accumulator into a
--     chain of just two accumulators, but at the cost of additional control
--     logic complexity in comparison to the PCBT architecture. Ultimately,
--     the control logic added by an FCBT can potentially slow down maximum
--     clock frequencies in comparison to a PCBT, depending on the relevant
--     input set size, the targeted device, and the application implementing
--     the accumulator.
--
--     Overall, due to its simplicity, the PCBT architecture may be worthwhile
--     for certain applications that demand the use of a high-speed sequential
--     accumulator. 
--
--    
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu),
--     Caleb Bean (caleb.bean@ufl.edu),
--     Benjamin Hicks (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Benjamin Hicks
--
-- Last Modified On:
--     August 12, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.adder_pkg;

package pcbt_accumulator_pkg is

    function get_latency(
        input_type : type_t; max_inputs : positive) return natural;

end package;


package body pcbt_accumulator_pkg is

    function get_latency(
        input_type : type_t; max_inputs : positive) return natural is
        
        variable num_levels : positive := clog2(max_inputs);
        
        variable latency : natural := 0;

    begin
        -- it takes `max_inputs-1` cycles
        -- for all of the inputs to enter the PCBT and then `num_levels*
        -- (adder_pkg.get_latency(input_type))` additional cycles for the last
        -- input to pass through the PCBT.
        if (max_inputs > 1) then
            latency := (max_inputs-1)+num_levels*adder_pkg.get_latency(input_type);
        end if;

        return latency;

    end function;

end package body;

library arc_std;
context arc_std.std_context;
use arc_std.adder_pkg;
use arc_std.reg_pkg;
use arc_std.counter_pkg;

entity pcbt_accumulator is
    generic (
        input_type : type_t;
        max_inputs : positive;
        
        input_width : positive := get_width(input_type);
        output_type : type_t :=
        math_pkg.get_accumulation_output_type(input_type, max_inputs);
        output_width : positive := get_width(output_type));
    port (
        clk : in std_logic;
        rst : in std_logic;
        
        input : in std_logic_vector(input_width-1 downto 0);
        valid_in : in std_logic;
        end_of_group : in std_logic;
        ready : out std_logic := '1';
        output : out std_logic_vector(output_width-1 downto 0);
        valid_out : out std_logic);
end entity;

architecture MIX of pcbt_accumulator is

    constant MAX_COUNT : positive := 2;
    constant MAX_COUNT_BITS : positive := clog2(MAX_COUNT);
    constant count_type : type_t := uint_type(MAX_COUNT_BITS);
    constant ADD_OUT_BITS : positive := get_width(
        math_pkg.get_accumulation_output_type(input_type, 2)
    );

    signal buf_reg : std_logic_vector(input_width-1 downto 0);
    signal add_in1 : std_logic_vector(input_width-1 downto 0);
    signal add_in2 : std_logic_vector(input_width-1 downto 0);
    signal add_out : std_logic_vector(ADD_OUT_BITS-1 downto 0);
    signal add_valid_in : std_logic;
    
    signal valid_in_delayed : std_logic;
    signal end_of_group_delayed : std_logic;

    signal cnt_en : std_logic;
    signal cnt : std_logic_vector(MAX_COUNT_BITS-1 downto 0);
    signal cnt_r : std_logic_vector(MAX_COUNT_BITS-1 downto 0);
    signal ovf : std_logic;
    signal cnt_eq_0 : std_logic;
    signal solo : std_logic;

begin

    -- The PCBT is only a feed-forward pipeline, meaning that
    -- it is ready to accept new inputs every cycle.
    --
    -- Note that the presence of the `ready` signal is to adhere
    -- to the general interface defined for the `accumulator`
    -- entity.
    ready <= '1';

    U_PCBT_COND : if (max_inputs = 1) generate
        -- No accumulator is needed.
    
        output <= input;
        valid_out <= valid_in;
    
    else generate
    -- Otherwise, a PCBT is to be created.
        
        -- buffer register to store second input to adder
        U_REG_SECOND_OPERAND : entity arc_std.reg
            generic map (
                data_type => input_type,
                reg_type => reg_pkg.no_rst_t)
            port map (
                clk => clk,
                enable => valid_in,
                input => input,
                output => buf_reg);
        
        -- adder inputs
        add_in1 <= input;
        add_in2 <= buf_reg when solo = '0' else (others => '0');

-------------------------------------------------------------------------------

        -- Adder to perform the addition of this level.

        U_ADD : entity arc_std.adder
            generic map (
                input1_type => input_type,
                input2_type => input_type,
                use_valid => true,
                output_type => output_type)
            port map (
                clk => clk,
                rst => rst,
                input1 => add_in1,
                input2 => add_in2,
                valid_in => add_valid_in,
                output => add_out,
                valid_out => valid_in_delayed);
        add_valid_in <= ovf or (valid_in and solo);

        -- instantiate delay register for end_of_group_delayed
        U_END_OF_GROUP_DELAY : entity arc_std.delay
            generic map (
                data_type => STD_LOGIC_T,
                num_cycles => adder_pkg.get_latency(input_type))
            port map (
                clk => clk,
                input(0) => end_of_group,
                output(0) => end_of_group_delayed);
        
-------------------------------------------------------------------------------

        -- counter control logic
        cnt_eq_0 <= '1' when unsigned(cnt_r) = 0 else '0';
        solo <= cnt_eq_0 and end_of_group;
        cnt_en <= valid_in and not solo;

        -- Counter to determine the `valid_in` signal for the adder of this 
        -- level.
        --
        -- The counter will produce a valid signal for the adder once two 
        -- valid operands are available

        U_ADDER_COUNTER : entity arc_std.counter
            generic map (
                period => 2,
                counter_type => counter_pkg.async_t)
            port map (
                clk => clk,
                rst => rst,
                enable => cnt_en,
                output => cnt,
                overflow => ovf);
        
        -- register the cnt output
        U_REG_COUNT : entity arc_std.reg
            generic map (
                data_type => count_type,
                reg_type => reg_pkg.async_rst_t)
            port map (
                clk => clk,
                rst => rst,
                input => cnt,
                output => cnt_r);
        
        U_BASE_CASE : if (max_inputs = 2) generate
            -- base case
            output <= add_out;
            valid_out <= valid_in_delayed;

        else generate
            -- recursive case
            U_PCBT : entity arc_std.pcbt_accumulator
                generic map (
                    input_type => input_type,
                    max_inputs => 2**(clog2(max_inputs)-1))
                port map (
                    clk => clk,
                    rst => rst,

                    input => add_out,
                    valid_in => valid_in_delayed,
                    end_of_group => end_of_group_delayed,
                    output => output,
                    valid_out => valid_out);

        end generate;

    end generate;

end architecture MIX;