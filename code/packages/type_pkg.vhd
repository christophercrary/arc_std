-- ****************************************************************************
-- type_pkg.vhd --
--
--     Various declarations related to data types.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 30, 2021
-- ****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.float_pkg.all;

library arc_std;
use arc_std.extended_float_pkg.all;

package type_pkg is
  
    -- General data type encodings.
    
    type integer_encoding_t is (none_t, standard_t);

    type float_encoding_t is (none_t, ieee754_t); --, flopoco_t);

    
    -- Record to represent generic data types.
    --
    -- To better ensure that this record type is correctly initialized, the
    -- `init_type` functions (or some wrapper of these functions), defined
    -- further below within this file, should always be utilized.
    --
    -- To further simplify some definitions for this record type, certain
    -- constants (and wrapper functions) have been devised further within
    -- this file.
    type type_t is record
        
        -- Data members utilized by all data types.
        width : natural;
        is_signed : boolean;

        -- Data member only utilized by integer types.
        integer_encoding : integer_encoding_t;

        -- Data members only utilized by floating-point types.
        float_encoding : float_encoding_t;
        exponent_width : natural;
        fraction_width : natural;
        
    end record;

    
    -- Type to semantically represent the absence of a data type.
    constant NO_TYPE : type_t;

    -- Type to semantically represent a Boolean (single-bit) data type.
    constant BOOL_T : type_t;

    -- Type to semantically represent a `std_logic` (single-bit) data type.
    constant STD_LOGIC_T : type_t;

    -- Type to semantically represent an unsigned 8-bit data type.
    constant UINT8_T : type_t;

    -- Type to semantically represent an unsigned 16-bit data type.
    constant UINT16_T : type_t;

    -- Type to semantically represent an unsigned 32-bit data type.
    constant UINT32_T : type_t;
    
    -- Type to semantically represent a signed 8-bit data type.
    constant INT8_T : type_t;

    -- Type to semantically represent a signed 16-bit data type.
    constant INT16_T : type_t;

    -- Type to semantically represent a signed 32-bit data type.
    constant INT32_T : type_t;

    -- Type to semantically represent a `binary32` (single-precision)
    -- floating-point value, defined by the IEEE-754 standard.
    constant FLOAT32_T : type_t;

    -- Type to semantically represent a `binary64` (double-precision)
    -- floating-point value, defined by the IEEE-754 standard.
    constant FLOAT64_T : type_t;


    -- Array of "data types," originally created so that every element of a
    -- "tuple" (see below) could be associated with any of the supported 
    -- data types in synthesizable code.
    type type_array is array(natural range<>) of type_t;


    -- Type to represent generic tuples consisting of binary data.
    -- In mathematics, a "tuple" is a finite ordered list of elements.
    --
    -- In theory, the elements of a tuple can come from literally any possible
    -- set, but we limit our below definition to include only elements from the
    -- set of possible bitstrings. Although restrictive in the theoretical sense,
    -- this definition is quite extensive within the realm of digital logic.
    type tuple_t is array(natural range<>) of std_logic_vector;

    type tuple_array is array(natural range<>) of tuple_t;

    type tuple_array_array is array(natural range<>) of tuple_array;


    --------------------------------------------------------------------

    -- Generic retrieval functions.

    function get_width(data_type : type_t) return natural;

    function get_is_signed(data_type : type_t) return boolean;

    function get_integer_encoding(data_type : type_t) return integer_encoding_t;

    function get_float_encoding(data_type : type_t) return float_encoding_t;

    function get_exponent_width(data_type : type_t) return natural;

    function get_fraction_width(data_type : type_t) return natural;


    -- Return the least-significant `get_width(input_type)` bits from `input`
    -- if these relevant data do not represent a denormal number for type 
    -- `input_type`; otherwise, return zero for the type `input_type`.
    function get_data(
        input : std_logic_vector; input_type : type_t) return std_logic_vector;


    -- Return the first data type from the given `data_types` array that
    -- has the largest bit-width of all elements within the array.
    function get_largest_type(data_types : type_array) return type_t;


    -- Return the maximum data width of all types specified within the
    -- given `data_types` array.
    function get_max_width(data_types : type_array) return natural;
    

    
    -- Functions to return a `std_logic_vector` representing certain special
    -- values defined based on the specified data type.
    
    function get_negative_zero(data_type : type_t) return std_logic_vector;

    function get_positive_zero(data_type : type_t) return std_logic_vector;

    function get_zero(data_type : type_t) return std_logic_vector;
    
    function get_negative_one(data_type : type_t) return std_logic_vector;

    function get_positive_one(data_type : type_t) return std_logic_vector;

    function get_one(data_type : type_t) return std_logic_vector;

    function get_negative_infinity(data_type : type_t) return std_logic_vector;

    function get_positive_infinity(data_type : type_t) return std_logic_vector;

    function get_not_a_number(data_type : type_t) return std_logic_vector;
    
    function get_quiet_not_a_number(data_type : type_t) return std_logic_vector;

    function get_signaling_not_a_number(
        data_type : type_t) return std_logic_vector;
        
    --------------------------------------------------------------------
    
    -- Return an integer type, based on the provided integer encoding
    -- (`encoding`), bit-width (`width`), and signedness (`is_signed`).
    
    function init_type(
        encoding : integer_encoding_t;
        width : natural;
        is_signed : boolean := false)
    return type_t;


    -- Return a floating-point type, based on the provided
    -- floating-point encoding (`encoding`), exponent width
    -- (`exponent_width`), fraction width (`fraction_width`),
    -- and signedness (`is_signed`).
    
    function init_type(
        encoding : float_encoding_t;
        exponent_width : natural;
        fraction_width : natural;
        is_signed : boolean := true)
    return type_t;

    

    -- Return a `type_array` type with `num_elements` elements, all
    -- initialized with the same data type, `data_type`.
    
    function init_type_array(
        data_type : type_t;
        num_elements : positive) return type_array;
        

        
    -- Return a `type_array` type with a single element, initialized with 
    -- the specified data type, `data_type`.

    function init_type_array(data_type : type_t) return type_array;



    -- Return an unsigned integer type of the specified width.
    
    function uint_type(width : natural) return type_t;


    -- Return a signed integer type of the specified width.

    function int_type(width : natural) return type_t;

    
    --------------------------------------------------------------------

    -- The following functions check whether or not a data type meets some
    -- criteria. It is assumed that the relevant data type has been correctly
    -- initialized, e.g., via the above `init_type` functions.

        
    -- Return `true` if the specified data type has the characteristics of
    -- a signed data type; return `false` otherwise.

    function is_signed(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an unsigned data type; return `false` otherwise.
    
    function is_unsigned(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- a floating-point type; return `false` otherwise.

    function is_float(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an IEEE-754 floating-point type; return `false` otherwise.

    function is_ieee754(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an IEEE-754 `binary32` (single-precision) floating-point type;
    -- return `false` otherwise.

    function is_ieee754_binary32(data_type : type_t) return boolean;


    -- Wrapper of the `is_ieee754_binary32` function.

    function is_float32(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an IEEE-754 `binary64` (double-precision) floating-point type;
    -- return `false` otherwise.

    function is_ieee754_binary64(data_type : type_t) return boolean;

    
    -- Wrapper of the `is_ieee754_binary64` function.

    function is_float64(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an integer type; return `false` otherwise.

    function is_integer(data_type : type_t) return boolean;

    
    -- Return `true` if the specified data type has the characteristics of
    -- a signed integer type; return `false` otherwise.

    function is_signed_integer(data_type : type_t) return boolean;


    -- Return `true` if the specified data type has the characteristics of
    -- an unsigned integer type; return `false` otherwise.

    function is_unsigned_integer(data_type : type_t) return boolean;
    

    -- Return `true` if the two specified data types have the same
    -- bit-width; return `false` otherwise.
    
    function have_same_width(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types both have the
    -- characteristics of a signed type; return `false` otherwise.
    
    function are_signed(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types both have the
    -- characteristics of an unsigned type; return `false` otherwise.
    
    function are_unsigned(
        data_type1 : type_t; data_type2 : type_t) return boolean;

    
    -- Return `true` if the two specified data types have the
    -- same "signedness", that is, that they are either both signed
    -- or both unsigned; return `false` otherwise.
    
    function have_same_signedness(
        data_type1 : type_t; data_type2 : type_t) return boolean;

    
    -- Return `true` if the two specified data types have the same
    -- integer encoding; return `false` otherwise.

    function have_same_integer_encoding(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the same
    -- floating-point encoding; return `false` otherwise.
    
    function have_same_float_encoding(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the same
    -- floating-point exponent width; return `false` otherwise.
    
    function have_same_exponent_width(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the same
    -- floating-point fraction width; return `false` otherwise.
    
    function have_same_fraction_width(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of a floating-point type; return `false`
    -- otherwise.
    
    function are_float(
        data_type1 : type_t; data_type2 : type_t) return boolean;
    

    -- Return `true` if the two specified data types have the
    -- characteristics of an IEEE-754 floating-point type;
    -- return `false` otherwise.
    
    function are_ieee754(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of an IEEE-754 `binary32` (single-precision)
    -- floating-point type; return `false` otherwise.
    
    function are_ieee754_binary32(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Wrapper of the `are_ieee754_binary32` function.
    
    function are_float32(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of an IEEE-754 `binary64` (double-precision)
    -- floating-point type; return `false` otherwise.
    
    function are_ieee754_binary64(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Wrapper of the `are_ieee754_binary64` function.
    
    function are_float64(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of an integer type; return `false` otherwise.
    
    function are_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of a signed integer; return `false` otherwise.
    
    function are_signed_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types have the
    -- characteristics of an unsigned integer; return `false` otherwise.
    
    function are_unsigned_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types are the
    -- same "floating-point base type", that is, they are both
    -- floating-point, they have the same floating-point encoding,
    -- and they have same signedness; return `false` otherwise.
    
    function are_same_float_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types are the
    -- same "integer base type", that is, they are both integers,
    -- they have the same integer encoding, and they have the
    -- same signedness; return `false` otherwise.
    
    function are_same_integer_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types are the
    -- same "base type", that is, they either are the same
    -- floating-point base type or the same integer base type;
    -- return `false` otherwise.
    
    function are_same_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the the two specified data types are
    -- the same floating-point type, that is, they are the
    -- same floating-point base type and they have both the
    -- same exponent width and the same fraction width (which
    -- implies that they have the same bit-width); return
    -- `false` otherwise.

    function are_same_float(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types are the
    -- same integer type, that is, they are the same integer
    -- base type and they have the same bit-width; return
    -- `false` otherwise.
    
    function are_same_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean;


    -- Return `true` if the two specified data types are the
    -- same type, that is, they are either the same integer
    -- type or the same floating-point type.
    function are_same(
        data_type1 : type_t; data_type2 : type_t) return boolean;
    
    --------------------------------------------------------------------
    
    -- Functions to determine if a `std_logic_vector` representing
    -- a value of type `input_type` fits some criteria.
    --
    -- For each of these functions, the least-significant `get_width(data_type)`
    -- bits of the given `input` vector are taken to represent the relevant data.

    function is_denormal(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_denormal(input : real) return boolean;

    
    function is_negative(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_positive(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_less_than_or_equal_to_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_less_than_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_greater_than_or_equal_to_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_greater_than_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_negative_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_positive_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_zero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_nonzero(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_negative_one(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_positive_one(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_one(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_negative_infinity(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_positive_infinity(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_infinity(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_quiet_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_signaling_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean;

    
    function is_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean; 

    --------------------------------------------------------------------

    -- Conversion functions.
    --
    -- For any of these functions that take a `std_logic_vector` input, the
    -- least-significant `get_width(data_type)` bits of the given `input`
    -- vector are taken to represent the relevant data.

    
    -- Type `unsigned` to `unsigned`, where `input` is resized to have
    -- a width of `output_width`.
    function to_unsigned(
        input : unsigned; output_width : natural) return unsigned;

    
    -- Type `signed` to `unsigned`.
    function to_unsigned(
        input : signed; output_width : natural) return unsigned;

    
    -- Type `real` to `unsigned`.
    function to_unsigned(
        input : real; output_width : natural) return unsigned;

    
    -- Type `boolean` to `unsigned`.
    function to_unsigned(
        input : boolean; output_width : natural) return unsigned;
    

    
    -- Type `unsigned` to `signed`.
    function to_signed(
        input : unsigned; output_width : natural) return signed;

    
    -- Type `signed` to `signed`, where `input` is resized to have
    -- a width of `output_width`.
    function to_signed(
        input : signed; output_width : natural) return signed;

    
    -- Type `real` to `signed`.
    function to_signed(
        input : real; output_width : natural) return signed;

    
    -- Type `boolean` to `signed`.
    function to_signed(
        input : boolean; output_width : natural) return signed;
    

    
    -- Type `integer` to `integer`. Defined for completeness.
    function to_integer(input : integer) return integer;
    

    -- Type `real` to `integer`.
    function to_integer(input : real) return integer;

    
    -- Type `boolean` to `integer`.
    function to_integer(input : boolean) return integer;

    
    -- `std_logic_vector` representing data of type `input_type` to `integer`.
    function to_integer(
        input : std_logic_vector; input_type : type_t) return integer;


    -- `std_logic_vector` to "unsigned" `integer`, i.e., the given vector
    -- is interpreted as an unsigned value.
    function to_unsigned_integer(input : std_logic_vector) return integer;


    -- `std_logic_vector` to "signed" `integer`, i.e., the given vector
    -- is interpreted as a signed value.
    function to_signed_integer(input : std_logic_vector) return integer;


    -- Type `unsigned` to `integer`.
    function to_real(input : unsigned) return real;

    
    -- Type `signed` to `real`.
    function to_real(input : signed) return real;

    
    -- Type `integer` to `real`.
    function to_real(input : integer) return real;

    
    -- Type `real` to `real`. Defined for completeness.
    function to_real(input : real) return real;

    
    -- Type `boolean` to `real`.
    function to_real(input : boolean) return real;

    
    -- `std_logic_vector` representing data of type `input_type` to `real`.
    function to_real(
        input : std_logic_vector; input_type : type_t) return real;

    function to_sl(input : boolean) return std_logic;

    -- Wrapper functions for the `std_logic_vector` casting
    -- functions defined by the `ieee.numeric_std` package.
    
    function to_slv(input : unsigned) return std_logic_vector;

    
    function to_slv(input : signed) return std_logic_vector;

    
    
    -- Functions to return a `std_logic_vector` that represents the type
    -- `output_type` from the given input of the specified type.

    -- Unsigned to `output_type`.
    function to_slv(
        output_type : type_t; input : unsigned) return std_logic_vector;

    
    -- Signed to `output_type`.
    function to_slv(
        output_type : type_t; input : signed) return std_logic_vector;

    
    -- Integer to `output_type`.
    function to_slv(
        output_type : type_t; input : integer) return std_logic_vector;

    
    -- Real to `output_type`.
    function to_slv(
        output_type : type_t; input : real) return std_logic_vector;

    
    -- Boolean to `output_type`, where `false` represents zero and
    -- `true` represents one. 
    function to_slv(
        output_type : type_t; input : boolean) return std_logic_vector;

    
    -- `std_logic_vector` representing data of type `input_type` to `output_type`.
    function to_slv(
        output_type : type_t;
        input : std_logic_vector;
        input_type : type_t) return std_logic_vector;


    --------------------------------------------------------------------
    --------------------------------------------------------------------
    --------------------------------------------------------------------

    -- Some other miscellaneous type declarations.
    
    type integer_array is array(integer range<>) of integer;
    
    type natural_array is array(integer range<>) of natural;
    
    type positive_array is array(integer range<>) of positive;
    
    type boolean_array is array(integer range<>) of boolean;

    type real_array is array(integer range<>) of real;


    -- Record to simplify the manipulation of some strings.
    --
    -- Some of the `to_string` functions defined further below
    -- are to initialize this record type.
    type string_t is record
        str : string;
        len : natural; -- String length.
    end record;


    type string_array is array(natural range<>) of string_t;

    --------------------------------------------------------------------
    
    -- Some generalized maximum/minimum functions.
    
    function minimum(data : integer_array) return integer;

    function minimum(data : natural_array) return integer;

    function minimum(data : positive_array) return integer;

    function minimum(x, y : integer) return integer;

    function maximum(data : integer_array) return integer;

    function maximum(data : natural_array) return integer;

    function maximum(data : positive_array) return integer;

    function maximum(x, y : integer) return integer;



    -- Return a string record for the given input string, with
    -- `len` characters allocated for the relevant string array.
    function to_string_record(str : string; len : positive) return string_t;


    -- Wrapper for the above function, to be used when the length of the
    -- given input string is to dictate the number of characters allocated
    -- for the relevant string array.
    function to_string_record(str : string) return string_t;

    
    -- Return a string record for the given `input` vector based on the
    -- specified `input_type`.
    --
    -- This function will likely not need to be directly utilized by a user.
    function to_string_record(
        input : std_logic_vector; input_type : type_t) return string_t;


    -- Return a string record for the concatenation of string representations
    -- of each element of `input`, with the start of the relevant string
    -- prefixed by `start_delimiter`, the end of the string suffixed by
    -- `end_delimiter`, and each element delimited from one another by
    -- `internal_delimiter`. (A single space also automatically follows
    -- `internal_delimiter`.)
    --
    -- It must be ensured that `input_types` has the same length as `input`,
    -- and it is expected that every element `i`, `0 <= i <= input'length-1`,
    -- of `input` is of type `input_type(i)`.
    --
    -- This function will likely not need to be directly utilized by a user.
    function to_string_record(
        input : tuple_t;
        input_types : type_array;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string_t;


    -- Wrapper for the above `to_string` function, to be used when all
    -- elements of the given `input` array share the same data type, `input_type`.
    --
    -- This function will likely not need to be directly utilized by a user.
    function to_string_record(
        input : tuple_t;
        input_type : type_t;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string_t;


    -- Return a string representation of the given string record.
    function to_string(str_rec : string_t) return string;


    -- Wrapper of the `integer'image` attribute.
    function to_string(data : integer) return string;


    -- Wrapper of the `real'image` attribute.
    function to_string(data : real) return string;

    
    -- Return a string representation of `input` based on the specified
    -- `input_type`.
    function to_string(
        input : std_logic_vector; input_type : type_t) return string;


    -- Return a string containing the concatenation of string representations
    -- for each element of `input`, with the start of the string prefixed by
    -- `start_delimiter`, the end of the string suffixed by `end_delimiter`,
    -- and each element delimited from one another by `internal_delimiter`.
    -- (A single space also automatically follows `internal_delimiter`.)
    --
    -- It must be ensured that `input_types` has the same length as `input`,
    -- and it is expected that every element `i`, `0 <= i <= input'length-1`,
    -- of `input` is of type `input_type(i)`.
    function to_string(
        input : tuple_t;
        input_types : type_array;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string;


    -- Wrapper for the above `to_string` function, to be used when all
    -- elements of the given `input` array share the same input type,
    -- `input_type`.
    function to_string(
        input : tuple_t;
        input_type : type_t;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string;
    

    -- Another wrapper for the above `to_string` function, with `start_delimiter`
    -- assigned "(", `internal_delimiter` assigned ",", and `end_delimiter`
    -- assigned ")".
    function to_string(
        input : tuple_t; input_types : type_array) return string;


    -- Same as the above wrapper, except that all elements of the given `input`
    -- array are to have the same data type, `input_type`.
    function to_string(
        input : tuple_t; input_type : type_t) return string;


    -- Same as the above wrapper, except that there is an extra dimension
    -- of data.
    function to_string(
        data : tuple_array; data_type : type_t) return string;
    

    --------------------------------------------------------------------
    --------------------------------------------------------------------
    --------------------------------------------------------------------


    -- Record to store useful criteria about a singular piece of data.
    -- In general, this record will only be useful for simulation purposes.
    --
    -- The `init_data` and `set_data` functions, defined further below
    -- within this file, are to be used to configure the data members
    -- of this record type.
    type data_t is record

        data_type : type_t;

        -- The least-significant `data_type.width` bits of the following
        -- are meant to store the current value of the relevant data.    
        value : std_logic_vector;
        
    end record;


    -- Array of "data records."
    --
    -- The `init_data_array` function, defined further below,
    -- is meant to initialize this array type.
    type data_array is array(natural range<>) of data_t;

    --------------------------------------------------------------------
    
    -- Generic retrieval functions.

    function get_type(data : data_t) return type_t;


    function get_width(data : data_t) return natural;


    function get_value(data : data_t) return std_logic_vector;

    --------------------------------------------------------------------

    -- Special value retrieval functions.
    
    function get_negative_zero(data_type : type_t) return data_t;


    function get_positive_zero(data_type : type_t) return data_t;


    function get_zero(data_type : type_t) return data_t;


    function get_negative_one(data_type : type_t) return data_t;


    function get_positive_one(data_type : type_t) return data_t;


    function get_one(data_type : type_t) return data_t;


    function get_negative_infinity(data_type : type_t) return data_t;


    function get_positive_infinity(data_type : type_t) return data_t;


    function get_quiet_not_a_number(data_type : type_t) return data_t;


    function get_signaling_not_a_number(data_type : type_t) return data_t;


    function get_not_a_number(data_type : type_t) return data_t;

    
    --------------------------------------------------------------------

    -- Type conditional functions.

    function is_signed(data : data_t) return boolean;


    function is_unsigned(data : data_t) return boolean;
    

    function is_float(data : data_t) return boolean;


    function is_ieee754(data : data_t) return boolean;
    

    function is_ieee754_binary32(data : data_t) return boolean;


    function is_float32(data : data_t) return boolean;
    

    function is_ieee754_binary64(data : data_t) return boolean;


    function is_float64(data : data_t) return boolean;
    

    function is_integer(data : data_t) return boolean;


    function is_signed_integer(data : data_t) return boolean;
    

    function is_unsigned_integer(data : data_t) return boolean;

    --------------------------------------------------------------------

    -- Value conditional functions.

    function is_denormal(data : data_t) return boolean;


    function is_negative(data : data_t) return boolean;
    
        
    function is_positive(data : data_t) return boolean;
    
        
    function is_less_than_or_equal_to_zero(data : data_t) return boolean;


    function is_less_than_zero(data : data_t) return boolean;
    
        
    function is_greater_than_or_equal_to_zero(data : data_t) return boolean;
    
        
    function is_greater_than_zero(data : data_t) return boolean;


    function is_negative_zero(data : data_t) return boolean;


    function is_positive_zero(data : data_t) return boolean;


    function is_zero(data : data_t) return boolean;


    function is_nonzero(data : data_t) return boolean;
    
        
    function is_negative_one(data : data_t) return boolean;
    
        
    function is_positive_one(data : data_t) return boolean;
    
        
    function is_one(data : data_t) return boolean;


    function is_negative_infinity(data : data_t) return boolean;


    function is_positive_infinity(data : data_t) return boolean;


    function is_infinity(data : data_t) return boolean;
    
        
    function is_quiet_not_a_number(data : data_t) return boolean;
    
        
    function is_signaling_not_a_number(data : data_t) return boolean;


    function is_not_a_number(data : data_t) return boolean;

    --------------------------------------------------------------------

    -- Return `data_t` record type with the `value` member updated to be the
    -- given `value` vector. It is expected that the given `data_t` has already
    -- been initialized via the `init_data` function.
    
    function set_data(
        data : data_t; value : std_logic_vector) return data_t;
    

    -- Same as above, except that the `value` argument is an `integer` that
    -- will be converted into a `std_logic_vector` representing the type
    -- `get_type(data)`.
    
    function set_data(
        data : data_t; value : integer) return data_t;


    
    -- Same as above, except that the `value` argument is a `real` that
    -- will be converted into a `std_logic_vector` representing the type
    -- `get_type(data)`.
    
    function set_data(
        data : data_t; value : real) return data_t;
    

    
    -- Return a `data_t` type, initialized with the specified data type,
    -- `data_type`, and value, `value`.
    
    function init_data(
        data_type : type_t; value : std_logic_vector) return data_t;


    
    -- Same as above, except that the `value` argument is absent, ultimately
    -- causing the internal `value` data member of the relevant data record
    -- to be uninitialized, i.e., set to `(others => 'X')`. 
    
    function init_data(data_type : type_t) return data_t;


    
    -- Same as above, except that the `value` argument is an `integer` that
    -- will be converted into a `std_logic_vector` representing the type
    -- `data_type`.
    
    function init_data(
        data_type : type_t; value : integer) return data_t;


    
    -- Same as above, except that the `value` argument is an `real` that
    -- will be converted into a `std_logic_vector` representing the type
    -- `data_type`.
    
    function init_data(
        data_type : type_t; value : real) return data_t;


    
    -- Same as above, except that the `value` argument is a `boolean` that
    -- will be converted into a `std_logic_vector` representing the type
    -- `data_type`.
    
    function init_data(
        data_type : type_t; value : boolean) return data_t;


    
    -- Return a `data_array`, where element `i`, `0 <= i < values'length`,
    -- of the array is a `data_t` record whose data type is defined by
    -- `data_types(i)` and whose value is defined by `values(i)`.
    
    function init_data_array(
        data_types : type_array; values : tuple_t) return data_array;
    

    
    -- Same as above function, but every value is to have the same
    -- data type, `data_type`.
    
    function init_data_array(
        data_type : type_t; values : tuple_t) return data_array;


    
    -- Same as above, except that the `values` argument is absent, ultimately
    -- causing the internal `value` data member of each relevant data record
    -- to be uninitialized, i.e., set to `(others => 'X')`. 
    
    function init_data_array(data_types : type_array) return data_array;


    
    -- Same as the above wrapper, but every element of the relevant array
    -- is to share the same data type. As such, the size of the array must
    -- be explicitly given to this function, via `num_elements`.
    
    function init_data_array(
        data_type : type_t; num_elements : positive) return data_array;


    --------------------------------------------------------------------

    -- Conversion functions.

    function to_real_array(data : integer_array) return real_array;

    function to_real_array(data : natural_array) return real_array;

    function to_integer_array(data : real_array) return integer_array;

    -- function to_natural_array(data : real_array) return natural_array;

    
    function to_tuple(data : data_t) return tuple_t;

    function to_tuple(data : data_array) return tuple_t;

    
    function to_integer(data : data_t) return integer;

    
    function to_real(data : data_t) return real;


    function to_type(data_type : type_t; data : data_t) return data_t;


    function to_slv(data : data_t) return std_logic_vector;

    
    function to_string(data : data_t) return string;

    
    function to_string(data : data_array) return string;

    
    function ifte(condition : boolean; x, y : integer) return integer;

    -- Function to vectorize tuple into a single `std_logic_vector`.
    function vectorize(
        input : tuple_t; data_type : type_t) return std_logic_vector;

    -- Function to devectorize `std_logic_vector` into a tuple.
    function devectorize(
        input : std_logic_vector; data_type : type_t) return tuple_t;


end package;


package body type_pkg is


    function get_width(data_type : type_t) return natural is
    begin
        return data_type.width;
    end function;


    function get_is_signed(data_type : type_t) return boolean is
    begin
        return data_type.is_signed;
    end function;
    

    function get_integer_encoding(data_type : type_t) return integer_encoding_t is
    begin
        return data_type.integer_encoding;
    end function;


    function get_float_encoding(data_type : type_t) return float_encoding_t is
    begin
        return data_type.float_encoding;
    end function;


    function get_exponent_width(data_type : type_t) return natural is
    begin
        return data_type.exponent_width;
    end function;


    function get_fraction_width(data_type : type_t) return natural is
    begin
        return data_type.fraction_width;
    end function;
    
    
    function get_data(
        input : std_logic_vector; input_type : type_t) return std_logic_vector is
        
        constant data_width : natural := get_width(input_type);
        constant input_width : positive := input'length;
        
    begin

        assert (data_width > 0) report "Data cannot be represented by a type " &
        "whose width is zero." severity failure;
        
        assert (input_width >= data_width) report "The given input cannot " 
        & "be represented by the given data type; it has a length that is not "
        & "at least the width of the data type." severity failure;
        
        if (is_denormal(input, input_type)) then
        return get_zero(input_type);
        else
        return input(data_width-1 downto 0);
        end if;
        
    end function;


    
    function get_largest_type(data_types : type_array) return type_t is

        constant num_elements : positive := data_types'length;

        constant low : integer := data_types'low;
        constant high : integer := data_types'high;    
        
        variable largest_data_type : type_t := data_types(low);

    begin

        if (num_elements > 1) then
        for i in low+1 to high loop
            if (get_width(data_types(i)) > get_width(largest_data_type)) then
            largest_data_type := data_types(i);
            end if;
        end loop;
        end if;

        return largest_data_type;
        
    end function;

    

    function get_max_width(data_types : type_array) return natural is
    begin
        return get_width(get_largest_type(data_types));
    end function;  
    
    --------------------------------------------------------------------

    -- Special value retrieval functions.
    
    function get_negative_zero(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_NEGATIVE_ZERO;
        elsif(is_float64(data_type)) then
        result := FLOAT64_NEGATIVE_ZERO;
        else
        result := to_slv(data_type, 0);
        end if;

        return result;

    end function;
    


    function get_positive_zero(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_POSITIVE_ZERO;
        elsif (is_float64(data_type)) then
        result := FLOAT64_POSITIVE_ZERO;
        else
        result := to_slv(data_type, 0);
        end if;

        return result;

    end function;



    function get_zero(data_type : type_t) return std_logic_vector is
    begin
        return get_positive_zero(data_type);
    end function;



    function get_negative_one(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_NEGATIVE_ONE;
        elsif(is_float64(data_type)) then
        result := FLOAT64_NEGATIVE_ONE;
        else
        result := to_slv(data_type, -1);
        end if;

        return result;

    end function;


    
    function get_positive_one(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_POSITIVE_ONE;
        elsif(is_float64(data_type)) then
        result := FLOAT64_POSITIVE_ONE;
        else
        result := to_slv(data_type, 1);
        end if;

        return result;

    end function;


    
    function get_one(data_type : type_t) return std_logic_vector is
    begin
        return get_positive_one(data_type);
    end function;


    
    function get_negative_infinity(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_NEGATIVE_INFINITY;
        elsif (is_float64(data_type)) then
        result := FLOAT64_NEGATIVE_INFINITY;
        elsif (is_unsigned_integer(data_type)) then
        result := (others => '0');
        else
        result := (others => '0');
        result(data_width-1) := '1';
        end if;

        return result;

    end function;


    
    function get_positive_infinity(data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_POSITIVE_INFINITY;
        elsif (is_float64(data_type)) then
        result := FLOAT64_POSITIVE_INFINITY;
        elsif (is_unsigned_integer(data_type)) then
        result := (others => '1');
        else
        result := (others => '1');
        result(data_width-1) := '0';
        end if;

        return result;

    end function;


    
    function get_quiet_not_a_number(
        data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_QUIET_NOT_A_NUMBER;
        elsif (is_float64(data_type)) then
        result := FLOAT64_QUIET_NOT_A_NUMBER;
        else
        result := to_slv(data_type, 0);
        end if;

        return result;

    end function;


    
    function get_signaling_not_a_number(
        data_type : type_t) return std_logic_vector is

        constant data_width : positive := get_width(data_type);
        
        variable result : std_logic_vector(data_width-1 downto 0);
        
    begin
        
        if (is_float32(data_type)) then
        result := FLOAT32_SIGNALING_NOT_A_NUMBER;
        elsif (is_float64(data_type)) then
        result := FLOAT64_SIGNALING_NOT_A_NUMBER;
        else
        result := to_slv(data_type, 0);
        end if;

        return result;
        
    end function;


    
    function get_not_a_number(data_type : type_t) return std_logic_vector is
    begin
        -- Default "NaN" value is set to be equal to the default "sNaN"
        -- (i.e., signaling NaN) value, since this is how the VHDL
        -- `IEEE` library seems to define it.
        return get_signaling_not_a_number(data_type);
    end function;
    
    
    --------------------------------------------------------------------

    function init_type(
        encoding : integer_encoding_t;
        width : natural;
        is_signed : boolean := false) return type_t is

        variable result : type_t;
        
    begin

        result.width := width;
        result.is_signed := is_signed;
        
        result.integer_encoding := encoding;
        result.float_encoding := none_t;
        
        result.exponent_width := 0;
        result.fraction_width := 0;

        return result;

    end function;

    

    function init_type(
        encoding : float_encoding_t;
        exponent_width : natural;
        fraction_width : natural;
        is_signed : boolean := true) return type_t is

        variable sign_width : natural := 0;
        variable exception_width : natural := 0;
        
        variable result : type_t;
        
    begin

        if (is_signed) then
        sign_width := 1;
        end if;
        
        result.width := sign_width + exception_width +
                        exponent_width + fraction_width;
        
        result.is_signed := is_signed;

        result.integer_encoding := none_t;
        result.float_encoding := encoding;

        result.exponent_width := exponent_width;
        result.fraction_width := fraction_width;

        return result;
        
    end function;



    function init_type_array(
        data_type : type_t;
        num_elements : positive) return type_array is
        
        constant res : type_array(0 to num_elements-1) := (others => data_type);
        
    begin
        
        return res;
        
    end function;
    

    
    function init_type_array(data_type : type_t) return type_array is
        
        constant res : type_array(0 to 0) := (0 => data_type);
        
    begin
        
        return res;
        
    end function;



    function uint_type(width : natural) return type_t is
    begin
        return init_type(standard_t, width, false);
    end function;



    function int_type(width : natural) return type_t is
    begin
        return init_type(standard_t, width, true);
    end function;

    
    --------------------------------------------------------------------

    
    constant NO_TYPE : type_t := uint_type(0);

    constant BOOL_T : type_t := uint_type(1);

    constant STD_LOGIC_T : type_t := uint_type(1);

    constant UINT8_T : type_t := uint_type(8);

    constant UINT16_T : type_t := uint_type(16);

    constant UINT32_T : type_t := uint_type(32);
    
    constant INT8_T : type_t := int_type(8);

    constant INT16_T : type_t := int_type(16);

    constant INT32_T : type_t := int_type(32);

    constant FLOAT32_T : type_t := init_type(
        ieee754_t, FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH);

    constant FLOAT64_T : type_t := init_type(
        ieee754_t, FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH);

    
    --------------------------------------------------------------------

    
    function is_signed(data_type : type_t) return boolean is
    begin
        return get_is_signed(data_type);
    end function;
    

    function is_unsigned(data_type : type_t) return boolean is
    begin
        return (not is_signed(data_type));
    end function;
    
    
    function is_float(data_type : type_t) return boolean is
    begin
        return (get_float_encoding(data_type) /= none_t);
    end function;

    
    function is_ieee754(data_type : type_t) return boolean is
    begin
        return (get_float_encoding(data_type) = ieee754_t); 
    end function;

    
    function is_ieee754_binary32(data_type : type_t) return boolean is
    begin
        return ((is_ieee754(data_type)) and
                (get_exponent_width(data_type) = FLOAT32_EXP_WIDTH) and
                (get_fraction_width(data_type) = FLOAT32_FRAC_WIDTH));
    end function;

    
    function is_float32(data_type : type_t) return boolean is
    begin
        return is_ieee754_binary32(data_type);
    end function;


    function is_ieee754_binary64(data_type : type_t) return boolean is
    begin
        return ((is_ieee754(data_type)) and
                (get_exponent_width(data_type) = FLOAT64_EXP_WIDTH) and
                (get_fraction_width(data_type) = FLOAT64_FRAC_WIDTH));
    end function;


    function is_float64(data_type : type_t) return boolean is
    begin
        return is_ieee754_binary64(data_type);
    end function;

    
    function is_integer(data_type : type_t) return boolean is
    begin
        return (get_integer_encoding(data_type) /= none_t);
    end function;

    
    function is_signed_integer(data_type : type_t) return boolean is
    begin
        return (is_integer(data_type) and is_signed(data_type));
    end function;

    
    function is_unsigned_integer(data_type : type_t) return boolean is
    begin
        return (is_integer(data_type) and is_unsigned(data_type));
    end function;

    
    function have_same_width(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (get_width(data_type1) = get_width(data_type2));
    end function;


    function are_signed(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_signed(data_type1) and is_signed(data_type2));
    end function;  


    function are_unsigned(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_unsigned(data_type1) and is_unsigned(data_type2));
    end function;  


    function have_same_signedness(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_unsigned(data_type1, data_type2) or
                are_signed(data_type1, data_type2));
    end function;


    function have_same_integer_encoding(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (get_integer_encoding(data_type1) =
                get_integer_encoding(data_type2));
    end function;


    function have_same_float_encoding(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (get_float_encoding(data_type1) = get_float_encoding(data_type2));
    end function;


    function have_same_exponent_width(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (get_exponent_width(data_type1) = get_exponent_width(data_type2));
    end function;


    function have_same_fraction_width(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (get_fraction_width(data_type1) = get_fraction_width(data_type2));
    end function;


    function are_float(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_float(data_type1) and is_float(data_type2));
    end function;
    

    function are_ieee754(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_ieee754(data_type1) and is_ieee754(data_type2));
    end function;


    function are_ieee754_binary32(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_ieee754_binary32(data_type1) and
                is_ieee754_binary32(data_type2));
    end function;
        

    function are_float32(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return are_ieee754_binary32(data_type1, data_type2);
    end function;
    

    function are_ieee754_binary64(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_ieee754_binary64(data_type1) and
                is_ieee754_binary64(data_type2));
    end function;
        
    
    function are_float64(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return are_ieee754_binary64(data_type1, data_type2);
    end function;


    function are_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_integer(data_type1) and is_integer(data_type2));
    end function;


    function are_signed_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_signed_integer(data_type1) and is_signed_integer(data_type2));
    end function;    


    function are_unsigned_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (is_unsigned_integer(data_type1) and
                is_unsigned_integer(data_type2));
    end function;


    function are_same_float_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_float(data_type1, data_type2) and
                have_same_float_encoding(data_type1, data_type2) and
                have_same_signedness(data_type1, data_type2));
    end function;


    function are_same_integer_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_integer(data_type1, data_type2) and
                have_same_integer_encoding(data_type1, data_type2) and
                have_same_signedness(data_type1, data_type2));
    end function;


    function are_same_base_type(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_same_float_base_type(data_type1, data_type2) or
                are_same_integer_base_type(data_type1, data_type2));
    end function;


    function are_same_float(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_same_float_base_type(data_type1, data_type2) and
                have_same_width(data_type1, data_type2) and
                have_same_exponent_width(data_type1, data_type2) and
                have_same_fraction_width(data_type1, data_type2));
    end function;


    function are_same_integer(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_same_integer_base_type(data_type1, data_type2) and
                have_same_width(data_type1, data_type2));
    end function;


    function are_same(
        data_type1 : type_t; data_type2 : type_t) return boolean is
    begin
        return (are_same_float(data_type1, data_type2) or
                are_same_integer(data_type1, data_type2));
    end function;

    --------------------------------------------------------------------

    function is_denormal(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data_width : natural := get_width(input_type);
        constant input_width : positive := input'length;

        variable result : boolean;

    begin

        assert (data_width > 0) report "Data cannot be represented by a type " &
        "whose width is zero." severity failure;
    
        assert (input_width >= data_width) report "The given input cannot " 
        & "be represented by the given data type; it has a length that is not "
        & "at least the width of the data type." severity failure;

        if (is_float32(input_type)) then
        
        if ((input(F32_EXP_HIGH downto F32_EXP_LOW) = F32_EXP_ZERO) and
            (input(F32_FRAC_HIGH downto F32_FRAC_LOW) /= F32_FRAC_ZERO)) then
            result := true;
        else
            result := false;
        end if;

        elsif (is_float64(input_type)) then

        if ((input(F64_EXP_HIGH downto F64_EXP_LOW) = F64_EXP_ZERO) and
            (input(F64_FRAC_HIGH downto F64_FRAC_LOW) /= F64_FRAC_ZERO)) then
            result := true;
        else
            result := false;
        end if;

        else

        result := false;
        
        end if;
        
        return result;
        
    end function;


    function is_denormal(input : real) return boolean is

        constant data : std_logic_vector(FLOAT64_WIDTH-1 downto 0) :=
        to_slv(to_float(input, F64_EW, F64_FW));

    begin

        return is_denormal(data, float64_t);

    end function;

    
    function is_negative(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);
        
    begin

        if (is_unsigned(input_type)) then

        return false;

        else

        if (data(data'left) = '1') then
            return true;
        else
            return false;
        end if;

        end if;

    end function;


    function is_positive(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);
        
    begin

        if (is_unsigned(input_type)) then

        return true;

        else
        
        if (data(data'left) = '0') then
            return true;
        else
            return false;
        end if;

        end if;
        
    end function;


    function is_less_than_or_equal_to_zero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_negative(input, input_type) or
                is_zero(input, input_type));
    end function;


    function is_less_than_zero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_negative(input, input_type) and
                not is_zero(input, input_type));
    end function;


    function is_greater_than_or_equal_to_zero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_positive(input, input_type) or
                is_zero(input, input_type));
    end function;


    function is_greater_than_zero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_positive(input, input_type) and
                not is_zero(input, input_type));
    end function;


    function is_negative_zero(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;
        
    begin
        
        if (is_float32(input_type)) then
        
        if (data = FLOAT32_NEGATIVE_ZERO) then
            result := true;
        else
            result := false;
        end if;
        
        elsif (is_float64(input_type)) then

        if (data = FLOAT64_NEGATIVE_ZERO) then
            result := true;
        else
            result := false;
        end if;

        else

        if (data = to_slv(input_type, 0)) then
            result := true;
        else
            result := false;
        end if;
        
        end if;
                
        return result;
        
    end function;

    
    function is_positive_zero(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;
        
    begin
        
        if (is_float32(input_type)) then
        
        if (data = FLOAT32_POSITIVE_ZERO) then
            result := true;
        else
            result := false;
        end if;
        
        elsif (is_float64(input_type)) then

        if (data = FLOAT64_POSITIVE_ZERO) then
            result := true;
        else
            result := false;
        end if;

        else

        if (data = to_slv(input_type, 0)) then
            result := true;
        else
            result := false;
        end if;
        
        end if;

        return result;
        
    end function;


    function is_zero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_positive_zero(input, input_type) or
                is_negative_zero(input, input_type));   
    end function;

    
    function is_nonzero(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (not is_zero(input, input_type));   
    end function;


    function is_negative_one(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;
        
    begin

        if (is_unsigned(input_type)) then

        return false;

        else
        
        if (is_float32(input_type)) then
            
            if (data = FLOAT32_NEGATIVE_ONE) then
            result := true;
            else
            result := false;
            end if;
            
        elsif (is_float64(input_type)) then

            if (data = FLOAT64_NEGATIVE_ONE) then
            result := true;
            else
            result := false;
            end if;

        else

            if (data = to_slv(input_type, -1)) then
            result := true;
            else
            result := false;
            end if;
            
        end if;

        end if;

        return result;
        
    end function;


    function is_positive_one(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;
        
    begin
        
        if (is_float32(input_type)) then
        
        if (data = FLOAT32_POSITIVE_ONE) then
            result := true;
        else
            result := false;
        end if;
        
        elsif (is_float64(input_type)) then

        if (data = FLOAT64_POSITIVE_ONE) then
            result := true;
        else
            result := false;
        end if;

        else

        if (data = to_slv(input_type, 1)) then
            result := true;
        else
            result := false;
        end if;
        
        end if;      
        
        return result;
        
    end function;


    function is_one(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_positive_one(input, input_type) or
                is_negative_one(input, input_type));   
    end function;


    function is_negative_infinity(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);
        
        variable result : boolean;
        
    begin
        
        if (is_float32(input_type)) then
        
        if (data = FLOAT32_NEGATIVE_INFINITY) then
            result := true;
        else
            result := false;
        end if;
        
        elsif (is_float64(input_type)) then

        if (data = FLOAT64_NEGATIVE_INFINITY) then
            result := true;
        else
            result := false;
        end if;

        else

        result := false;
        
        end if;
        
        return result;
        
    end function;


    function is_positive_infinity(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;
        
    begin
        
        if (is_float32(input_type)) then
        
        if (data = FLOAT32_POSITIVE_INFINITY) then
            result := true;
        else
            result := false;
        end if;
        
        elsif (is_float64(input_type)) then

        if (data = FLOAT64_POSITIVE_INFINITY) then
            result := true;
        else
            result := false;
        end if;

        else

        result := false;
                    
        end if;
        
        return result;
        
    end function;


    function is_infinity(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_positive_infinity(input, input_type) or
                is_negative_infinity(input, input_type));   
    end function;


    function is_quiet_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);
        
        variable result : boolean;

    begin

        -- The below encoding of the "signaling NaN" for the 
        -- floating-point types is generally swapped with that 
        -- of the encoding of the "quiet NaN" given in the
        -- `is_quiet_not_a_number` function of this file; for some 
        -- unknown reason, the `ieee.generic_pkg` package defines 
        -- these two NaN values in the way given within these two 
        -- functions.

        if (is_float32(input_type)) then
        
        if ((('0' & data(30 downto 0)) >= x"7F800001") and
            (('0' & data(30 downto 0)) <= x"7FBFFFFF")) then
            result := true;
        else
            result := false;
        end if;

        elsif (is_float64(input_type)) then

        if ((('0' & data(62 downto 0)) >= x"7FF0000000000001") and
            (('0' & data(62 downto 0)) <= x"7FF7FFFFFFFFFFFF")) then
            result := true;
        else
            result := false;
        end if;


        else

        result := false;

        end if;

        return result;
        
    end function;
    

    function is_signaling_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean is

        constant data : std_logic_vector := get_data(input, input_type);

        variable result : boolean;

    begin

        -- The below encoding of the "signaling NaN" for the 
        -- floating-point types is generally swapped with that 
        -- of the encoding of the "quiet NaN" given in the
        -- `is_quiet_not_a_number` function of this file; for some 
        -- unknown reason, the `ieee.generic_pkg` package defines 
        -- these two NaN values in the way given within these two 
        -- functions.

        if (is_float32(input_type)) then
        
        if ((('0' & data(30 downto 0)) >= x"7FC00000") and
            (('0' & data(30 downto 0)) <= x"7FFFFFFF")) then
            result := true;
        else
            result := false;
        end if;

        elsif (is_float64(input_type)) then

        if ((('0' & data(62 downto 0)) >= x"7FF8000000000000") and
            (('0' & data(62 downto 0)) <= x"7FFFFFFFFFFFFFFF")) then
            result := true;
        else
            result := false;
        end if;

        else

        result := false;

        end if;

        return result;
        
    end function;


    function is_not_a_number(
        input : std_logic_vector; input_type : type_t) return boolean is
    begin
        return (is_quiet_not_a_number(input, input_type) or
                is_signaling_not_a_number(input, input_type));   
    end function;

    --------------------------------------------------------------------

    function to_unsigned(
        input : unsigned; output_width : natural) return unsigned is
    begin
        return resize(input, output_width);
    end function;
    

    function to_unsigned(
        input : signed; output_width : natural) return unsigned is
    begin
        return resize(unsigned(input), output_width);
    end function;


    function to_unsigned(
        input : real; output_width : natural) return unsigned is
    begin
        return to_unsigned(abs(integer(input)), output_width);
    end function;


    function to_unsigned(
        input : boolean; output_width : natural) return unsigned is
    begin
        if (input = false) then
        return to_unsigned(0, output_width);
        else
        return to_unsigned(1, output_width);
        end if;
    end function;

    

    function to_signed(
        input : unsigned; output_width : natural) return signed is
    begin
        return resize(signed(input), output_width);
    end function;
    

    function to_signed(
        input : signed; output_width : natural) return signed is
    begin
        return resize(input, output_width);
    end function;


    function to_signed(
        input : real; output_width : natural) return signed is
    begin
        return to_signed(integer(input), output_width);
    end function;  

    
    function to_signed(
        input : boolean; output_width : natural) return signed is
    begin
        if (input = false) then
        return to_signed(0, output_width);
        else
        return to_signed(1, output_width);
        end if;
    end function;


    
    function to_integer(input : integer) return integer is
    begin
        return input;
    end function;


    function to_integer(input : real) return integer is
    begin
        return integer(input);
    end function;


    function to_integer(input : boolean) return integer is
    begin
        if (input = false) then
        return 0;
        else
        return 1;
        end if;
    end function;


    function to_integer(
        input : std_logic_vector; input_type : type_t) return integer is
        
        constant data : std_logic_vector := get_data(input, input_type);
        
    begin
        
        if (is_float(input_type)) then
        
        if (is_float32(input_type)) then
            -- The following `to_integer` and `to_float` functions
            -- are defined by the `ieee.float_pkg` package.
            return to_integer(to_float(data, F32_EW, F32_FW));
        else
            return to_integer(to_float(data, F64_EW, F64_FW));
        end if;

        else

        if (is_unsigned(input_type)) then
            return to_integer(unsigned(data));
        else
            return to_integer(signed(data));      
        end if;

        end if;
        
    end function;



    function to_unsigned_integer(input : std_logic_vector) return integer is
    begin
        
        return to_integer(unsigned(input));
        
    end function;

    
    function to_signed_integer(input : std_logic_vector) return integer is
    begin

        return to_integer(signed(input));

    end function;
    


    function to_real(input : unsigned) return real is
    begin
        return real(to_integer(input));
    end function;


    function to_real(input : signed) return real is
    begin
        return real(to_integer(input));
    end function;
    

    function to_real(input : integer) return real is
    begin
        return real(input);
    end function;


    function to_real(input : real) return real is
    begin
        if (is_denormal(input)) then
        return 0.0;
        else
        return input;
        end if;
    end function;
    

    function to_real(input : boolean) return real is
    begin
        return real(to_integer(input));
    end function;


    function to_real(
        input : std_logic_vector; input_type : type_t) return real is

        constant data : std_logic_vector := get_data(input, input_type);

    begin

        if (is_float(input_type)) then
        
        if (is_float32(input_type)) then
            -- The following `to_real` and `to_float` functions are
            -- defined by the `ieee.float_pkg` package. The `F32_EW`,
            -- `F32_FW`, `F64_EW`, and `F64_FW` constants are defined
            -- by the `extended_float_pkg` package.
            return to_real(to_float(data, F32_EW, F32_FW));
        else
            return to_real(to_float(data, F64_EW, F64_FW));
        end if;

        else

        return real(to_integer(data, input_type));

        end if;
        
    end function;

    function to_sl(input : boolean) return std_logic is
    begin
        if input then
            return '1';
        else
            return '0';
        end if;
    end function;

    
    function to_slv(input : unsigned) return std_logic_vector is
    begin
        return std_logic_vector(input);
    end function;


    function to_slv(input : signed) return std_logic_vector is
    begin
        return std_logic_vector(input);
    end function;

    
    
    function to_slv(
        output_type : type_t; input : unsigned) return std_logic_vector is
    begin

        if (is_float(output_type)) then
        
        if (is_float32(output_type)) then
            -- The following `to_slv` and `to_float` functions are
            -- defined by the `ieee.float_pkg` package. The `F32_EW`,
            -- `F32_FW`, `F64_EW`, and `F64_FW` constants are defined
            -- by the `extended_float_pkg` package.
            return to_slv(to_float(to_integer(input), F32_EW, F32_FW));
        else
            return to_slv(to_float(to_integer(input), F64_EW, F64_FW));
        end if;

        else

        -- Output is some integer type.
        
        if (is_unsigned(output_type)) then
            return to_slv(to_unsigned(input, get_width(output_type)));
        else
            return to_slv(to_signed(input, get_width(output_type)));
        end if;
        
        end if;
        
    end function;


    function to_slv(
        output_type : type_t; input : signed) return std_logic_vector is
    begin

        if (is_float(output_type)) then
        
        if (is_float32(output_type)) then
            return to_slv(to_float(to_integer(input), F32_EW, F32_FW));
        else
            return to_slv(to_float(to_integer(input), F64_EW, F64_FW));
        end if;

        else
        
        if (is_unsigned(output_type)) then
            return to_slv(to_unsigned(input, get_width(output_type)));
        else
            return to_slv(to_signed(input, get_width(output_type)));
        end if;
        
        end if;
        
    end function;


    function to_slv(
        output_type : type_t; input : integer) return std_logic_vector is
    begin

        if (is_float(output_type)) then
        
        if (is_float32(output_type)) then
            return to_slv(to_float(input, F32_EW, F32_FW));
        else
            return to_slv(to_float(input, F64_EW, F64_FW));
        end if;

        else

        if (is_unsigned(output_type)) then
            return to_slv(to_unsigned(abs(input), get_width(output_type)));
        else
            return to_slv(to_signed(input, get_width(output_type)));
        end if;
        
        end if;
        
    end function;


    function to_slv(
        output_type : type_t; input : real) return std_logic_vector is
    begin

        if (is_denormal(input)) then
        return get_zero(output_type);
        end if;

        if (is_float(output_type)) then

        if (is_float32(output_type)) then
            return to_slv(to_float(input, F32_EW, F32_FW));
        else
            return to_slv(to_float(input, F64_EW, F64_FW));
        end if;

        else

        if (is_unsigned(output_type)) then
            return to_slv(to_unsigned(input, get_width(output_type)));
        else
            return to_slv(to_signed(input, get_width(output_type)));
        end if;
        
        end if;
        
    end function;


    function to_slv(
        output_type : type_t; input : boolean) return std_logic_vector is
    begin

        if (is_float(output_type)) then
        
        if (is_float32(output_type)) then
            return to_slv(to_float(to_integer(input), F32_EW, F32_FW));
        else
            return to_slv(to_float(to_integer(input), F64_EW, F64_FW));
        end if;

        else

        if (is_unsigned(output_type)) then
            return to_slv(to_unsigned(input, get_width(output_type)));
        else
            return to_slv(to_signed(input, get_width(output_type)));
        end if;
        
        end if;
        
    end function;


    function to_slv(
        output_type : type_t;
        input : std_logic_vector;
        input_type : type_t) return std_logic_vector is

        constant data : std_logic_vector := get_data(input, input_type);
        
    begin

        if (is_float(output_type)) then
        
        if (is_float32(output_type)) then

            if (is_float32(input_type)) then
            return data;
            else
            return to_slv(to_float(to_real(data, input_type), F32_EW, F32_FW));
            end if;

        else

            if (is_float32(input_type)) then
            return to_slv(to_float(to_real(data, input_type), F64_EW, F64_FW));
            else
            return data;
            end if;

        end if;

        else
        
        if (is_unsigned(input_type)) then
            return to_slv(output_type, unsigned(data));
        else
            return to_slv(output_type, signed(data));
        end if;
            
        end if;
            
    end function;

    
    --------------------------------------------------------------------
    --------------------------------------------------------------------
    --------------------------------------------------------------------

    function minimum(data : integer_array) return integer is

        constant num_elements : positive := data'length;

        variable min_value : integer := integer'high;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) < min_value) then
            min_value := data(i);
        end if;
        end loop;

        return min_value;
        
    end function;
    

    function minimum(data : natural_array) return integer is

        constant num_elements : positive := data'length;

        variable min_value : natural := natural'high;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) < min_value) then
            min_value := data(i);
        end if;
        end loop;

        return min_value;
        
    end function;
        

    function minimum(data : positive_array) return integer is

        constant num_elements : positive := data'length;

        variable min_value : positive := positive'high;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) < min_value) then
            min_value := data(i);
        end if;
        end loop;

        return min_value;
        
    end function;

    function minimum(x, y : integer) return integer is

    begin

        if (x < y) then
            return x;
        end if;

        return y;

    end function;
        

    function maximum(data : integer_array) return integer is

        constant num_elements : positive := data'length;

        variable max_value : integer := integer'low;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) > max_value) then
            max_value := data(i);
        end if;
        end loop;

        return max_value;
        
    end function;
        

    function maximum(data : natural_array) return integer is

        constant num_elements : positive := data'length;

        variable max_value : natural := natural'low;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) > max_value) then
            max_value := data(i);
        end if;
        end loop;

        return max_value;
        
    end function;
        

    function maximum(data : positive_array) return integer is

        constant num_elements : positive := data'length;

        variable max_value : positive := positive'low;

    begin

        for i in 0 to num_elements-1 loop
        if (data(i) > max_value) then
            max_value := data(i);
        end if;
        end loop;

        return max_value;
        
    end function;
    
    function maximum(x, y : integer) return integer is

    begin

        if (x > y) then
            return x;
        end if;

        return y;

    end function;

    --------------------------------------------------------------------

    function to_string_record(str : string; len : positive) return string_t is

        variable res : string_t(str(1 to len));

    begin

        res.str(1 to str'length) := str;
        res.len := str'length;

        return res;

    end function;



    function to_string_record(str : string) return string_t is
    begin
        return to_string_record(str, str'length);
    end function;
    

    
    function to_string_record(
        input : std_logic_vector; input_type : type_t) return string_t is


        constant data : std_logic_vector := get_data(input, input_type);
        
        -- The following string length constant is a hopefully conservative
        -- estimate, based on the seemingly possible outputs of `real'image`
        -- and `integer'image`.
        constant max_string_length : positive := 20;

        variable len : positive;
        
        variable result : string_t(str(1 to max_string_length));
        
    begin
        
        if (is_signaling_not_a_number(data, input_type)) then
        len := 3;
        result.str(1 to len) := "NAN";
        elsif (is_quiet_not_a_number(data, input_type)) then
        len := 4;
        result.str(1 to len) := "QNAN";
        elsif (is_positive_infinity(data, input_type)) then
        len := 4;
        result.str(1 to len) := "+INF";
        elsif (is_negative_infinity(data, input_type)) then
        len := 4;
        result.str(1 to len) := "-INF";
        elsif (is_positive_zero(data, input_type)) then
        len := 1;
        result.str(1 to len) := "0";
        elsif (is_negative_zero(data, input_type)) then
        len := 2;
        result.str(1 to len) := "-0";
        else
        
        if (is_float(input_type)) then
            len := real'image(to_real(data, input_type))'length;
            result.str(1 to len) := real'image(to_real(data, input_type));
        else
            len := integer'image(to_integer(data, input_type))'length;
            result.str(1 to len) := integer'image(to_integer(data, input_type));
        end if;
        
        end if;

        result.len := len;

        return result;
        
    end function;


    function to_string_record(
        input : tuple_t;
        input_types : type_array;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string_t is

        constant num_elements : positive := input'length;

        constant space_len : positive := 1;
        constant start_delimiter_len : positive := start_delimiter'length;
        constant internal_delimiter_len : positive := internal_delimiter'length;
        constant end_delimiter_len : positive := end_delimiter'length;

        
        -- The following string length constants are hopefully conservative
        -- estimates, based on the seemingly possible outputs of `real'image`
        -- and `integer'image`.
        
        constant max_single_element_string_len : positive := 20;
        
        constant max_string_len : positive :=
        start_delimiter_len +
        (num_elements*(max_single_element_string_len +
                        internal_delimiter_len + space_len)) +
        end_delimiter_len;


        variable temp : string_t(str(1 to max_single_element_string_len));
        
        variable result : string_t(str(1 to max_string_len));

        variable current_len, new_len : natural;

        
    begin

        current_len := 0;

        -- Print start delimiter.
        new_len := start_delimiter_len;
        result.str(current_len+1 to new_len) := start_delimiter;
        current_len := new_len;
        
        
        for i in 0 to num_elements-1 loop

        -- Print element from the given `tuple_t`, along with
        -- any needed internal delimiter and spacing.

        temp := to_string_record(input(i), input_types(i));

        
        if (i = 0) then
            -- The first element does not need spacing nor an internal delimiter.
            
            new_len := current_len + temp.len;
            result.str(current_len+1 to new_len) := temp.str(1 to temp.len);
            
        else
            -- Every element other than the first, if there exists any,
            -- needs to be preceded by an internal delimiter and a single space.
            
            new_len := current_len + internal_delimiter_len + space_len + temp.len;
            
            result.str(current_len+1 to new_len) :=
            internal_delimiter & " " & temp.str(1 to temp.len);

        end if;
        
        current_len := new_len;

        end loop;
        
            
        -- All element(s) have been printed. Print end delimiter.        
        new_len := current_len + end_delimiter_len;
        result.str(current_len+1 to new_len) := end_delimiter;
        
        result.len := new_len;
        
        return result;
        
    end function;
    

    function to_string_record(
        input : tuple_t;
        input_type : type_t;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string_t is

        constant num_elements : positive := input'length;

        variable input_types : type_array(0 to num_elements-1);
        
    begin

        for i in 0 to num_elements-1 loop
        input_types(i) := input_type;
        end loop;

        return to_string_record(input, input_types, start_delimiter,
                                internal_delimiter, end_delimiter);
        
    end function;


    function to_string(str_rec : string_t) return string is
    begin
        return str_rec.str(1 to str_rec.len);
    end function;


    function to_string(data : integer) return string is
    begin
        return integer'image(data);
    end function;


    function to_string(data : real) return string is
    begin
        return real'image(data);
    end function;


    function to_string(
        input : std_logic_vector;
        input_type : type_t) return string is

        constant str_rec : string_t := to_string_record(input, input_type);

        constant str_len : natural := str_rec.len;
        
    begin
        
        return str_rec.str(1 to str_len);
        
    end function;


    function to_string(
        input : tuple_t;
        input_types : type_array;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string is

        constant str_rec : string_t :=
        to_string_record(input, input_types, start_delimiter,
                        internal_delimiter, end_delimiter);

        constant str_len : natural := str_rec.len;
        
    begin
        
        return str_rec.str(1 to str_len);
        
    end function;


    function to_string(
        input : tuple_t;
        input_type : type_t;
        start_delimiter : string;
        internal_delimiter : string;
        end_delimiter : string) return string is

        constant str_rec : string_t :=
        to_string_record(input, input_type, start_delimiter,
                        internal_delimiter, end_delimiter);

        constant str_len : natural := str_rec.len;
        
    begin
        
        return str_rec.str(1 to str_len);
        
    end function;


    function to_string(
        input : tuple_t; input_types : type_array) return string is

        constant start_delimiter : string := "(";
        constant internal_delimiter : string := ",";
        constant end_delimiter : string := ")";
        
        constant str_rec : string_t :=
        to_string_record(input, input_types, start_delimiter,
                        internal_delimiter, end_delimiter);

        constant str_len : natural := str_rec.len;
        
    begin
        
        return str_rec.str(1 to str_len);
        
    end function;
    

    function to_string(
        input : tuple_t; input_type : type_t) return string is

        constant start_delimiter : string := "(";
        constant internal_delimiter : string := ",";
        constant end_delimiter : string := ")";
        
        constant str_rec : string_t :=
        to_string_record(input, input_type, start_delimiter,
                        internal_delimiter, end_delimiter);

        constant str_len : natural := str_rec.len;
        
    begin
        
        return str_rec.str(1 to str_len);
        
    end function;

    
    function to_string(
        data : tuple_array; data_type : type_t) return string is

        constant num_tuples : positive := data'length;
        constant num_tuple_elements : positive := data(0)'length;

        constant space_delimiter : string := " ";
        constant start_delimiter : string := "(";
        constant internal_delimiter : string := ",";
        constant end_delimiter : string := ")";
        
        constant space_len : positive := space_delimiter'length;
        constant start_delimiter_len : positive := start_delimiter'length;
        constant internal_delimiter_len : positive := internal_delimiter'length;
        constant end_delimiter_len : positive := end_delimiter'length;
        
        -- The following string length constants are hopefully conservative
        -- estimates, based on the seemingly possible outputs of `real'image`
        -- and `integer'image`.
        
        constant max_single_element_string_len : positive := 20;
        
        constant max_tuple_string_len : positive :=
        start_delimiter_len +
        (num_tuple_elements*(max_single_element_string_len +
                            internal_delimiter_len + space_len)) +
        end_delimiter_len;

        constant max_string_len : positive :=
        start_delimiter_len +
        (num_tuples*(max_tuple_string_len +
                    internal_delimiter_len + space_len)) +
        end_delimiter_len;

        variable temp : string_t(str(1 to max_tuple_string_len));
        
        variable result : string_t(str(1 to max_string_len));

        variable current_len, new_len : natural;

    begin

        current_len := 0;

        -- Print start delimiter.
        new_len := start_delimiter_len;
        result.str(current_len+1 to new_len) := start_delimiter;
        current_len := new_len;
        
        
        for i in 0 to num_tuples-1 loop

        -- Print element from the given `tuple_t`, along with
        -- any needed internal delimiter and spacing.

        temp := to_string_record(data(i), data_type, start_delimiter,
                                internal_delimiter, end_delimiter);

        
        if (i = 0) then
            -- The first element does not need spacing nor an internal delimiter.
            
            new_len := current_len + temp.len;
            result.str(current_len+1 to new_len) := temp.str(1 to temp.len);
            
        else
            -- Every element other than the first, if there exists any,
            -- needs to be preceded by an internal delimiter and a single space.
            
            new_len := current_len + internal_delimiter_len + space_len + temp.len;
            
            result.str(current_len+1 to new_len) :=
            internal_delimiter & " " & temp.str(1 to temp.len);

        end if;
        
        current_len := new_len;

        end loop;
        
            
        -- All element(s) have been printed. Print end delimiter.        
        new_len := current_len + end_delimiter_len;
        result.str(current_len+1 to new_len) := end_delimiter;
        
        result.len := new_len;
        
        return result.str(1 to result.len);

    end function;

    
    --------------------------------------------------------------------
    --------------------------------------------------------------------
    --------------------------------------------------------------------

    function get_type(data : data_t) return type_t is
    begin
        return data.data_type;
    end function;


    function get_width(data : data_t) return natural is
    begin
        return get_width(get_type(data));
    end function;


    function get_value(data : data_t) return std_logic_vector is
    begin
        return get_data(data.value, get_type(data));
    end function;

    --------------------------------------------------------------------
    
    function get_negative_zero(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_negative_zero(data_type));
    end function;


    function get_positive_zero(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_positive_zero(data_type));
    end function;


    function get_zero(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_zero(data_type));
    end function;


    function get_negative_infinity(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_negative_infinity(data_type));
    end function;


    function get_positive_infinity(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_positive_infinity(data_type));
    end function;


    function get_negative_one(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_negative_one(data_type));
    end function;


    function get_positive_one(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_positive_one(data_type));
    end function;


    function get_one(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_one(data_type));
    end function;


    function get_quiet_not_a_number(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_quiet_not_a_number(data_type));
    end function;


    function get_signaling_not_a_number(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_signaling_not_a_number(data_type));
    end function;


    function get_not_a_number(data_type : type_t) return data_t is
    begin
        return init_data(data_type, get_not_a_number(data_type));
    end function;


    --------------------------------------------------------------------

    -- Type conditional functions.

    function is_signed(data : data_t) return boolean is
    begin
        return is_signed(get_type(data));
    end function;


    function is_unsigned(data : data_t) return boolean is
    begin
        return is_unsigned(get_type(data));
    end function;
    

    function is_float(data : data_t) return boolean is
    begin
        return is_float(get_type(data));
    end function;


    function is_ieee754(data : data_t) return boolean is
    begin
        return is_ieee754(get_type(data));
    end function;
    

    function is_ieee754_binary32(data : data_t) return boolean is
    begin
        return is_ieee754_binary32(get_type(data));
    end function;


    function is_float32(data : data_t) return boolean is
    begin
        return is_float32(get_type(data));
    end function;
    

    function is_ieee754_binary64(data : data_t) return boolean is
    begin
        return is_ieee754_binary64(get_type(data));
    end function;


    function is_float64(data : data_t) return boolean is
    begin
        return is_float64(get_type(data));
    end function;
    

    function is_integer(data : data_t) return boolean is
    begin
        return is_integer(get_type(data));
    end function;


    function is_signed_integer(data : data_t) return boolean is
    begin
        return is_signed_integer(get_type(data));
    end function;
    

    function is_unsigned_integer(data : data_t) return boolean is
    begin
        return is_unsigned_integer(get_type(data));
    end function;

    --------------------------------------------------------------------

    -- Value conditional functions.

    function is_negative(data : data_t) return boolean is
    begin
        return is_negative(get_value(data), get_type(data));
    end function;
    
        
    function is_positive(data : data_t) return boolean is
    begin
        return is_positive(get_value(data), get_type(data));
    end function;
    
        
    function is_less_than_or_equal_to_zero(data : data_t) return boolean is
    begin
        return is_less_than_or_equal_to_zero(get_value(data), get_type(data));
    end function;


    function is_less_than_zero(data : data_t) return boolean is
    begin
        return is_less_than_zero(get_value(data), get_type(data));
    end function;
    
        
    function is_greater_than_or_equal_to_zero(data : data_t) return boolean is
    begin
        return is_greater_than_or_equal_to_zero(get_value(data), get_type(data));
    end function;
    
        
    function is_greater_than_zero(data : data_t) return boolean is
    begin
        return is_greater_than_zero(get_value(data), get_type(data));
    end function;


    function is_negative_zero(data : data_t) return boolean is
    begin
        return is_negative_zero(get_value(data), get_type(data));
    end function;


    function is_positive_zero(data : data_t) return boolean is
    begin
        return is_positive_zero(get_value(data), get_type(data));
    end function;


    function is_zero(data : data_t) return boolean is
    begin
        return is_zero(get_value(data), get_type(data));
    end function;


    function is_nonzero(data : data_t) return boolean is
    begin
        return is_nonzero(get_value(data), get_type(data));
    end function;
    
        
    function is_negative_one(data : data_t) return boolean is
    begin
        return is_negative_one(get_value(data), get_type(data));
    end function;
    
        
    function is_positive_one(data : data_t) return boolean is
    begin
        return is_positive_one(get_value(data), get_type(data));
    end function;
    
        
    function is_one(data : data_t) return boolean is
    begin
        return is_one(get_value(data), get_type(data));
    end function;


    function is_negative_infinity(data : data_t) return boolean is
    begin
        return is_negative_infinity(get_value(data), get_type(data));
    end function;


    function is_positive_infinity(data : data_t) return boolean is
    begin
        return is_positive_infinity(get_value(data), get_type(data));
    end function;


    function is_infinity(data : data_t) return boolean is
    begin
        return is_infinity(get_value(data), get_type(data));
    end function;
    
        
    function is_quiet_not_a_number(data : data_t) return boolean is
    begin
        return is_quiet_not_a_number(get_value(data), get_type(data));
    end function;
    
        
    function is_signaling_not_a_number(data : data_t) return boolean is
    begin
        return is_signaling_not_a_number(get_value(data), get_type(data));
    end function;


    function is_not_a_number(data : data_t) return boolean is
    begin
        return is_not_a_number(get_value(data), get_type(data));
    end function;


    function is_denormal(data : data_t) return boolean is
    begin
        return is_denormal(get_value(data), get_type(data));
    end function;

    --------------------------------------------------------------------

    -- Data record initialization functions.
    
    function set_data(
        data : data_t; value : std_logic_vector) return data_t is

        constant record_width : positive := data.value'length;

        constant data_type : type_t := get_type(data);
        constant data_width : natural := get_width(data);
        
        constant zero : std_logic_vector := get_zero(data_type);

        variable temp : std_logic_vector(data_width-1 downto 0) :=
        get_data(value, data_type);

        variable result : data_t(value(record_width-1 downto 0)) := data;

    begin

        result.value(data_width-1 downto 0) := temp;

        if (record_width > data_width) then
        result.value(record_width-1 downto data_width) := (others => 'X');
        end if;

        return result;
        
    end function;


    function set_data(
        data : data_t; value : integer) return data_t is
        
        constant output_type : type_t := get_type(data);
        
    begin
        return set_data(data, to_slv(output_type, value));
    end function;


    function set_data(data : data_t;
                        value : real) return data_t is
        
        constant output_type : type_t := get_type(data);
        
    begin
        return set_data(data, to_slv(output_type, value));
    end function;
    

    function init_data(
        data_type : type_t; value : std_logic_vector) return data_t is

        -- For this function to be able to used by the `init_data_array` function,
        -- the length of the given `value` vector must define how many bits are
        -- allocated for the unconstrained data members.
        constant record_width : positive := value'length;
        
        variable result : data_t(value(record_width-1 downto 0));

    begin
        
        result.data_type := data_type;
        
        return set_data(result, value);
        
    end function;
    

    function init_data(data_type : type_t) return data_t is

        constant data_width : natural := get_width(data_type);
        
        constant uninitialized :
        std_logic_vector(data_width-1 downto 0) := (others => 'X');

    begin
        
        return init_data(data_type, uninitialized);
        
    end function;


    function init_data(
        data_type : type_t; value : integer) return data_t is
    begin
        return init_data(data_type, to_slv(data_type, value));
    end function;


    function init_data(
        data_type : type_t; value : real) return data_t is
    begin
        return init_data(data_type, to_slv(data_type, value));
    end function;


    function init_data(
        data_type : type_t; value : boolean) return data_t is
    begin
        return init_data(data_type, to_slv(data_type, value));
    end function;



    function init_data_array(
        data_types : type_array; values : tuple_t) return data_array is

        constant num_elements : positive := values'length;
        constant record_width : positive := values(0)'length;

        variable result : data_array(0 to num_elements-1)(
        value(record_width-1 downto 0));
        
    begin

        for i in 0 to num_elements-1 loop
        result(i) := init_data(data_types(i), values(i));
        end loop;

        return result;
        
    end function;


    
    function init_data_array(
        data_type : type_t; values : tuple_t) return data_array is

        constant num_elements : positive := values'length;

        variable data_types : type_array(0 to num_elements-1);
        
    begin

        for i in 0 to num_elements-1 loop
        data_types(i) := data_type;
        end loop;

        return init_data_array(data_types, values);
        
    end function;


    
    function init_data_array(data_types : type_array) return data_array is

        constant num_elements : positive := data_types'length;
        constant record_width : natural := get_max_width(data_types);

        variable result : data_array(0 to num_elements-1)(
        value(record_width-1 downto 0));
        
    begin

        for i in 0 to num_elements-1 loop
        result(i) := init_data(data_types(i));
        end loop;

        return result;
        
    end function;


    
    function init_data_array(
        data_type : type_t; num_elements : positive) return data_array is

        variable data_types : type_array(0 to num_elements-1);
        
    begin

        for i in 0 to num_elements-1 loop
        data_types(i) := data_type;
        end loop;

        return init_data_array(data_types);
        
    end function;


    --------------------------------------------------------------------

    -- Conversion functions.

        function to_real_array(data : integer_array) return real_array is
            variable data_real : real_array(data'range);
        begin
            for i in data'range loop
                data_real(i) := to_real(data(i));
            end loop;
            return data_real;
        end function;

        function to_real_array(data : natural_array) return real_array is
            variable data_real : real_array(data'range);
        begin
            for i in data'range loop
                data_real(i) := to_real(data(i));
            end loop;
            return data_real;
        end function;

        function to_integer_array(data : real_array) return integer_array is
            variable data_integer : integer_array(data'range);
        begin
            for i in data'range loop
                data_integer(i) := to_integer(data(i));
            end loop;
            return data_integer;
        end function;

        -- function to_natural_array(data : real_array) return integer_array is
        --     variable data_natural : natural_array(data'range);
        -- begin
        --     for i in data'range loop
        --         data_natural(i) := to_natural(data(i));
        --     end loop;
        --     return data_natural;
        -- end function;

    function to_tuple(data : data_t) return tuple_t is

        constant data_type : type_t := get_type(data);
        constant data_width : natural := get_width(data_type);
        
        variable result : tuple_t(0 to 0)(data_width-1 downto 0);

    begin
        
        result(0) := get_value(data);
        
        return result;
        
    end function;
    

    function to_tuple(data : data_array) return tuple_t is

        constant num_elements : positive := data'length;
        constant low : integer := data'low;
        constant max_width : positive := data(low).value'length;
        
        variable result : tuple_t(0 to num_elements-1)(
        max_width-1 downto 0) := (others => (others => 'X'));

        variable data_type : type_t;
        variable data_width : natural;

    begin

        for i in 0 to num_elements-1 loop
        data_type := get_type(data(low+i));
        data_width := get_width(data_type);
        
        result(i)(data_width-1 downto 0) := get_value(data(low+i));
        end loop;

        return result;
        
    end function;



    function to_integer(data : data_t) return integer is
    begin
        return to_integer(get_value(data), get_type(data));
    end function;

    
    
    function to_real(data : data_t) return real is
    begin
        return to_real(get_value(data), get_type(data));
    end function;


    
    function to_type(
        data_type : type_t; data : data_t) return data_t is
    begin
        return init_data(data_type,
                        to_slv(data_type, get_value(data), get_type(data)));
    end function;

    

    function to_slv(data : data_t) return std_logic_vector is
    begin
        return get_value(data);
    end function;


    
    function to_string(data : data_t) return string is
    begin
        return to_string(get_value(data), get_type(data));
    end function;

    
    
    function to_string(data : data_array) return string is

        constant num_elements : positive := data'length;
        constant record_width : positive := data(0).value'length;
        
        variable values : tuple_t(0 to num_elements-1)(
        record_width-1 downto 0);

        variable data_types : type_array(0 to num_elements-1);
        
    begin

        for i in 0 to num_elements-1 loop
        values(i) := get_value(data(i));
        data_types(i) := get_type(data(i));
        end loop;
        
        return to_string(values, data_types);
        
    end function;


    function ifte(condition: boolean; x, y : integer) return integer is
    begin
        if condition then
            return x;
        else
            return y;
        end if;
    end function;
  

    function vectorize(
            input : tuple_t; data_type : type_t) return std_logic_vector is
        constant data_width : positive := get_width(data_type);
        constant n_elements : positive := input'length;
        variable res : std_logic_vector(n_elements * data_width - 1 downto 0);
    begin
        for i in 0 to n_elements-1 loop
            res((i + 1) * data_width - 1 downto (i) * data_width) := input(i);
        end loop;
        return res;
    end function;


    function devectorize(
        input : std_logic_vector; data_type : type_t) return tuple_t is
        constant data_width : positive := get_width(data_type);
        constant n_elements : positive := input'length / data_width;
        constant low : integer := input'low;
        variable res : tuple_t(0 to n_elements-1)(data_width-1 downto 0);
    begin
        for i in 0 to n_elements-1 loop
            res(i) := input(low + (i + 1) * data_width - 1 downto low + (i) * data_width);
        end loop;
        return res;
    end function;

end package body;
