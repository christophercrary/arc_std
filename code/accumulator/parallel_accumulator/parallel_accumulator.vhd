-- ****************************************************************************
-- parallel_accumulator.vhd --
--
--     Parallel accumulator.
--
--     A parallel accumulator is an accumulator that performs the
--     accumulation of an input set via multiple inputs at a time.
--
--     The entity devised within this file is designed to be able to easily
--     support multiple, distinct architectures for parallel accumulation,
--     by way of VHDL generics. Currently, all accumulator architectures for
--     this entity support the IEEE-754 single-precision and double-precision
--     floating-point types, as well as generic unsigned and signed integer
--     types. All types are specified via some `std_logic_vector` of an
--     appropriate length.
--
--
--     As of now, the following architectures are supported:
--
--     [1] `bt_accumulator` - Binary tree accumulator, more commonly referred
--         to as an "adder tree."
--
--
-- Usage:
--
--     For all architectures,
--
--       > A set of inputs is to be summed, and this sum is to be fed out
--         of the `output` port. The generic `data_type` specifies
--         the type of input data that is to be accumulated. For a list of
--         the data types currently supported, see the definition of the
--         `type_t` type in the `type_pkg` package file.
--
--       > The generic `num_inputs` defines the total number of inputs
--         within the input set, and the generic `num_inputs_per_cycle`
--         defines the number of inputs that will be fed into the
--         accumulator at any given time, by way of the `input` port.
--         It must be ensured that `num_inputs_per_cycle` is less than
--         or equal to `num_inputs`.
--
--       > All `num_inputs_per_cycle` inputs must be passed in as a
--         "generic data array", via the `input` port.
--
--       > The generic `parallel_accumulator_type` defines the architecture
--         type of the relevant accumulator. For a list of the values currently
--         supported for this generic, see the definition of the
--         `parallel_accumulator_t` type within this file.
--
--       > The `valid_in` and `valid_out` signals define whether or not the
--         `input` and `output` ports contain new valid data, respectively.
--         Overall, the `valid_in` signal should be set to `1` whenever the
--         input port `input` contains new valid data, and set to `0` otherwise.
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
use arc_std.bt_accumulator_pkg;


package parallel_accumulator_pkg is

  type parallel_accumulator_t is (none_t, bt_t);

  function get_latency(
    input_type : type_t;
    accumulator_type : parallel_accumulator_t;
    num_inputs : positive) return natural;

end package;


package body parallel_accumulator_pkg is

  function get_latency(
    input_type : type_t;
    accumulator_type : parallel_accumulator_t;
    num_inputs : positive) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (num_inputs > 1) then
      
      if (accumulator_type = bt_t) then
        latency := bt_accumulator_pkg.get_latency(input_type, num_inputs);
      end if;
      
    end if;

    return latency;
    
  end function;


end package body;


-------------------------------------------------------------------------------


library arc_std;
context arc_std.std_context;
use arc_std.parallel_accumulator_pkg.all;
  
entity parallel_accumulator is
  generic (
    input_type : type_t;
    accumulator_type : parallel_accumulator_t;
    num_inputs : positive;
    
    input_width : positive := get_width(input_type);
    output_type : type_t :=
      math_pkg.get_accumulation_output_type(input_type, num_inputs);
    output_width : positive := get_width(output_type));
  port (
    clk : in std_logic;
    rst : in std_logic;

    input : in tuple_t(0 to num_inputs-1)(input_width-1 downto 0);
    valid_in : in std_logic;
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture STR of parallel_accumulator is
  
begin

  U_ACCUMULATOR_COND: if (num_inputs = 1) generate
    -- No accumulator is needed.

    output <= input(0);
    valid_out <= valid_in;

  else generate
    -- An accumulator is needed.
         
   U_ACCUMULATOR_GEN: if (accumulator_type = bt_t) generate

     -- Binary tree accumulator, more commonly known as an "adder tree."
     U_BT_ACCUMULATOR : entity arc_std.bt_accumulator
       generic map (
         input_type => input_type,
         num_inputs => num_inputs)
       port map (
         clk => clk,
         rst => rst,

         input => input,
         valid_in => valid_in,
         output => output,
         valid_out => valid_out);

    end generate U_ACCUMULATOR_GEN;

  end generate U_ACCUMULATOR_COND;
  
end architecture STR;
