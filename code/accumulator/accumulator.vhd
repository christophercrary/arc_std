-- ****************************************************************************
-- accumulator.vhd --
--
--     Unified accumulator.
--
--     A "unified accumulator" is an accumulator that can perform both
--     parallel and sequential accumulation at the same time.
--
--     In general, it is infeasible to support arbitrarily large parallel
--     accumulators, due to the exponential growth of circuit area. To
--     avoid such growth, parallel accumulators are often supplanted by
--     some form of a sequential accumulator. However, a purely sequential
--     accumulator will generally have much less throughput compared to a
--     purely parallel accumulator. For some applications, high throughput
--     via a parallel accumulator may not be necessary, but on the flip side,
--     significantly lower throughput via a sequential accumulator may not be
--     tolerable. In the middle ground of this tradeoff spectrum is some
--     combination of parallel and sequential accumulators. This is where
--     the unified accumulator steps in.
--
--     In brief, a unified accumulator uses (i) a parallel accumulator to
--     compute partial sums in parallel from as many inputs of some input
--     set as is feasible and then (ii) a sequential accumulator to iteratively
--     compute the sum of the overall input set from any partial sums generated
--     by the parallel accumulator. So, the unified accumulator is essentially
--     some parallel accumulator followed by some sequential accumulator.
--     Thus, pre-existing parallel and sequential accumulators can be directly
--     applied to a unified accumulator architecture.
--
--     The entity devised within this file is designed to be able to easily
--     support multiple, distinct architectures for both parallel and sequential
--     accumulation, by way of VHDL generics. Currently, all accumulator
--     architectures for this entity support the IEEE-754 single-precision and
--     double-precision floating-point types, as well as generic unsigned and
--     signed integer types. All data are specified via some `std_logic_vector`
--     of an appropriate length.
--
--
--     As of now, the following parallel architectures are supported:
--
--
--     [1] `bt_accumulator` - Binary tree accumulator, more commonly referred
--         to as an "adder tree."
--
--
--     As of now, the following sequential architectures are supported:
--
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
--         of the `output` port. The generic `input_type` specifies
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
--       > A parallel accumulator is to be utilized whenever
--         `num_inputs_per_cycle` is greater than one, and a sequential
--         accumulator is to be utilized whenever `num_inputs_per_cycle`
--         is less than `num_inputs`. The generic `accumulator_type`
--         defines the architecture types of the relevant parallel
--         and sequential accumulators, if one is to be utilized.
--         For a list of the values currently supported for these
--         generics, see the definitions of the `parallel_accumulator_t`
--         and `sequential_accumulator_t` types within the `parallel_
--         accumulator.vhd` and `sequential_accumulator.vhd` files,
--         respectively.
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

use arc_std.parallel_accumulator_pkg;
use arc_std.parallel_accumulator_pkg.all;
use arc_std.sequential_accumulator_pkg;
use arc_std.sequential_accumulator_pkg.all;


package accumulator_pkg is

  -- Architecture types.
  type accumulator_t is record
    parallel : parallel_accumulator_t;
    sequential : sequential_accumulator_t;
  end record;

  type accumulator_array is array(natural range<>) of accumulator_t;

  constant NO_ACCUMULATOR : accumulator_t := (
    parallel => none_t,
    sequential => none_t);
  
  
  function get_latency(
    input_type : type_t;
    accumulator_type : accumulator_t; 
    num_inputs : positive;
    num_inputs_per_cycle : positive) return natural;

end package;


package body accumulator_pkg is

  function get_latency(
    input_type : type_t;
    accumulator_type : accumulator_t; 
    num_inputs : positive;
    num_inputs_per_cycle : positive) return natural is
    
    constant parallel_accumulator_output_type : type_t :=
      math_pkg.get_accumulation_output_type(
        input_type, num_inputs_per_cycle);

    variable latency : natural := 0;

    variable num_inputs_sequential_accumulator :
      positive := integer(ceil(real(num_inputs)/(real(num_inputs_per_cycle))));
    
  begin
    
    if (num_inputs > 1) then
      -- At least one accumulator is to be used.
      
      if (num_inputs_per_cycle > 1) then
        -- A parallel accumulator is to be utilized.
        latency := latency + parallel_accumulator_pkg.get_latency(
          input_type,
          accumulator_type.parallel,
          num_inputs_per_cycle);
        
      end if;

      if (num_inputs_per_cycle < num_inputs) then
        -- A sequential accumulator is to be utilized.

        latency := latency + sequential_accumulator_pkg.get_latency(
          parallel_accumulator_output_type,
          accumulator_type.sequential,
          num_inputs_sequential_accumulator);
                     
      end if;

    end if;

    return latency;
    
  end function;

    
end package body;


-------------------------------------------------------------------------------


library arc_std;
context arc_std.std_context;

use arc_std.accumulator_pkg.all;
use arc_std.parallel_accumulator_pkg;

