-- ****************************************************************************
-- subtractor.vhd --
--
--     Generic two-input subtractor for various data types. Each input must
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

package subtractor_pkg is

  component float32_sub is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(31 downto 0) := (others => 'X');
      b      : in  std_logic_vector(31 downto 0) := (others => 'X');
      q      : out std_logic_vector(31 downto 0));
  end component float32_sub;
  
  component float64_sub is
    port (
      clk    : in  std_logic := 'X';
      areset : in  std_logic := 'X';            
      a      : in  std_logic_vector(63 downto 0) := (others => 'X');
      b      : in  std_logic_vector(63 downto 0) := (others => 'X');
      q      : out std_logic_vector(63 downto 0));
  end component float64_sub;

  constant LATENCY_FLOAT32_SUB : positive := 14;
  constant LATENCY_FLOAT64_SUB : positive := 24;

  -- Latency of any integer-based subtraction.
  constant LATENCY_INT_SUB : natural := 1;

  function get_latency(
    input1_type : type_t; input2_type : type_t) return positive;

  -- Alternate function for when input widths are identical.
  function get_latency(input_type : type_t) return positive;
  
end package;

package body subtractor_pkg is

  function get_latency(
    input1_type : type_t; input2_type : type_t) return natural is

    variable latency : natural := 0;
    
  begin
    
    if (are_same_base_type(input1_type, input2_type)) then
      if (are_float32(input1_type, input2_type)) then
        latency := LATENCY_FLOAT32_SUB;
      elsif (are_float64(input1_type, input2_type)) then
        latency := LATENCY_FLOAT64_SUB;
      elsif (are_integer(input1_type, input2_type)) then
        latency := LATENCY_INT_SUB;
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
use arc_std.subtractor_pkg.all;

entity subtractor is
  generic (
    input1_type : type_t;
    input2_type : type_t;
    use_valid : boolean := false;
    
    input1_width : positive := input1_type.width;
    input2_width : positive := input2_type.width;
    
    output_type : type_t :=
      math_pkg.get_subtraction_output_type(input1_type, input2_type);
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

architecture MIX of subtractor is

  constant latency : natural := get_latency(input1_type);
  
begin

  U_SUBTRACTOR_GEN : if (are_float32(input1_type, input2_type)) generate
    -- Single-precision floating point.

    U_FLOAT_SUB : float32_sub
      port map (
        clk => clk,
        areset => rst,
        a => input1,
        b => input2,
        q => output);

    
  elsif (are_float64(input1_type, input2_type)) generate
    -- Double-precision floating point.

    U_FLOAT_SUB : float64_sub
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
        output <= std_logic_vector(resize(unsigned(input1), output_width) -
                                   resize(unsigned(input2), output_width));
      end if;
    end process;
      

  elsif (are_signed_integer(input1_type, input2_type)) generate
    -- Signed integer arithmetic.

    process(clk)
    begin
      if (rising_edge(clk)) then
        output <= std_logic_vector(resize(signed(input1), output_width) -
                                   resize(signed(input2), output_width));
      end if;
    end process;

  end generate U_SUBTRACTOR_GEN;


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
