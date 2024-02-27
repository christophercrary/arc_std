-- ****************************************************************************
-- multiply_accumulator.vhd --
--
--     Multiply-accumulator (MAC) entity.
--
--     A "unified accumulator" is utilized to perform the relevant
--     accumulation. See the file containing the `accumulator` entity
--     for more details.
--
--     By way of the `accumulator` entity, the entity devised within
--     this file is designed to be able to easily support multiple, distinct
--     architectures for multiply-accumulation, via VHDL generics. Currently,
--     all multiply-accumulator architectures for this entity support the
--     IEEE-754 single-precision and double-precision floating-point types,
--     as well as generic unsigned and signed integer types. All types are
--     specified via some `std_logic_vector` of an appropriate length.
--
--
-- Usage:
--
--     For all architectures,
--
--       > Two sets of inputs are to be multiply-accumulated, and the overall
--         MAC result is to be fed out of the `output` port. The generics
--         `input1_type` and `input2_type` specify the type of input
--         data that is to be multiply-accumulated. These two inputs must
--         be of the same base data type, but if they are of an integer type,
--         the width of each input may be different. For a list of the data
--         types currently supported, see the definition of the `type_t` type
--         in the `type_pkg` package file.
--
--       > The generic `num_input_pairs` defines the number of input pairs
--         that are to be multiply-accumulated, *not* the total number of
--         inputs. For example, if sixteen pairs of inputs are to be multiply-
--         accumulated, the value `16`, not `32`, should be specified
--         for `num_input_pairs`.
--
--       > The generic `num_input_pairs_per_cycle` defines the number of input
--         pairs that will be fed into the accumulator at any given time, by
--         way of the `input1` and `input2` ports. It must be ensured that
--         `num_input_pairs_per_cycle` is less than or equal to `num_input_
--         pairs`.
--
--       > A parallel accumulator is to be utilized whenever `num_input_pairs_
--         per_cycle` is greater than one, and a sequential accumulator is to
--         be utilized whenever `num_input_pairs_per_cycle` is less than `num_
--         input_pairs`. (See the file containing the `accumulator` entity for
--         more details.) The generic `accumulator_type` defines the architec-
--         ture types of the relevant parallel and sequential accumulators,
--         if one is to be utilized. For a list of the values currently support-
--         ed for these generics, see the definitions of the `parallel_accumu-
--         lator_t` and `sequential_accumulator_t` types within the `parallel_
--         accumulator.vhd` and `sequential_accumulator.vhd` files,
--         respectively.
--
--       > For each input set, all `num_input_pairs_per_cycle` inputs must be
--         passed in as "generic data arrays", via the `input1` and input2`
--         ports.
--
--       > The `ready` output signal defines when the entity is able to accept
--         new inputs. If `ready` is set to `1`, new inputs can be specified;
--         otherwise, if `ready` is set to `0`, new inputs cannot be specified. 
--
--       > The `valid_in` and `valid_out` signals define whether or not the
--         input and output ports contain new valid data, respectively.
--         Overall, the `valid_in` signal should be set to `1` whenever both
--         the `input1` and `input2` ports contain new valid data, and set to
--         `0` otherwise.
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

use arc_std.multiplier_pkg;
use arc_std.accumulator_pkg;
use arc_std.accumulator_pkg.all;

package multiply_accumulator_pkg is

  function get_latency(
    input1_type : type_t;
    input2_type : type_t;
    accumulator_type : accumulator_t;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive) return positive;

end package;

package body multiply_accumulator_pkg is
  
  function get_latency(
    input1_type : type_t;
    input2_type : type_t;
    accumulator_type : accumulator_t;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive) return positive is

    constant product_type : type_t :=
      math_pkg.get_multiplication_output_type(input1_type, input2_type);
    
  begin
    
    return multiplier_pkg.get_latency(input1_type, input2_type) +
      accumulator_pkg.get_latency(
        product_type, accumulator_type,
        num_input_pairs, num_input_pairs_per_cycle);
    
  end function;

end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;

use arc_std.multiplier_pkg;
use arc_std.accumulator_pkg;
use arc_std.accumulator_pkg.all;
use arc_std.multiply_accumulator_pkg.all;

entity multiply_accumulator is
  generic (
    input1_type : type_t;
    input2_type : type_t;
    accumulator_type : accumulator_t;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive := num_input_pairs;
    
    input1_width : positive := get_width(input1_type);
    input2_width : positive := get_width(input2_type);
    
    output_type : type_t :=
      math_pkg.get_multiply_accumulation_output_type(
        input1_type, input2_type, num_input_pairs);
    
    output_width : positive := get_width(output_type));
  port (
    clk : in std_logic;
    rst : in std_logic;

    input1 : in tuple_t(0 to num_input_pairs_per_cycle-1)(
      input1_width-1 downto 0);
    input2 : in tuple_t(0 to num_input_pairs_per_cycle-1)(
      input2_width-1 downto 0);
    
    valid_in : in std_logic;
    ready : out std_logic;
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture STR of multiply_accumulator is
  
  constant product_type : type_t :=
    math_pkg.get_multiplication_output_type(input1_type, input2_type);

  constant product_width : positive := get_width(product_type);
                                           
-------------------------------------------------------------------------------
  
  signal product : tuple_t(0 to num_input_pairs_per_cycle-1)(
    product_width-1 downto 0);

  -- Valid signal aligned with the output of the relevant multiplier entity.
  signal valid_out_product : std_logic;

begin

  -- Compute the relevant products.
  U_MULTIPLIER_GEN : for i in 0 to num_input_pairs_per_cycle-1 generate
    U_MULTIPLIER : entity work.multiplier
      generic map (
        input1_type => input1_type,
        input2_type => input2_type)
      port map (
        clk => clk,
        rst => rst,
     
        input1 => input1(i),
        input2 => input2(i),
        output => product(i));
  end generate;

  
  -- Delay for `valid_in` signal, to account for the latency of
  -- the `multiplier` entity.
  U_VALID_IN_DELAY : entity arc_std.delay
    generic map (
      use_valid => true,
      num_cycles => multiplier_pkg.get_latency(input1_type, input2_type))
    port map (
      clk => clk,
      rst => rst,
      valid_in => valid_in,
      valid_out => valid_out_product);

  
  U_ADD_TREE_COND : if (num_input_pairs > 1) generate
    -- An accumulator is needed.
    
    U_ACCUMULATOR : entity work.accumulator
      generic map (
        input_type => product_type,
        accumulator_type => accumulator_type,
        num_inputs => num_input_pairs,
        num_inputs_per_cycle => num_input_pairs_per_cycle)
      port map (
        clk => clk,
        rst => rst,
        
        input => product,
        valid_in => valid_out_product,
        ready => ready,
        output => output,
        valid_out => valid_out);

  else generate
    -- An accumulator is not needed.
         
    output <= product(0);
    valid_out <= valid_out_product;
    
  end generate;
    
end architecture STR;