entity accumulator is
  generic (
    input_type : type_t;
    accumulator_type : accumulator_t;
    
    num_inputs : positive;
    num_inputs_per_cycle : positive := num_inputs;
    
    input_width : positive := get_width(input_type);
    output_type : type_t :=
      math_pkg.get_accumulation_output_type(input_type, num_inputs);
    output_width : positive := get_width(output_type));
  
  port (
    clk : in std_logic;
    rst : in std_logic;

    input : in tuple_t(0 to num_inputs_per_cycle-1)(
      input_width-1 downto 0);
    
    valid_in : in std_logic;
    ready : out std_logic;
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture MIX of accumulator is

  function get_parallel_accumulator_output_type(
    input_type : type_t := input_type;
    num_inputs_per_cycle : positive := num_inputs_per_cycle;
    input_width : positive := input_width) return type_t is

  begin
    
    return math_pkg.get_accumulation_output_type(
      input_type, num_inputs_per_cycle);

  end function;

  
  function get_sequential_accumulator_input_type(
    input_type : type_t := input_type;
    num_inputs : positive := num_inputs;
    num_inputs_per_cycle : positive := num_inputs_per_cycle;
    input_width : positive := input_width) return type_t is

  begin
    
    if (num_inputs = 1) then
      -- No accumulator is to be utilized;
      -- the result of the function for this case is arbitrary.
      
      return NO_TYPE;
      
    elsif (num_inputs_per_cycle = 1) then
      -- Only a sequential accumulator is to be utilized.
      
      return input_type;
      
    else
      -- Either (i) just a parallel accumulator or
      -- (ii) both a parallel accumulator and a sequential
      -- accumulator are to be utilized; regardless,
      -- the return value must be the same.
      
      return get_parallel_accumulator_output_type;

    end if;
    
  end function;


  function get_sequential_accumulator_num_inputs(
    num_inputs : positive := num_inputs;
    num_inputs_per_cycle : positive := num_inputs_per_cycle) return positive is
    
  begin
    return integer(ceil(real(num_inputs)/real(num_inputs_per_cycle)));
  end function;

  
-------------------------------------------------------------------------------
  
  constant output_width_parallel_accumulator : positive :=
    get_width(get_parallel_accumulator_output_type);

  constant input_type_sequential_accumulator : type_t :=
    get_sequential_accumulator_input_type;

  constant input_width_sequential_accumulator : positive :=
    get_width(input_type_sequential_accumulator);

-------------------------------------------------------------------------------
  
  signal output_parallel_accumulator :
    std_logic_vector(output_width_parallel_accumulator-1 downto 0);

  signal valid_out_parallel_accumulator : std_logic;

  signal input_sequential_accumulator :
    std_logic_vector(input_width_sequential_accumulator-1 downto 0);

  signal valid_in_sequential_accumulator : std_logic;
  
  
begin

  
  U_ACCUMULATOR_GEN : if (num_inputs = 1) generate
    -- No accumulator is needed.

    ready <= '1';
    output <= input(0);
    valid_out <= valid_in;

  else generate
    -- At least one accumulator is needed.

    U_PARALLEL_COND : if (num_inputs_per_cycle > 1) generate
      -- A parallel accumulator is needed.

      U_PARALLEL_ACCUMULATOR : entity arc_std.parallel_accumulator
        generic map (
          input_type => input_type,
          accumulator_type => accumulator_type.parallel,
          num_inputs => num_inputs_per_cycle)
        port map (
          clk => clk,
          rst => rst,

          input => input,
          valid_in => valid_in,
          output => output_parallel_accumulator,
          valid_out => valid_out_parallel_accumulator);

      input_sequential_accumulator <= output_parallel_accumulator;
      valid_in_sequential_accumulator <= valid_out_parallel_accumulator;


    else generate
      -- No parallel accumulator is needed.

      input_sequential_accumulator <= input(0);
      valid_in_sequential_accumulator <= valid_in;
      
    end generate U_PARALLEL_COND;


    
    U_SEQUENTIAL_COND : if (num_inputs_per_cycle < num_inputs) generate
      -- A sequential accumulator is needed.

      U_SEQUENTIAL_ACCUMULATOR : entity arc_std.sequential_accumulator
        generic map (
          input_type => input_type_sequential_accumulator,
          accumulator_type => accumulator_type.sequential,
          num_inputs => get_sequential_accumulator_num_inputs,
          output_type => output_type)
        port map (
          clk => clk,
          rst => rst,

          input => input_sequential_accumulator,
          valid_in => valid_in_sequential_accumulator,
          ready => ready,
          output => output,
          valid_out => valid_out);
      
    else generate
      -- No sequential accumulator is needed.

      ready <= '1';
      output <= input_sequential_accumulator;
      valid_out <= valid_in_sequential_accumulator;
      
    end generate U_SEQUENTIAL_COND;
    
  end generate U_ACCUMULATOR_GEN;
  
end architecture MIX;
