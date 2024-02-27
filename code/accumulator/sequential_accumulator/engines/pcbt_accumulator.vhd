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
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 12, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.pcbt_accumulator_helper_pkg;


package pcbt_accumulator_pkg is

  function get_latency(
    input_type : type_t; num_inputs : positive) return natural;
  
end package;


package body pcbt_accumulator_pkg is

  function get_latency(
    input_type : type_t; num_inputs : positive) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (num_inputs > 1) then
      latency :=
        pcbt_accumulator_helper_pkg.get_latency(input_type, num_inputs);
    end if;

    return latency;
    
  end function;    

end package body;


-------------------------------------------------------------------------------


library arc_std;
context arc_std.std_context;
use arc_std.pcbt_accumulator_pkg.all;
  
entity pcbt_accumulator is
  generic (
    input_type : type_t;
    num_inputs : positive;
    
    input_width : positive := get_width(input_type);
    output_type : type_t :=
      math_pkg.get_accumulation_output_type(input_type, num_inputs);
    output_width : positive := get_width(output_type));
  port (
    clk : in std_logic;
    rst : in std_logic;

    input : in std_logic_vector(input_width-1 downto 0);
    valid_in : in std_logic;
    ready : out std_logic := '1';
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture MIX of pcbt_accumulator is
  
begin


  -- The PCBT is only a feed-forward pipeline, meaning that
  -- it is ready to accept new inputs every cycle.
  --
  -- Note that the presence of the `ready` signal is to adhere
  -- to the general interface defined for the `accumulator`
  -- entity.
  ready <= '1';


  U_PCBT_COND : if (num_inputs = 1) generate
    -- No accumulator is needed.

    output <= input;
    valid_out <= valid_in;

  else generate
    -- Otherwise, a PCBT is to be created.
    --
    -- The `pcbt_accumulator_helper` entity is utilized
    -- so that the construction of the PCBT is simpler.
    --
    -- For more details, refer to the file containing this entity.

    U_PCBT : entity arc_std.pcbt_accumulator_helper
      generic map (
        input_type => input_type,
        num_inputs => num_inputs,
        output_type => output_type)
      port map (
        clk => clk,
        rst => rst,

        input => input,
        valid_in => valid_in,
        output => output,
        valid_out => valid_out);

  end generate U_PCBT_COND;
  
end architecture MIX;
