-- ****************************************************************************
-- math_pkg.vhd --
--
--     Math package.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--     Greg Stitt (gstitt@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 12, 2021
-- ****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library arc_std;
use arc_std.extended_float_pkg.all;
use arc_std.type_pkg.all;

package math_pkg is
  
  -- Return the ceiling of the base-two logarithm of a positive integer.
  -- Useful for avoiding all the casting that takes place in the `math_
  -- real` package.
  function clog2(input : positive) return natural;

  
  -- Same as `clog2`, but with `clog2(1)` equal to `1` instead of `0`.
  -- Useful for retrieving a minimum number of bits needed to index `input`
  -- distinct values.
  function clog2_pos(input : positive) return positive;

  
  -- Return the ceiling of the base-`radix` logarithm of a positive integer.
  -- Similar to `clog2`, but more general.
  function clog(input : positive; base : positive) return natural;

  
  -- Similar to `clog2_pos`, but more general.
  function clog_pos(input : positive; base : positive) return positive;

  
  -- Return the number of bits required to store the number `value`.
  -- For example, `n_bits_value(8)` would return `4`, since
  -- four bits are needed to represent the value `8`.
  function n_bits_value(value : natural) return positive;

  
  -- Return the number of bits required to store `amount` distinct values.
  -- For example, `n_bits_amount(8)` would return `3`, since
  -- three bits can store eight distinct values.
  function n_bits_amount(amount : positive) return positive;


  -- Return `true` if the value provided for `input` is a power of two;
  -- otherwise, return `false`.
  function is_power_of_two(input : natural) return boolean;


-------------------------------------------------------------------------------

  -- Return output type of addition operation involving the two input
  -- types `input1_type` and `input2_type`, respectively.
  function get_addition_output_type(
    input1_type : type_t; input2_type : type_t) return type_t;

  
  -- Same as the above, except that there is only one distinct input type.
  function get_addition_output_type(input_type : type_t) return type_t;

  
  -- Return output type of subtraction operation involving the two input
  -- types `input1_type` and `input2_type`, respectively.
  function get_subtraction_output_type(
    input1_type : type_t; input2_type : type_t) return type_t;

  
  -- Same as the above, except that there is only one distinct input type.
  function get_subtraction_output_type(input_type : type_t) return type_t;

  
  -- Return output type of multiplication operation involving the two input
  -- types `input1_type` and `input2_type`, respectively.
  function get_multiplication_output_type(
    input1_type : type_t; input2_type : type_t) return type_t;


  -- Same as the above, except that there is only one distinct data type.
  function get_multiplication_output_type(input_type : type_t) return type_t;
  

  -- Return output type of division operation involving the two input
  -- types `input1_type` and `input2_type`, respectively.  
  function get_division_output_type(
    input1_type : type_t; input2_type : type_t) return type_t;


  -- Same as the above, except that there is only one distinct input type.
  function get_division_output_type(input_type : type_t) return type_t;
  

  -- Return output type of accumulation operation involving `num_inputs`
  -- inputs of type `input_type`.    
  function get_accumulation_output_type(
    input_type : type_t; num_inputs : natural) return type_t;
  

  -- Return output type of multiply accumulation operation involving
  -- `num_input_pairs` input pairs, where the type of the first element
  -- within every pair is `input1_type` and the type of the second
  -- element within every pair is `input2_type`.
  function get_multiply_accumulation_output_type(
    input1_type : type_t;
    input2_type : type_t;
    num_input_pairs : positive) return type_t;


  -- Same as the above, except that there is only distinct input type.
  function get_multiply_accumulation_output_type(
    input_type : type_t;
    num_input_pairs : positive) return type_t;
  

  -- Return output type of absolute value operation involving the
  -- input type `input_type`.
  function get_absolute_value_output_type(input_type : type_t) return type_t;

  
-------------------------------------------------------------------------------


  function "=" (x : integer; y : data_t) return boolean;

  function "=" (x : data_t; y : integer) return boolean;

  function "=" (x : real; y : data_t) return boolean;

  function "=" (x : data_t; y : real) return boolean;
  
  function "=" (x : data_t; y : data_t) return boolean;

  function "=" (x : integer; y : data_t) return data_t;

  function "=" (x : data_t; y : integer) return data_t;

  function "=" (x : real; y : data_t) return data_t;

  function "=" (x : data_t; y : real) return data_t;
  
  function "=" (x : data_t; y : data_t) return data_t;
  
  function "=" (x : integer; y : data_array) return data_array;

  function "=" (x : data_array; y : integer) return data_array;

  function "=" (x : real; y : data_array) return data_array;
  
  function "=" (x : data_array; y : real) return data_array;

  function "=" (x : data_array; y : data_array) return data_array;
  
  
  function "/=" (x : integer; y : data_t) return boolean;

  function "/=" (x : data_t; y : integer) return boolean;

  function "/=" (x : real; y : data_t) return boolean;

  function "/=" (x : data_t; y : real) return boolean;

  function "/=" (x : data_t; y : data_t) return boolean;

  function "/=" (x : integer; y : data_t) return data_t;

  function "/=" (x : data_t; y : integer) return data_t;

  function "/=" (x : real; y : data_t) return data_t;

  function "/=" (x : data_t; y : real) return data_t;
  
  function "/=" (x : data_t; y : data_t) return data_t;
  
  function "/=" (x : integer; y : data_array) return data_array;

  function "/=" (x : data_array; y : integer) return data_array;

  function "/=" (x : real; y : data_array) return data_array;
  
  function "/=" (x : data_array; y : real) return data_array;

  function "/=" (x : data_array; y : data_array) return data_array;

  
  function "<" (x : integer; y : data_t) return boolean;

  function "<" (x : data_t; y : integer) return boolean;

  function "<" (x : real; y : data_t) return boolean;

  function "<" (x : data_t; y : real) return boolean;
  
  function "<" (x : data_t; y : data_t) return boolean;
  
  function "<" (x : integer; y : data_t) return data_t;

  function "<" (x : data_t; y : integer) return data_t;

  function "<" (x : real; y : data_t) return data_t;

  function "<" (x : data_t; y : real) return data_t;
  
  function "<" (x : data_t; y : data_t) return data_t;
  
  function "<" (x : integer; y : data_array) return data_array;

  function "<" (x : data_array; y : integer) return data_array;

  function "<" (x : real; y : data_array) return data_array;
  
  function "<" (x : data_array; y : real) return data_array;

  function "<" (x : data_array; y : data_array) return data_array;


  function "<=" (x : integer; y : data_t) return boolean;

  function "<=" (x : data_t; y : integer) return boolean;

  function "<=" (x : real; y : data_t) return boolean;

  function "<=" (x : data_t; y : real) return boolean;

  function "<=" (x : data_t; y : data_t) return boolean;
  
  function "<=" (x : integer; y : data_t) return data_t;

  function "<=" (x : data_t; y : integer) return data_t;

  function "<=" (x : real; y : data_t) return data_t;

  function "<=" (x : data_t; y : real) return data_t;
  
  function "<=" (x : data_t; y : data_t) return data_t;
  
  function "<=" (x : integer; y : data_array) return data_array;

  function "<=" (x : data_array; y : integer) return data_array;

  function "<=" (x : real; y : data_array) return data_array;
  
  function "<=" (x : data_array; y : real) return data_array;

  function "<=" (x : data_array; y : data_array) return data_array;

  
  function ">" (x : integer; y : data_t) return boolean;

  function ">" (x : data_t; y : integer) return boolean;

  function ">" (x : real; y : data_t) return boolean;

  function ">" (x : data_t; y : real) return boolean;

  function ">" (x : data_t; y : data_t) return boolean;
  
  function ">" (x : integer; y : data_t) return data_t;

  function ">" (x : data_t; y : integer) return data_t;

  function ">" (x : real; y : data_t) return data_t;

  function ">" (x : data_t; y : real) return data_t;
  
  function ">" (x : data_t; y : data_t) return data_t;
  
  function ">" (x : integer; y : data_array) return data_array;

  function ">" (x : data_array; y : integer) return data_array;

  function ">" (x : real; y : data_array) return data_array;
  
  function ">" (x : data_array; y : real) return data_array;

  function ">" (x : data_array; y : data_array) return data_array;

  
  function ">=" (x : integer; y : data_t) return boolean;

  function ">=" (x : data_t; y : integer) return boolean;

  function ">=" (x : real; y : data_t) return boolean;

  function ">=" (x : data_t; y : real) return boolean;

  function ">=" (x : data_t; y : data_t) return boolean;
  
  function ">=" (x : integer; y : data_t) return data_t;

  function ">=" (x : data_t; y : integer) return data_t;

  function ">=" (x : real; y : data_t) return data_t;

  function ">=" (x : data_t; y : real) return data_t;
  
  function ">=" (x : data_t; y : data_t) return data_t;
  
  function ">=" (x : integer; y : data_array) return data_array;

  function ">=" (x : data_array; y : integer) return data_array;

  function ">=" (x : real; y : data_array) return data_array;
  
  function ">=" (x : data_array; y : real) return data_array;

  function ">=" (x : data_array; y : data_array) return data_array;


  function "+" (x : data_t; y : data_t) return data_t;

  function "+" (x : data_array; y : data_array) return data_array;

  function "+" (x : data_array) return data_t;
  

  function "-" (x : data_t) return data_t;

  function "-" (x : data_t; y : data_t) return data_t;

  function "-" (x : data_array; y : data_array) return data_array;
  

  function "*" (x : data_t; y : data_t) return data_t;
  
  function "*" (x : data_array; y : data_array) return data_array;
  

  function "/" (x : data_t; y : data_t) return data_t;
  
  function "/" (x : data_array; y : data_array) return data_array;


  function "**" (x : data_t; y : integer) return data_t;
  
  function "**" (x : data_t; y : real) return data_t;
  
  function "**" (x : data_array; y : integer) return data_array;
  
  function "**" (x : data_array; y : real) return data_array;
  

  function "abs" (x : data_t) return data_t;
  
  function "abs" (x : data_array) return data_array;
  

  -- Absolute difference.
  
  function abs_diff(x : data_t; y : data_t) return data_t;
  
  function abs_diff(x : data_array; y : data_array) return data_array;


  -- Relative error.
  
  function relative_error(desired : data_t; actual : data_t) return data_t;


-------------------------------------------------------------------------------

  -- Return `0` if the `actual` data point has a tolerable amount of error,
  -- when compared to the `desired` data point; return `1` otherwise.
  --
  -- For single-precision floating-point data, a relative error of up to
  -- `0.000001` is tolerated, and if the relative error is `1` (i.e.,
  -- `desired`is nonzero and `actual` is zero), an absolute error of
  -- `0.000001` is tolerated.
  --
  -- For double-precision floating-point data, a relative error of up to
  -- `0.000000000001`, and if the relative error is `1` (i.e., `desired`
  -- is nonzero and `actual` is zero), an absolute error of `0.000000000001`
  -- is tolerated.
  --
  -- For integer data, only an exact result is tolerated.
  function validate(desired : data_t; actual : data_t) return natural;


  -- Return `n-t` if there are `t` of `n` data points in the `actual` array
  -- that have a tolerable amount of error, when compared to the `desired`
  -- array. It must be ensured that the lengths of the arrays are equivalent.
  --
  -- The relevant tolerances are identical to the above `validate` function.
  function validate(desired : data_array; actual : data_array) return natural;

  
end package;


package body math_pkg is
  
  function clog2(input : positive) return natural is
  begin
    return natural(ceil(log2(real(input))));
  end function;

  
  function clog2_pos(input : positive) return positive is
    variable temp   : natural;
    variable logVal : natural;
  begin
    if (input = 1) then
      return 1;
    else
      return positive(ceil(log2(real(input))));
    end if;
  end function;

  
  function clog(input : positive; base : positive) return natural is
  begin
    return natural(ceil(log(real(input),real(base))));
  end function;

  
  function clog_pos(input : positive; base : positive) return positive is
    variable temp   : natural;
    variable logVal : natural;
  begin
    if (input = 1) then
      return 1;
    else
      return positive(ceil(log(real(input),real(base))));
    end if;
  end function;

  
  function n_bits_value(value : natural) return positive is
  begin
    return clog2_pos(value+1);
  end function;

  
  function n_bits_amount(amount : positive) return positive is
  begin
    return clog2_pos(amount);
  end function;
  

  function is_power_of_two(input : natural) return boolean is
    variable width : positive := n_bits_value(input);
  begin
    if (input = 0) then
      return false;
    else
      return
        (unsigned(std_logic_vector(to_unsigned(input, width)) and
                  std_logic_vector(to_unsigned(input-1, width))) =
         to_unsigned(0, width));
    end if;
  end function;


-------------------------------------------------------------------------------

  
  function get_addition_output_type(
    input1_type : type_t; input2_type : type_t) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (are_same_base_type(input1_type, input2_type)) then

      if (are_float(input1_type, input2_type)) then

        -- The output type for floating-point addition does not
        -- change from the input types.
        result := input1_type;

      elsif (are_integer(input1_type, input2_type)) then

        -- The output type bit-width for integer addition grows by
        -- one from the maximum of the two input type bit-widths.
        result := init_type(get_integer_encoding(input1_type),
                            maximum(get_width(input1_type),
                                    get_width(input2_type))+1,
                            is_signed(input1_type));

      end if;

    end if;

    return result;

  end function;


  function get_addition_output_type(input_type : type_t) return type_t is
  begin
    return get_addition_output_type(input_type, input_type);
  end function;


  
  function get_subtraction_output_type(
    input1_type : type_t; input2_type : type_t) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (are_same_base_type(input1_type, input2_type)) then

      if (are_float(input1_type, input2_type)) then

        -- The output type for floating-point subtraction does not
        -- change from the input types.
        result := input1_type;

      elsif (are_integer(input1_type, input2_type)) then

        -- The output type bit-width for integer subtraction grows by one
        -- from the maximum of the two input type bit-widths, with this
        -- extra bit representing a sign bit. (Subtraction between two
        -- unsigned numbers could result in a negative number.)
        result := int_type(
          maximum(get_width(input1_type), get_width(input2_type))+1);

      end if;

    end if;

    return result;

  end function;


  function get_subtraction_output_type(input_type : type_t) return type_t is
  begin
    return get_subtraction_output_type(input_type, input_type);
  end function;



  function get_multiplication_output_type(
    input1_type : type_t; input2_type : type_t) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (are_same_base_type(input1_type, input2_type)) then

      if (are_float(input1_type, input2_type)) then

        -- The output type for floating-point multiplication does not
        -- change from the input types.
        result := input1_type;

      elsif (are_integer(input1_type, input2_type)) then

        -- The output type bit-width for integer multiplication is
        -- the addition of the two input type bit-widths.
        result := init_type(get_integer_encoding(input1_type),
                            get_width(input1_type)+get_width(input2_type),
                            is_signed(input1_type));

      end if;

    end if;

    return result;

  end function;
  
  
  function get_multiplication_output_type(input_type : type_t) return type_t is
  begin
    return get_multiplication_output_type(input_type, input_type);
  end function;



  function get_division_output_type(
    input1_type : type_t; input2_type : type_t) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (are_same_base_type(input1_type, input2_type)) then

      if (are_float(input1_type, input2_type)) then

        -- The output type for floating-point division does not
        -- change from the input types.
        result := input1_type;

      elsif (are_integer(input1_type, input2_type)) then

        -- The output type for integer division is the type of the
        -- first input (i.e., the dividend), since the quotient will
        -- never be more than the dividend, excluding the possibility
        -- in which the divisor is zero.
        result := input1_type;

      end if;

    end if;

    return result;

  end function;
  

  function get_division_output_type(input_type : type_t) return type_t is
  begin
    return get_division_output_type(input_type, input_type);
  end function;



  function get_accumulation_output_type(
    input_type : type_t; num_inputs : natural) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (num_inputs > 0) then
      -- Due to a generic recursion implemented for an accumulator entity,
      -- it is possible for this function to be called with `num_inputs`
      -- set equal to zero. The return value of the function in this
      -- case is arbitrary for the relevant entity.
      
      if (is_float(input_type)) then

        -- The output type for floating-point accumulation does not
        -- change from the input type.
        result := input_type;

      else
        
        -- The output type bit-width for integer accumulation grows
        -- from the input type bit-width by the ceiling of the base-two
        -- logarithm of the number of inputs.
        result := init_type(get_integer_encoding(input_type),
                            get_width(input_type)+clog2(num_inputs),
                            is_signed(input_type));

        
      end if;

    end if;

    return result;

  end function;


  
  function get_multiply_accumulation_output_type(
    input1_type : type_t;
    input2_type : type_t;
    num_input_pairs : positive) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (are_same_base_type(input1_type, input2_type)) then

      if (are_float(input1_type, input2_type)) then

        -- The output type for floating-point multiplication does not
        -- change from the input types.
        result := input1_type;

      elsif (are_integer(input1_type, input2_type)) then

        -- The output type bit-width for integer multiply-accumulation is
        -- the addition of the two input type bit-widths, plus the ceiling
        -- of the base-two logarithm of the number of input pairs, to
        -- account for the multiplication and accumulation, respectively.
        result := init_type(
          get_integer_encoding(input1_type),
          get_width(input1_type)+get_width(input2_type)+clog2(num_input_pairs),
          is_signed(input1_type));

      end if;

    end if;

    return result;

  end function;


  function get_multiply_accumulation_output_type(
    input_type : type_t;
    num_input_pairs : positive) return type_t is
  begin
    return get_multiply_accumulation_output_type(
      input_type, input_type, num_input_pairs);
  end function;

  

  function get_absolute_value_output_type(input_type : type_t) return type_t is

    variable result : type_t := NO_TYPE;

  begin

    if (is_float(input_type)) then

      -- The output type for floating-point absolute value does not
      -- change from the input type.
      result := input_type;

    elsif (is_integer(input_type)) then

      if (is_unsigned_integer(input_type)) then

        -- The output type does not change from the input type.
        result := input_type;

      else

        -- The output type bit-width shrinks by one bit, since
        -- the sign bit is not needed.
        result := uint_type(get_width(input_type)-1);

      end if;

    end if;

    return result;

  end function;  


-------------------------------------------------------------------------------


  function "=" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) = to_real(y));
  end function;

  function "=" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) = to_real(y));
  end function;

  function "=" (x : real; y : data_t) return boolean is
  begin
    return (x = to_real(y));
  end function;

  function "=" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) = y);
  end function;

  function "=" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) = to_real(y));
  end function;

  
  function "=" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;


  function "=" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;


  function "=" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;
  

  function "=" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;

  
  function "=" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;


  function "=" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x = y(i));
    end loop;

    return result;

  end function;


  function "=" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) = y);
    end loop;

    return result;

  end function;
  

  function "=" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x = y(i));
    end loop;

    return result;

  end function;


  function "=" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) = y);
    end loop;

    return result;

  end function;


  function "=" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) = y(i));
    end loop;

    return result;

  end function;


  
  function "/=" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) /= to_real(y));
  end function;

  function "/=" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) /= to_real(y));
  end function;

  function "/=" (x : real; y : data_t) return boolean is
  begin
    return (x /= to_real(y));
  end function;

  function "/=" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) /= y);
  end function;

  
  function "/=" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x /= y));
    
  end function;


  function "/=" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x /= y));
    
  end function;


  function "/=" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x /= y));
    
  end function;
  

  function "/=" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x /= y));
    
  end function;

  
  function "/=" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) /= to_real(y));
  end function;

  
  function "/=" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x /= y));
    
  end function;
  

  function "/=" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x /= y(i));
    end loop;

    return result;

  end function;


  function "/=" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) /= y);
    end loop;

    return result;

  end function;
  

  function "/=" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x /= y(i));
    end loop;

    return result;

  end function;


  function "/=" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) /= y);
    end loop;

    return result;

  end function;


  function "/=" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) /= y(i));
    end loop;

    return result;

  end function;

  
  function "<" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) < to_real(y));
  end function;

  function "<" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) < to_real(y));
  end function;

  function "<" (x : real; y : data_t) return boolean is
  begin
    return (x < to_real(y));
  end function;

  function "<" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) < y);
  end function;

  function "<" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) < to_real(y));
  end function;


  function "<" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x < y));
    
  end function;


  function "<" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x < y));
    
  end function;


  function "<" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x < y));
    
  end function;
  

  function "<" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x < y));
    
  end function;

  
  function "<" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x < y));
    
  end function;
  

  function "<" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x < y(i));
    end loop;

    return result;

  end function;


  function "<" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) < y);
    end loop;

    return result;

  end function;
  

  function "<" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x < y(i));
    end loop;

    return result;

  end function;


  function "<" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) < y);
    end loop;

    return result;

  end function;


  function "<" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) < y(i));
    end loop;

    return result;

  end function;
  

  function "<=" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) <= to_real(y));
  end function;

  function "<=" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) <= to_real(y));
  end function;

  function "<=" (x : real; y : data_t) return boolean is
  begin
    return (x <= to_real(y));
  end function;

  function "<=" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) <= y);
  end function;

  function "<=" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) <= to_real(y));
  end function;


  function "<=" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x <= y));
    
  end function;


  function "<=" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x <= y));
    
  end function;


  function "<=" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x <= y));
    
  end function;
  

  function "<=" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x <= y));
    
  end function;

  
  function "<=" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x <= y));
    
  end function;
  

  function "<=" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x <= y(i));
    end loop;

    return result;

  end function;


  function "<=" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) <= y);
    end loop;

    return result;

  end function;
  

  function "<=" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x <= y(i));
    end loop;

    return result;

  end function;


  function "<=" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) <= y);
    end loop;

    return result;

  end function;


  function "<=" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) <= y(i));
    end loop;

    return result;

  end function;

  
  function ">" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) > to_real(y));
  end function;

  function ">" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) > to_real(y));
  end function;

  function ">" (x : real; y : data_t) return boolean is
  begin
    return (x > to_real(y));
  end function;

  function ">" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) > y);
  end function;

  function ">" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) > to_real(y));
  end function;


  function ">" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x > y));
    
  end function;


  function ">" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x > y));
    
  end function;


  function ">" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x > y));
    
  end function;
  

  function ">" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x > y));
    
  end function;

  
  function ">" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x > y));
    
  end function;
  

  function ">" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x > y(i));
    end loop;

    return result;

  end function;


  function ">" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) > y);
    end loop;

    return result;

  end function;
  

  function ">" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x > y(i));
    end loop;

    return result;

  end function;


  function ">" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) > y);
    end loop;

    return result;

  end function;


  function ">" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) > y(i));
    end loop;

    return result;

  end function;


  
  function ">=" (x : integer; y : data_t) return boolean is
  begin
    return (to_real(x) >= to_real(y));
  end function;

  function ">=" (x : data_t; y : integer) return boolean is
  begin
    return (to_real(x) >= to_real(y));
  end function;

  function ">=" (x : real; y : data_t) return boolean is
  begin
    return (x >= to_real(y));
  end function;

  function ">=" (x : data_t; y : real) return boolean is
  begin
    return (to_real(x) >= y);
  end function;

  function ">=" (x : data_t; y : data_t) return boolean is
  begin
    return (to_real(x) >= to_real(y));
  end function;

  
  function ">=" (x : integer; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x = y));
    
  end function;


  function ">=" (x : data_t; y : integer) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x >= y));
    
  end function;


  function ">=" (x : real; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x >= y));
    
  end function;
  

  function ">=" (x : data_t; y : real) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x >= y));
    
  end function;

  
  function ">=" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t := bool_t;
    
  begin
    
    return init_data(output_type, (x >= y));
    
  end function;
  

  function ">=" (x : integer; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x >= y(i));
    end loop;

    return result;

  end function;


  function ">=" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) >= y);
    end loop;

    return result;

  end function;
  

  function ">=" (x : real; y : data_array) return data_array is

    constant num_elements : positive := y'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x >= y(i));
    end loop;

    return result;

  end function;


  function ">=" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) >= y);
    end loop;

    return result;

  end function;


  function ">=" (x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := bool_t;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := (x(i) >= y(i));
    end loop;

    return result;

  end function;

  
  function "+" (x : data_t; y : data_t) return data_t is

    --constant data : data_array := to_needed_precision(x, y);
    --constant data_type : type_t := get_type(data(0));
    --constant width : positive := get_width(data(0));

    constant output_type : type_t :=
      get_addition_output_type(get_type(x), get_type(y));
    
  begin

    assert(output_type /= NO_TYPE) report "Addition cannot be directly " &
      "performed between the given data types." severity error;

    if ((is_not_a_number(x) or is_not_a_number(y)) or
        (is_negative_infinity(x) and is_positive_infinity(y)) or
        (is_positive_infinity(x) and is_negative_infinity(y))) then
          
      return get_not_a_number(output_type);
      
    elsif (is_infinity(x)) then

      return x;

    elsif (is_infinity(y)) then

      return y;

    elsif (is_negative_zero(x) and is_negative_zero(y)) then

      return get_negative_zero(output_type);

    else
      
      return init_data(output_type, to_real(x) + to_real(y));

    end if;

  end function;

  
  function "+" (x : data_array; y : data_array) return data_array is

    constant num_elements_x : positive := x'length;
    constant num_elements_y : positive := y'length;
    
    constant num_elements : positive := num_elements_x;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type and that all elements of `y` have
    -- the same data type.

    constant output_type : type_t :=
      get_addition_output_type(get_type(x(0)), get_type(y(0)));
    
    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    assert(num_elements_x = num_elements_y) report "The given data arrays " &
      "do not have the same number of elements; cannot perform addition."
      severity error;

    assert(output_type /= NO_TYPE) report "Addition cannot be directly " &
      "performed between the given data types." severity error;

    
    for i in 0 to num_elements-1 loop
      result(i) := x(i)+y(i);
    end loop;
    
    return result;

  end function;


  function "+" (x : data_array) return data_t is

    constant num_elements : positive := x'length;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type.
    
    constant output_type : type_t :=
      get_accumulation_output_type(get_type(x(0)), num_elements);

    constant output_width : natural := get_width(output_type);

    variable result_real : real := 0.0;
    
  begin

    for i in 0 to num_elements-1 loop
      result_real := result_real + to_real(x(i));
    end loop;
    
    return init_data(output_type, result_real);

  end function;



  function "-" (x : data_t) return data_t is

    constant data_type : type_t := get_type(x);
    constant data_width : positive := get_width(data_type);

    constant input : std_logic_vector(data_width-1 downto 0) :=
      get_value(x);

    constant output : std_logic_vector(data_width-1 downto 0) :=
      (input(data_width-1) xor '1') & input(data_width-2 downto 0);

  begin

    if (is_not_a_number(x)) then
      return get_quiet_not_a_number(data_type);
    elsif (is_negative_infinity(x)) then
      return get_positive_infinity(data_type);
    elsif (is_positive_infinity(x)) then
      return get_negative_infinity(data_type);
    else
      return set_data(x, output);
    end if;

  end function;
  
  
  
  function "-" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t :=
      get_subtraction_output_type(get_type(x), get_type(y));
    
  begin

    assert(output_type /= NO_TYPE) report "Subtraction cannot be directly " &
      "performed between the given data types." severity error;

    if ((is_not_a_number(x) or is_not_a_number(y)) or
        (is_negative_infinity(x) and is_negative_infinity(y)) or
        (is_positive_infinity(x) and is_positive_infinity(y))) then

      return get_not_a_number(output_type);
    
    elsif (is_infinity(x)) then
          
      return x;
      
    elsif (is_infinity(y)) then

      if (is_positive_infinity(y)) then

        return get_negative_infinity(output_type);

      else

        return get_positive_infinity(output_type);

      end if;

    elsif (is_negative_zero(x) and is_positive_zero(y)) then

      return get_negative_zero(output_type);

    else

      return init_data(output_type, to_real(x) - to_real(y));

    end if;

  end function;

  
  function "-" (x : data_array; y : data_array) return data_array is

    constant num_elements_x : positive := x'length;
    constant num_elements_y : positive := y'length;
    
    constant num_elements : positive := num_elements_x;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type and that all elements of `y` have
    -- the same data type.

    constant output_type : type_t :=
      get_subtraction_output_type(get_type(x(0)), get_type(y(0)));
    
    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    assert(num_elements_x = num_elements_y) report "The given data arrays " &
      "do not have the same number of elements; cannot perform subtraction."
      severity error;

    assert(output_type /= NO_TYPE) report "Subtraction cannot be directly " &
      "performed between the given data types." severity error;
    

    for i in 0 to num_elements-1 loop
      result(i) := x(i)-y(i);
    end loop;
    
    return result;

  end function;



  function "*" (x : data_t; y : data_t) return data_t is

    constant output_type : type_t :=
      get_multiplication_output_type(get_type(x), get_type(y));
    
  begin

    assert(output_type /= NO_TYPE) report "Multiplication cannot be directly " &
      "performed between the given data types." severity error;


    if ((is_infinity(x) and is_zero(y)) or
        (is_zero(x) and is_infinity(y))) then

      return get_not_a_number(output_type);

    elsif ((is_negative_infinity(x) and is_negative(y)) or
           (is_positive_infinity(x) and is_positive(y)) or
           (is_negative_infinity(y) and is_negative(x)) or
           (is_positive_infinity(y) and is_positive(x))) then

      return get_positive_infinity(output_type);

    elsif ((is_negative_infinity(x) and is_positive(y)) or
           (is_positive_infinity(x) and is_negative(y)) or
           (is_negative_infinity(y) and is_positive(x)) or
           (is_positive_infinity(y) and is_negative(x))) then

      return get_negative_infinity(output_type);

    elsif ((is_positive_zero(x) and is_negative(y)) or
           (is_positive_zero(y) and is_negative(x)) or
           (is_negative_zero(x) and is_positive(y)) or
           (is_negative_zero(y) and is_positive(x))) then

      return get_negative_zero(output_type);

    else

      return init_data(output_type, to_real(x) * to_real(y));

    end if;

  end function;

  
  function "*" (x : data_array; y : data_array) return data_array is

    constant num_elements_x : positive := x'length;
    constant num_elements_y : positive := y'length;
    
    constant num_elements : positive := num_elements_x;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type and that all elements of `y` have
    -- the same data type.

    constant output_type : type_t :=
      get_multiplication_output_type(get_type(x(0)), get_type(y(0)));

    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    assert(num_elements_x = num_elements_y) report "The given data arrays " &
      "do not have the same number of elements; cannot perform multiplication."
      severity error;

    assert(output_type /= NO_TYPE) report "Multiplication cannot be directly " &
      "performed between the given data types." severity error;


    for i in 0 to num_elements-1 loop
      result(i) := x(i)*y(i);
    end loop;
    
    return result;

  end function;



  function "/" (x : data_t; y : data_t) return data_t is
    
    constant output_type : type_t :=
      get_division_output_type(get_type(x), get_type(y));
    
  begin

    assert(output_type /= NO_TYPE) report "Division cannot be directly " &
      "performed between the given data types." severity error;

    if ((is_not_a_number(x) or is_not_a_number(y)) or
        (is_zero(x) and is_zero(y)) or
        (is_infinity(x) and is_infinity(y))) then

      return get_quiet_not_a_number(output_type);

    elsif (is_infinity(x)) then

      if ((is_positive(x) and is_positive(y)) or
          (is_negative(x) and is_negative(y))) then

        return get_positive_infinity(output_type);

      else

        return get_negative_infinity(output_type);

      end if;

    elsif (is_infinity(y)) then

      if ((is_positive(x) and is_positive(y)) or
          (is_negative(x) and is_negative(y))) then

        return get_positive_zero(output_type);

      else

        return get_negative_zero(output_type);

      end if;

    elsif (is_zero(x)) then

      if ((is_negative(x) and is_negative(y)) or
          (is_positive(x) and is_positive(y))) then

        return get_positive_zero(output_type);

      else

        return get_negative_zero(output_type);

      end if;

    elsif (is_zero(y)) then

      if ((is_negative(x) and is_negative(y)) or
          (is_positive(x) and is_positive(y))) then

        return get_positive_infinity(output_type);
        
      else
        
        return get_negative_infinity(output_type);
        
      end if;

    else
      
      return init_data(output_type, to_real(x) / to_real(y));

    end if;

  end function;

  
  function "/" (x : data_array; y : data_array) return data_array is

    constant num_elements_x : positive := x'length;
    constant num_elements_y : positive := y'length;
    
    constant num_elements : positive := num_elements_x;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type and that all elements of `y` have
    -- the same data type.

    constant output_type : type_t :=
      get_division_output_type(get_type(x(0)), get_type(y(0)));

    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    assert(num_elements_x = num_elements_y) report "The given data arrays " &
      "do not have the same number of elements; cannot perform division."
      severity error;

    assert(output_type /= NO_TYPE) report "Division cannot be directly " &
      "performed between the given data types." severity error;

    for i in 0 to num_elements-1 loop
      result(i) := x(i)/y(i);
    end loop;
    
    return result;

  end function;



  function "**" (x : data_t; y : integer) return data_t is
  begin
    return set_data(x, to_real(x)**y);
  end function;

  
  function "**" (x : data_t; y : real) return data_t is
  begin
    return set_data(x, to_real(x)**y);
  end function;

  
  function "**" (x : data_array; y : integer) return data_array is

    constant num_elements : positive := x'length;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type.
    
    constant output_type : type_t := get_type(x(0));
    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := x(i)**y;
    end loop;

    return result;
    
  end function;


  function "**" (x : data_array; y : real) return data_array is

    constant num_elements : positive := x'length;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type.
    
    constant output_type : type_t := get_type(x(0));
    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    for i in 0 to num_elements-1 loop
      result(i) := x(i)**y;
    end loop;

    return result;
    
  end function;


  function "abs" (x : data_t) return data_t is
    
    constant output_type : type_t :=
      get_absolute_value_output_type(get_type(x));
    
    constant output_width : positive := get_width(output_type);

    constant data : std_logic_vector(output_width-1 downto 0) :=
      '0' & get_value(x)(output_width-2 downto 0);

  begin

    return init_data(output_type, data);
    
  end function;


  function "abs" (x : data_array) return data_array is

    constant num_elements : positive := x'length;

    -- Currently, for simplicity, it is assumed that all elements of
    -- `x` have the same data type.
    
    constant output_type : type_t :=
      get_absolute_value_output_type(get_type(x(0)));
    
    constant output_width : natural := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));

  begin

    for i in 0 to num_elements-1 loop
      result(i) := abs(x(i));
    end loop;

    return result;
    
  end function;



  function abs_diff(x : data_t; y : data_t) return data_t is
  begin
    return abs(x-y);
  end function;


  
  function abs_diff(x : data_array; y : data_array) return data_array is

    constant num_elements : positive := x'length;

    constant output_type : type_t := x(0).data_type;
    constant output_width : positive := get_width(output_type);

    variable result : data_array(0 to num_elements-1)(
      value(output_width-1 downto 0));
    
  begin

    assert (x'length = y'length) report "The given data arrays do not " &
      "have the same length; cannot evaluate absolute differences."
      severity error;

    for i in 0 to num_elements-1 loop
      result(i) := abs(x(i)-y(i));
    end loop;

    return result;
    
  end function;



  function absolute_error(desired : data_t; actual : data_t) return data_t is
  begin
    return abs_diff(desired, actual);
  end function;


  
  function relative_error(desired : data_t; actual : data_t) return data_t is

    constant output_type : type_t := get_type(desired);
    
    variable err : real;
    
  begin

    assert(are_same(get_type(desired), get_type(actual)) = true) report
      "The given types are not the same; cannot calculate relative error."
      severity error;

    
    if ((is_positive_infinity(desired) and is_positive_infinity(actual)) or
        (is_negative_infinity(desired) and is_negative_infinity(actual)) or
        (is_quiet_not_a_number(desired) and is_quiet_not_a_number(actual)) or
        (is_signaling_not_a_number(desired) and
         is_signaling_not_a_number(actual))) then

      err := 0.0;

    elsif ((is_infinity(desired) or is_infinity(actual)) or
           (is_not_a_number(desired) and is_not_a_number(actual))) then
      
      -- Infinite error.
      
      err := real'high;

    elsif (to_real(desired) = 0.0) then
      -- Cannot perform standard relative error operation, since that
      -- would result in dividing by zero.
      
      if (to_real(actual) = 0.0) then
        -- No error.
        err := 0.0;
      else
        -- Infinite error.
        err := real'high;
      end if;
      
    else

      err := to_real(abs_diff(desired, actual) / abs(desired));

    end if;


    return init_data(output_type, err);
    
  end function;


