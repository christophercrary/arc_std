-- ****************************************************************************
-- sort_pkg.vhd --
--
--     Various declarations related to sorting.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     October 19, 2021
-- ****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library arc_std;
use arc_std.type_pkg.all;

package sort_pkg is

    type sort_t is record
        data : real_array;
        args : integer_array;
    end record;

    function interval(
        high : integer; low : integer := 0; step : integer := 1) 
        return integer_array;

    function sort(data : real_array) return sort_t;

    function sort(data : real_array) return real_array;

    function sort(data : integer_array) return integer_array;

    function arg_sort(data : real_array) return integer_array;

    function arg_sort(data : integer_array) return integer_array;

end package;


package body sort_pkg is

    function interval(
        high : integer; low : integer := 0; step : integer := 1) 
            return integer_array is
        constant n : integer := (high - low) / step;
        variable r : integer_array(low to low + n - 1);
    begin
        for i in r'range loop
            r(i) := low + (i * step);
        end loop;
        return r;
    end function;

    function sort(data : real_array) return sort_t is
        constant n : positive := data'length;
        variable j : integer;
        variable key : real;
        variable arg : integer;
        variable sorted : sort_t(data(0 to n-1), args(0 to n-1)) := (
            data => data,
            args => interval(data'high + 1, data'low));
    begin
        for i in data'low + 1 to data'high loop
            key := sorted.data(i);
            arg := sorted.args(i);
            j := i - 1;
            while j >= 0 and key < sorted.data(j) loop
                sorted.data(j + 1) := sorted.data(j);
                sorted.args(j + 1) := sorted.args(j);
                j := j - 1;
            end loop;
            sorted.data(j + 1) := key;
            sorted.args(j + 1) := arg;
        end loop;
        return sorted;
    end function;

    function sort(data : real_array) return real_array is
        constant sorted : sort_t := sort(data);
    begin
        return sorted.data;
    end function;

    function sort(data : integer_array) return integer_array is
        constant data_real : real_array := to_real_array(data);
        constant sorted : sort_t := sort(data_real);
        constant sorted_data : integer_array := to_integer_array(sorted.data);
    begin
        return sorted_data;
    end function;

    function arg_sort(data : real_array) return integer_array is 
        constant sorted : sort_t := sort(data);
    begin
        return sorted.args;
    end function;

    function arg_sort(data : integer_array) return integer_array is
        constant data_real : real_array := to_real_array(data);
    begin
        return arg_sort(data_real);
    end function;

end package body;
