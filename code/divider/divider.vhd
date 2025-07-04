-- ****************************************************************************
-- divider.vhd --
--
--     Generic two-input divider for various data types.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     December 2, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package divider_pkg is  

  component float32_div is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(31 downto 0) := (others => 'X');
      b      : in  std_logic_vector(31 downto 0) := (others => 'X');
      q      : out std_logic_vector(31 downto 0));
  end component float32_div;
  
  component float64_div is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(63 downto 0) := (others => 'X');
      b      : in  std_logic_vector(63 downto 0) := (others => 'X');
      q      : out std_logic_vector(63 downto 0));
  end component float64_div;

  constant LATENCY_FLOAT32_DIV : positive := 35;
  constant LATENCY_FLOAT64_DIV : positive := 62;

  function get_latency(
    input1_type : type_t; input2_type : type_t) return natural;

  -- Alternate function for when input widths are identical.
  function get_latency(input_type : type_t) return natural;

  
end package;

package body divider_pkg is

  function get_latency(
    input1_type : type_t; input2_type : type_t) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (are_same_base_type(input1_type, input2_type)) then
      if (are_float32(input1_type, input2_type)) then
        latency := LATENCY_FLOAT32_DIV;
      elsif (are_float64(input1_type, input2_type)) then
        latency := LATENCY_FLOAT64_DIV;
      end if;
    end if;

    return latency;
    
  end function;


  function get_latency(input_type : type_t) return natural is
  begin
    return get_latency(input_type, input_type);
  end function;
  
end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.divider_pkg.all;

entity divider is
  generic (
    input1_type : type_t;
    input2_type : type_t;
    use_valid : boolean := false;
 
    input1_width : positive := get_width(input1_type);
    input2_width : positive := get_width(input2_type);
    output_type : type_t :=
      math_pkg.get_division_output_type(input1_type, input2_type);
    output_width : positive := get_width(output_type));
  port (
    clk       : in std_logic;
    rst       : in std_logic := '0';

    input1    : in std_logic_vector(input1_width-1 downto 0);
    input2    : in std_logic_vector(input2_width-1 downto 0);
    valid_in  : in std_logic := '-';
    output    : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic := '-');
end entity;

architecture MIX of divider is

  constant latency : natural := get_latency(input1_type, input2_type);
  
begin

  U_DIVIDER_GEN : if (are_float32(input1_type, input2_type)) generate
    -- Single-precision floating point.

    U_FLOAT_DIV : float32_div
      port map (
        clk => clk,
        areset => rst,
        a => input1,
        b => input2,
        q => output);

    
  elsif (are_float64(input1_type, input2_type)) generate
    -- Double-precision floating point.

    U_FLOAT_DIV : float64_div
      port map (
        clk => clk,
        areset => rst,
        a => input1,
        b => input2,
        q => output);

  end generate U_DIVIDER_GEN;


  U_VALID_DELAY : entity arc_std.delay
    generic map (
      use_valid => use_valid,
      num_cycles => latency)
    port map (
      clk => clk,
      rst => rst,
      valid_in => valid_in,
      valid_out => valid_out);

  
end architecture MIX;
