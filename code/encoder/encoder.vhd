-- ****************************************************************************
-- encoder.vhd --
--
--     Generic one-hot to binary encoder.
--
-- Author(s):
--     Benjamin Hicks (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Benjamin Hicks
--
-- Last Modified On:
--     August 23, 2022
-- ****************************************************************************


library arc_std;
context arc_std.std_context;

package encoder_pkg is

    -- Return latency for a pipelined (`radix` x 1) OR tree
    -- with `num_inputs` inputs.
    function get_latency(
        num_inputs : positive; radix : positive) return natural;

end package;

package body encoder_pkg is

    function get_latency(
        num_inputs : positive; radix : positive) return natural is

        constant depth : positive := clog_pos(num_inputs, radix);

    begin

        -- In the case of pipelining, there is a register placed at
        -- every level of the relevant OR tree; hence, the
        -- latency in this case is `depth`.
        -- return depth;
        
        return depth;

    end function;

end package body;

library arc_std;
context arc_std.std_context;
use arc_std.encoder_pkg;
use arc_std.encoder_pkg.all;

entity encoder is
    generic (
        num_inputs : positive;
        radix : positive := 4;
        output_width : positive := clog2(num_inputs));
    port (
        clk : in std_logic := '0';
        rst : in std_logic := '0';

        input : in std_logic_vector(num_inputs-1 downto 0);
        output : out std_logic_vector(output_width-1 downto 0);
        valid_out : out std_logic);

end entity;

architecture BHV of encoder is

    signal input_groups : tuple_t(num_inputs/2-1 downto 0)(output_width-1 downto 0);
    signal valid_groups : tuple_t(num_inputs-1 downto 0)(0 downto 0);
    signal output_unaligned : std_logic_vector(output_width-1 downto 0);

    constant output_type : type_t := uint_type(output_width);

begin

    process(input)
        variable index : integer;
    begin
        input_groups <= (others => (others => '0'));
        
        for i in 0 to output_width-1 loop
            -- reset index before beginning next input group
            index := 0;
            for j in 0 to num_inputs-1 loop
                if j mod (2**(i+1)) >= (2**i) then
                    input_groups(index)(i) <= input(j);
                    index := index + 1;
                end if;
            end loop;
        end loop;
    end process;

    process(input)
    begin
        for i in 0 to num_inputs-1 loop
            valid_groups(i)(0) <= input(i);
        end loop;
    end process;

    U_ENC_OR_TREE : entity arc_std.or_tree
        generic map(
            data_type => output_type,
            num_inputs => num_inputs/2,
            use_pipelining => true,
            radix => radix)
        port map(
            clk => clk,
            rst => rst,
            input => input_groups,
            output => output_unaligned);

    U_VALID_OUT_OR_TREE : entity arc_std.or_tree
        generic map(
            data_type => STD_LOGIC_T,
            num_inputs => num_inputs,
            use_pipelining => true,
            radix => radix)
        port map(
            clk => clk,
            rst => rst,
            input => valid_groups,
            output(0) => valid_out);


    -- Instantiate a delay entity to account for latency difference between
    -- the two or_tree instances

    U_DELAY : entity arc_std.delay
        generic map (
            data_type => output_type,
            num_cycles => get_latency(num_inputs, radix)
                -get_latency(num_inputs/2, radix))
        port map (
            clk => clk,
            rst => rst,
            input => output_unaligned,
            output => output);

end architecture;