-- ****************************************************************************
-- sequential_accumulator.vhd --
--
--     Sequential accumulator.
--
--     A sequential accumulator is an accumulator that performs the
--     accumulation of an input set via one input at a time.
--
--     The entity devised within this file is designed to be able to easily
--     support multiple, distinct architectures for sequential accumulation,
--     by way of VHDL generics. Currently, all accumulator architectures for
--     this entity support the IEEE-754 single-precision and double-precision
--     floating-point types, as well as generic unsigned and signed integer
--     types. All data are specified via some `std_logic_vector` of an
--     appropriate length.
--
--
--     As of now, the following architectures are supported:
--
--     [1] `pcbt_accumulator` - Partially-compact binary tree accumulator,
--         as it was defined in the 2007 publication "High-Performance
--         Reduction Circuits Using Deeply Pipelined Operators on FPGAs,"
--         by Ling Zhuo et al.
--
--         Essentially, a PCBT accumulator replaces a standard binary tree (BT)
--         accumulator (more commonly referred to as an "adder tree") with a
--         chain of adders, one for each level of the underlying binary tree,
--         having only a single new input entering the accumulator at any
--         given time. Overall, when the PCBT accumulator is compared to a
--         typical BT accumulator, the number of adders needed to accumulate
--         a set of `n` inputs is reduced from approximately `n` to exactly
--         `ceil(log2(n))`. Separately, a PCBT accumulator reduces throughput
--         by a factor of `n`. After an initial latency, a valid accumulation
--         result can be generated every `n` clock cycles, if a new input is
--         fed in every cycle. It is important to note that the number of
--         inputs that can be computed by this architecture is fixed at
--         compile time.
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
--         within the input set. All `num_inputs_per_cycle` inputs must
--         be passed in as a "generic data array", via the `input` port.
--
--       > The generic `sequential_accumulator_type` defines the architecture
--         type of the relevant accumulator. For a list of the values currently
--         supported for this generic, see the definition of the
--         `sequential_accumulator_t` type within this file.
--
--       > The `ready` output signal defines when the entity is able to accept
--         new input. If `ready` is set to `1`, new input can be specified;
--         otherwise, if `ready` is set to `0`, new input cannot be specified. 
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
use arc_std.pcbt_accumulator_pkg;


package sequential_accumulator_pkg is  

  type sequential_accumulator_t is (none_t, pcbt_t);

  function get_latency(
    input_type : type_t;
    accumulator_type : sequential_accumulator_t;
    num_inputs : positive) return natural;

end package;


package body sequential_accumulator_pkg is

  function get_latency(
    input_type : type_t;
    accumulator_type: sequential_accumulator_t;
    num_inputs : positive) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (num_inputs > 1) then
      
      if (accumulator_type = pcbt_t) then
        latency := pcbt_accumulator_pkg.get_latency(input_type, num_inputs);
      end if;
      
    end if;

    return latency;
    
  end function;


end package body;


-------------------------------------------------------------------------------


library arc_std;
context arc_std.std_context;
use arc_std.sequential_accumulator_pkg.all;
  
entity sequential_accumulator is
  generic (
    input_type : type_t;
    accumulator_type : sequential_accumulator_t;
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
    ready : out std_logic;
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture STR of sequential_accumulator is

begin
  
  U_ACCUMULATOR_COND: if (num_inputs = 1) generate
    -- No accumulator is needed.

    output <= input;
    valid_out <= valid_in;

  else generate
    -- An accumulator is needed.

    U_ACCUMULATOR_GEN: if (accumulator_type = pcbt_t) generate

      -- Partially-compact binary tree accumulator.
      U_PCBT_ACCUMULATOR : entity arc_std.pcbt_accumulator
        generic map (
          input_type => input_type,
          num_inputs => num_inputs,
          output_type => output_type)
        port map (
          clk => clk,
          rst => rst,

          input => input,
          valid_in => valid_in,
          ready => ready,
          output => output,
          valid_out => valid_out);

    end generate U_ACCUMULATOR_GEN;

  end generate U_ACCUMULATOR_COND;
  
end architecture STR;
