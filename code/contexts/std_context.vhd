-- ****************************************************************************
-- std_context.vhd --
--
--     File to declare a standard VHDL context for the `arc_std` library.
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
context std_context is

  library std;
  use std.textio.all;
  
  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real;
  use ieee.math_real.all;
  use ieee.float_pkg;
  use ieee.float_pkg.all;

  library arc_std;
  use arc_std.extended_float_pkg;
  use arc_std.extended_float_pkg.all;
  use arc_std.type_pkg;
  use arc_std.type_pkg.all;
  use arc_std.math_pkg;
  use arc_std.math_pkg.all;
  use arc_std.sort_pkg;
  use arc_std.sort_pkg.all;
end context;
