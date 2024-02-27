-- ****************************************************************************
-- multiplier.vhd --
--
--     Generic two-input multiplier for various data types. Each input must
--     be of the same base type, but if the inputs are of an integer type,
--     the width of each input may be different.
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

package multiplier_pkg is

  component float32_mult is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(31 downto 0) := (others => 'X');
      b      : in  std_logic_vector(31 downto 0) := (others => 'X');
      q      : out std_logic_vector(31 downto 0));
  end component float32_mult;
  
  component float64_mult is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(63 downto 0) := (others => 'X');
      b      : in  std_logic_vector(63 downto 0) := (others => 'X');
      q      : out std_logic_vector(63 downto 0));
  end component float64_mult;

  constant LATENCY_FLOAT32_MULT : positive := 3;
  constant LATENCY_FLOAT64_MULT : positive := 16;
  
  -- Latency of any integer-based multiplication.
  constant LATENCY_INT_MULT : natural := 1;

  function get_latency(
    input1_type : type_t; input2_type : type_t) return natural;

  -- Alternate function for when input widths are identical.
  function get_latency(input_type : type_t) return natural;
  
end package;

package body multiplier_pkg is

  function get_latency(
    input1_type : type_t; input2_type : type_t) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (are_same_base_type(input1_type, input2_type)) then
      if (are_float32(input1_type, input2_type)) then
        latency := LATENCY_FLOAT32_MULT;
      elsif (are_float64(input1_type, input2_type)) then
        latency := LATENCY_FLOAT64_MULT;
      elsif (are_integer(input1_type, input2_type)) then
        latency := LATENCY_INT_MULT;
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
use arc_std.multiplier_pkg.all;

entity multiplier is
  generic (
    input1_type : type_t;
    input2_type : type_t;
    use_valid : boolean := false;
    
    input1_width : positive := input1_type.width;
    input2_width : positive := input2_type.width;
    output_type : type_t :=
      math_pkg.get_multiplication_output_type(input1_type, input2_type);
    output_width : positive := output_type.width);
  port (
    clk       : in std_logic;
    rst       : in std_logic := '0';

    input1    : in std_logic_vector(input1_width-1 downto 0);
    input2    : in std_logic_vector(input2_width-1 downto 0);
    valid_in  : in std_logic := '-';
    output    : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;

architecture MIX of multiplier is

  constant latency : natural := get_latency(input1_type, input2_type);
  
begin

  U_MULTIPLIER_GEN : if (are_float32(input1_type, input2_type)) generate
    -- Single-precision floating-point.

    U_FLOAT_MULT : float32_mult
      port map (
        clk => clk,
        --areset => rst,
        a => input1,
        b => input2,
        q => output);

    
  elsif (are_float64(input1_type, input2_type)) generate
    -- Double-precision floating-point.
    
    U_FLOAT_MULT : float64_mult
      port map (
        clk => clk,
        areset => rst,
        a => input1,
        b => input2,
        q => output);


  elsif (are_unsigned_integer(input1_type, input2_type)) generate
    -- Unsigned integer arithmetic.

    process(clk)
    begin
      if (rising_edge(clk)) then
        output <= std_logic_vector(
          resize(unsigned(input1)*unsigned(input2), output_width));
      end if;
    end process;
       

  elsif (are_signed_integer(input1_type, input2_type)) generate
    -- Signed integer arithmetic.

    process(clk)
    begin
      if (rising_edge(clk)) then
        output <= std_logic_vector(
          resize(signed(input1)*signed(input2), output_width));
      end if;
    end process;

    
  end generate U_MULTIPLIER_GEN;

  
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
