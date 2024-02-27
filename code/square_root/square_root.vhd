-- ****************************************************************************
-- square_root.vhd --
--
--     Generic two-input square root for various data types.
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

package square_root_pkg is  

  component float32_sqrt is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(31 downto 0) := (others => 'X');
      q      : out std_logic_vector(31 downto 0));
  end component float32_sqrt;
  
  component float64_sqrt is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(63 downto 0) := (others => 'X');
      q      : out std_logic_vector(63 downto 0));
  end component float64_sqrt;

  constant LATENCY_FLOAT32_SQRT : positive := 17;
  constant LATENCY_FLOAT64_SQRT : positive := 44;

  function get_latency(input_type : type_t) return natural;
  
end package;

package body square_root_pkg is

  function get_latency(input_type : type_t) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (is_float32(input_type)) then
      latency := LATENCY_FLOAT32_SQRT;
    elsif (is_float64(input_type)) then
      latency := LATENCY_FLOAT64_SQRT;
    end if;

    return latency;
    
  end function;


end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.square_root_pkg.all;

entity square_root is
  generic (
    input_type : type_t;
    use_valid : boolean := false;
 
    input_width : positive := get_width(input_type);
    output_type : type_t := input_type;
    output_width : positive := get_width(output_type));
  port (
    clk       : in std_logic;
    rst       : in std_logic := '0';

    input    : in std_logic_vector(input_width-1 downto 0);
    valid_in  : in std_logic := '-';
    output    : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic := '-');
end entity;

architecture MIX of square_root is

  constant latency : natural := get_latency(input_type);
  
begin

  U_SQUARE_ROOT_GEN : if (is_float32(input_type)) generate
    -- Single-precision floating point.

    U_FLOAT_SQRT : float32_sqrt
      port map (
        clk => clk,
        areset => rst,
        a => input,
        q => output);

    
  elsif (is_float64(input_type)) generate
    -- Double-precision floating point.

    U_FLOAT_SQRT : float64_sqrt
      port map (
        clk => clk,
        areset => rst,
        a => input,
        q => output);

  end generate U_SQUARE_ROOT_GEN;


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
