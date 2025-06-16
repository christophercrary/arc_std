-- ****************************************************************************
-- decoder.vhd --
--
--     Binary to One-Hot decoder. Derived from demux instantiation.
--
-- Author(s):
--     Christopher Crary  (ccrary@ufl.edu)
--     Caleb Bean         (caleb.bean@ufl.edu)
--     Benjamin Hicks     (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Caleb Bean
--
-- Last Modified On:
--     August 25, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.demultiplexer_pkg;
use arc_std.demultiplexer_pkg.all;

package decoder_pkg is

  -- Return latency for a pipelined (`radix` x 1) multiplexer tree
  -- with `num_outputs` outputs.
  function get_latency(
    num_outputs : positive; radix : positive) return natural;


end package;

package body decoder_pkg is

  function get_latency(
    num_outputs : positive; radix : positive) return natural is
    
  begin

    return arc_std.demultiplexer_pkg.get_latency(num_outputs, radix);

  end function;
  
end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.decoder_pkg;
use arc_std.decoder_pkg.all;
use arc_std.demultiplexer_pkg;
use arc_std.demultiplexer_pkg.all;

entity decoder is -- Modify the generics once demux verified through testbench
  generic (
    num_outputs : positive;
    use_pipelining : boolean := false;

    -- The following two generics are only applicable if
    -- `use_pipelining` is true.
    radix : positive := 2;

    input_width : positive := get_num_bits_for_amount(num_outputs));
  
  port (
    clk : in std_logic := '0';
    rst : in std_logic := '0';

    input : in std_logic_vector(input_width-1 downto 0) := (others => '0');
    valid_in : in std_logic := '1';
    output : out std_logic_vector(num_outputs-1 downto 0));
  
end entity;

architecture STR of decoder is

    signal output_tuple : tuple_t(0 to num_outputs-1)(0 downto 0);

begin

    U_DEMUX : entity arc_std.demultiplexer
        generic map(
            data_type => STD_LOGIC_T,
            num_outputs => num_outputs,
            use_pipelining => use_pipelining,
            radix => radix)
        port map(
            clk => clk,
            rst => rst,
            input(0) => valid_in,
            sel => input,
            output => output_tuple);

    process(output_tuple)
    begin
        for i in 0 to num_outputs-1 loop
            output(i) <= output_tuple(i)(0);
        end loop;
    end process;

end architecture STR;