-------------------------------------------------------------------------------

  function validate(desired : data_t; actual : data_t) return natural is

    constant data_type : type_t := get_type(desired);
    
    variable num_errors : natural := 0;
    
  begin

    if (is_float32(data_type)) then
      -- For single-precision floating-point data, allow a relative
      -- error of up to 0.000001, and if the relative error is
      -- 1 (i.e., `desired` is nonzero and `actual` is zero),
      -- allow an absolute error of 0.000001.

      if ((relative_error(desired, actual) > 0.000001) and
          (absolute_error(desired, actual) > 0.000001)) then        
        num_errors := num_errors + 1;
      end if;
        
      
    elsif (is_float64(data_type)) then
      -- For double-precision floating-point data, allow a relative
      -- error of up to 0.000000000001, and if the relative
      -- error is 1 (i.e., `desired` is nonzero and `actual` is
      -- zero), allow an absolute error of 0.000000000001.

      if ((relative_error(desired, actual) > 0.000000000001) and
          (absolute_error(desired, actual) > 0.000000000001)) then        
        num_errors := num_errors + 1;
      end if;

      
    elsif (is_integer(data_type)) then
      -- For integer data, only an exact result is tolerated.

      if (relative_error(desired, actual) /= 0.0) then        
        num_errors := num_errors + 1;
      end if;
        
    end if;
    

    return num_errors;
    
  end function;

  

  function validate(desired : data_array; actual : data_array) return natural is

    constant data_type : type_t := get_type(desired(0));
    
    constant num_elements : positive := desired'length;
    
    variable num_errors : natural := 0;

  begin


    -- Validate the given output.

    if (is_float32(data_type)) then
      -- For single-precision floating-point data, allow a relative
      -- error of up to 0.000001 for each output, and if the
      -- relative error is 1 (i.e., `desired` is nonzero and
      -- `actual` is zero), allow an absolute error of 0.000001.

      for i in 0 to num_elements-1 loop
        
      if ((relative_error(desired(i), actual(i)) > 0.000001) and
          (absolute_error(desired(i), actual(i)) > 0.000001)) then        
          num_errors := num_errors + 1;
        end if;
        
      end loop;

      
    elsif (is_float64(data_type)) then
      -- For double-precision floating-point data, allow a relative
      -- error of up to 0.000000000001 for each output, and
      -- if the relative error is 1 (i.e., `desired` is nonzero
      -- and `actual` is zero), then allow an absolute error of
      -- 0.000000000001.

      for i in 0 to num_elements-1 loop
        
      if ((relative_error(desired(i), actual(i)) > 0.000000000001) and
          (absolute_error(desired(i), actual(i)) > 0.000000000001)) then        
          num_errors := num_errors + 1;
        end if;
        
      end loop;

      
    elsif (is_integer(data_type)) then
      -- For integer data, only an exact result is tolerated.

      for i in 0 to num_elements-1 loop
        
        if (relative_error(desired(i), actual(i)) /= 0.0) then        
          num_errors := num_errors + 1;
        end if;
        
      end loop;
      
    end if;

    
    return num_errors;
    
  end function;

  
end package body;

