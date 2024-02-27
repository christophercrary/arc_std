-- ****************************************************************************
-- delay_tapped.vhd.
--
--     Pipelined delay of any nonnegative amount of cycles, where every
--     intermediate register output is additionally provided in the
--     output.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--     Greg Stitt (gstitt@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     October 20, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

entity delay_tapped is
  generic (
    data_type : type_t := uint_type(1);
    data_width : positive := get_width(data_type);
    
    use_valid : boolean := false;

    num_cycles : natural;
    
    data_reset_value : std_logic_vector(
      data_width-1 downto 0) := (others => '0');
    
    valid_reset_value : std_logic_vector(0 downto 0) := (others => '0'));

  port (
    clk : in std_logic;
    rst : in std_logic := '0';
    
    enable : in std_logic := '1';
    input  : in std_logic_vector(data_width-1 downto 0) := (others => '-');
    valid_in : in std_logic := '0';
    output : out tuple_t(0 to num_cycles)(data_width-1 downto 0);
    valid_out : out std_logic_vector(num_cycles downto 0) := (others => '-'));
  
end entity;

architecture ASYNC_RST of delay_tapped is

begin

  U_NUM_CYCLES_COND : if (num_cycles = 0) generate
    -- No delay is needed.
    output(0) <= input;

    U_VALID_COND : if (use_valid = true) generate
      valid_out(0) <= valid_in;
    end generate;

  else generate
    -- Some delay is needed.
    output(0) <= input;

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
          input => output(i),
          output => output(i+1));
    end generate U_DATA;

    U_VALID_COND : if (use_valid = true) generate
      -- Generate chain of valid delay registers.
      valid_out(0) <= valid_in;

      U_VALID : for i in 0 to num_cycles-1 generate
        U_VALID_REG : entity arc_std.reg
          generic map (
            data_type => uint_type(1),
            reset_value => valid_reset_value)
          port map (
            clk => clk,
            rst => rst,
            enable => enable,
            input => valid_out(i downto i),
            output => valid_out(i+1 downto i+1));
      end generate U_VALID;

    end generate U_VALID_COND;

  end generate U_NUM_CYCLES_COND;

end architecture ASYNC_RST;
