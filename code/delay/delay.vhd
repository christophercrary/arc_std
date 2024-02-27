-- ****************************************************************************
-- delay.vhd.
--
--     Pipelined delay of any nonnegative amount of cycles.
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

library arc_std;
context arc_std.std_context;

entity delay is
  generic (
    data_type : type_t := uint_type(1);
    data_width : positive := get_width(data_type);
    
    use_valid : boolean := false;

    num_cycles : natural;
    
    data_reset_value :
      std_logic_vector(data_width-1 downto 0) := (others => '0');
    
    valid_reset_value : std_logic_vector(0 downto 0) := (others => '0'));

  port (
    clk : in std_logic;
    rst : in std_logic := '0';
    
    enable : in std_logic := '1';
    input  : in std_logic_vector(data_width-1 downto 0) := (others => '-');
    valid_in : in std_logic := '0';
    output : out std_logic_vector(data_width-1 downto 0);
    valid_out : out std_logic := '-');
  
end entity;

architecture ASYNC_RST of delay is

  -- Data delay signal array.
  --
  -- Note that this array is only utilized when `num_cycles > 0`.
  signal data : tuple_t(0 to num_cycles)(data_width-1 downto 0) :=
    (others => (others => '0'));

  
  -- Valid delay signal array.
  --
  -- Note that this array is only utilized when
  -- `num_cycles > 0` and `use_valid = true`.
  signal valids : tuple_t(0 to num_cycles)(0 downto 0) :=
    (others => (others => '0'));

  
begin

  U_NUM_CYCLES_COND : if (num_cycles = 0) generate
    -- No delay is needed.
    output <= input;
    valid_out <= valid_in;

  else generate
    -- Some delay is needed.

    data(0) <= input;

    -- Generate chain of data delay registers.
    U_DATA : for i in 0 to num_cycles-1 generate
      U_DATA_REG : entity arc_std.reg
        generic map (
          data_type => data_type,
          reset_value => data_reset_value)
        port map (
          clk => clk,
          rst => rst,
          enable => enable,
          input => data(i),
          output => data(i+1));
    end generate U_DATA;

    
    output <= data(num_cycles);

-------------------------------------------------------------------------------
    
    U_VALID_COND : if (use_valid = true) generate
      -- The valid signals are to be utilized.
      
      valids(0)(0) <= valid_in;

      U_VALID : for i in 0 to num_cycles-1 generate
        U_VALID_REG : entity arc_std.reg
          generic map (
            data_type => uint_type(1),
            reset_value => valid_reset_value)
          port map (
            clk => clk,
            rst => rst,
            enable => enable,
            input => valids(i),
            output => valids(i+1));
      end generate U_VALID;

      
      valid_out <= valids(num_cycles)(0);

    else generate

      valid_out <= valid_in;
      
    end generate U_VALID_COND;


  end generate U_NUM_CYCLES_COND;

  
end architecture ASYNC_RST;
