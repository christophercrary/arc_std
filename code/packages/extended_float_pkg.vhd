-- ****************************************************************************
-- extended_float_pkg.vhd --
--
--     Various declarations meant to extend the `ieee.float_pkg` predefined
--     package.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 23, 2021
-- ****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.float_pkg.all;

package extended_float_pkg is

  constant FLOAT_SIGN_WIDTH : natural := 1;

  -- Single-precision floating point. 
  constant FLOAT32_WIDTH : natural := 32;
  constant FLOAT32_EXP_WIDTH : natural := 8;
  constant FLOAT32_FRAC_WIDTH : natural := 23;

  constant F32_EW : natural := FLOAT32_EXP_WIDTH;
  constant F32_FW : natural := FLOAT32_FRAC_WIDTH;

  constant FLOAT32_EXP_HIGH : natural := FLOAT32_WIDTH-FLOAT_SIGN_WIDTH-1;
  constant FLOAT32_EXP_LOW : natural := FLOAT32_EXP_HIGH-FLOAT32_EXP_WIDTH+1;

  constant FLOAT32_FRAC_HIGH : natural := FLOAT32_EXP_LOW-1;
  constant FLOAT32_FRAC_LOW : natural := FLOAT32_FRAC_HIGH-FLOAT32_FRAC_WIDTH+1;

  constant F32_EXP_HIGH : natural := FLOAT32_EXP_HIGH;
  constant F32_EXP_LOW : natural := FLOAT32_EXP_LOW;

  constant F32_FRAC_HIGH : natural := FLOAT32_FRAC_HIGH;
  constant F32_FRAC_LOW : natural := FLOAT32_FRAC_LOW;

  
  constant FLOAT32_EXP_ZERO :
    std_logic_vector(FLOAT32_EXP_WIDTH-1 downto 0) := (others => '0');
  constant FLOAT32_FRAC_ZERO :
    std_logic_vector(FLOAT32_FRAC_WIDTH-1 downto 0) := (others => '0');

  constant F32_EXP_ZERO : std_logic_vector := FLOAT32_EXP_ZERO;
  constant F32_FRAC_ZERO : std_logic_vector := FLOAT32_FRAC_ZERO;
  

  constant FLOAT32_POSITIVE_ZERO : std_logic_vector :=
    to_slv(zerofp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_NEGATIVE_ZERO : std_logic_vector :=
    to_slv(neg_zerofp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_ZERO : std_logic_vector := FLOAT32_POSITIVE_ZERO;

  constant FLOAT32_POSITIVE_ONE : std_logic_vector :=
    to_slv(to_float(1, FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_NEGATIVE_ONE : std_logic_vector :=
    to_slv(to_float(-1, FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_ONE : std_logic_vector := FLOAT32_POSITIVE_ONE;

  constant FLOAT32_SIGNALING_NOT_A_NUMBER : std_logic_vector :=
    to_slv(nanfp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_QUIET_NOT_A_NUMBER : std_logic_vector :=
    to_slv(qnanfp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_NOT_A_NUMBER : std_logic_vector := 
    FLOAT32_SIGNALING_NOT_A_NUMBER;

  constant FLOAT32_POSITIVE_INFINITY : std_logic_vector :=
    to_slv(pos_inffp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  constant FLOAT32_NEGATIVE_INFINITY : std_logic_vector :=
    to_slv(neg_inffp(FLOAT32_EXP_WIDTH, FLOAT32_FRAC_WIDTH));

  
  -- Double-precision floating point.
  constant FLOAT64_WIDTH : natural := 64;
  constant FLOAT64_EXP_WIDTH : natural := 11;
  constant FLOAT64_FRAC_WIDTH : natural := 52;
  
  constant F64_EW : positive := FLOAT64_EXP_WIDTH;
  constant F64_FW : positive := FLOAT64_FRAC_WIDTH;

  constant FLOAT64_EXP_HIGH : natural := FLOAT64_WIDTH-FLOAT_SIGN_WIDTH-1;
  constant FLOAT64_EXP_LOW : natural := FLOAT64_EXP_HIGH-FLOAT64_EXP_WIDTH+1;

  constant FLOAT64_FRAC_HIGH : natural := FLOAT64_EXP_LOW-1;
  constant FLOAT64_FRAC_LOW : natural := FLOAT64_FRAC_HIGH-FLOAT64_FRAC_WIDTH+1;

  constant F64_EXP_HIGH : natural := FLOAT64_EXP_HIGH;
  constant F64_EXP_LOW : natural := FLOAT64_EXP_LOW;

  constant F64_FRAC_HIGH : natural := FLOAT64_FRAC_HIGH;
  constant F64_FRAC_LOW : natural := FLOAT64_FRAC_LOW;

  
  constant FLOAT64_EXP_ZERO :
    std_logic_vector(FLOAT64_EXP_WIDTH-1 downto 0) := (others => '0');
  constant FLOAT64_FRAC_ZERO :
    std_logic_vector(FLOAT64_FRAC_WIDTH-1 downto 0) := (others => '0');

  constant F64_EXP_ZERO : std_logic_vector := FLOAT64_EXP_ZERO;
  constant F64_FRAC_ZERO : std_logic_vector := FLOAT64_FRAC_ZERO;

  
  constant FLOAT64_POSITIVE_ZERO : std_logic_vector :=
    to_slv(zerofp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_NEGATIVE_ZERO : std_logic_vector :=
    to_slv(neg_zerofp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_ZERO : std_logic_vector := FLOAT64_POSITIVE_ZERO;

  constant FLOAT64_POSITIVE_ONE : std_logic_vector :=
    to_slv(to_float(1, FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_NEGATIVE_ONE : std_logic_vector :=
    to_slv(to_float(-1, FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_ONE : std_logic_vector := FLOAT64_POSITIVE_ONE;

  constant FLOAT64_SIGNALING_NOT_A_NUMBER : std_logic_vector :=
    to_slv(nanfp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_QUIET_NOT_A_NUMBER : std_logic_vector :=
    to_slv(qnanfp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_NOT_A_NUMBER : std_logic_vector := 
    FLOAT64_SIGNALING_NOT_A_NUMBER;

  constant FLOAT64_POSITIVE_INFINITY : std_logic_vector :=
    to_slv(pos_inffp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

  constant FLOAT64_NEGATIVE_INFINITY : std_logic_vector :=
    to_slv(neg_inffp(FLOAT64_EXP_WIDTH, FLOAT64_FRAC_WIDTH));

end package;
