-- ****************************************************************************
-- fanout_tree_tb.vhd --
--
--     Testbench for `fanout_tree` entity.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     October 24, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.fanout_tree_pkg.all;

entity fanout_tree_tb is
end fanout_tree_tb;

architecture TB of fanout_tree_tb is

  -- Parameters for `fanout_tree` entity.

  constant data_type : type_t := float32_t;
  constant data_width : natural := get_width(data_type);

  constant fanout : positive := 256;
  constant radix : positive := 2;
  constant register_output : boolean := true;
  
  -- Parameters for simulation.
  constant clock_half_period : time := 10 ns;
  constant clock_full_period : time := clock_half_period * 2;

  constant latency : natural := get_latency(fanout, radix, register_output);

-------------------------------------------------------------------------------
 
  -- Function used to validate fanout_tree operation.
  function validate(
    input : std_logic_vector;
    output : tuple_t;
    data_type : type_t := data_type) return natural is
    
    variable num_errors : natural := 0;
    
  begin

    for i in output'range loop
        if output(i) /= input then
            num_errors := num_errors + 1;
            report "For `output( " & to_string(i) & ")`" &
                ", expected " & to_string(input, data_type) & 
                ", but received " & to_string(output(i), data_type) & 
                ". " severity error;
        end if;
    end loop;
    
    return num_errors;
    
  end function;

-------------------------------------------------------------------------------
  
  -- Simulation signals.
  signal done : std_logic := '0';
  
  -- Entity signals.
  signal clk    : std_logic := '0';
  signal rst    : std_logic := '1';
  
  signal input : std_logic_vector(
    data_width-1 downto 0) := (others => '0');

  signal valid_in : std_logic := '0';
  
  signal output : tuple_t(0 to fanout-1)(
    data_width-1 downto 0) := (others => (others => '0'));

  signal valid_out : std_logic := '0';
  
begin -- TB

  -- Instantiate `fanout_tree` entity.
  UUT : entity arc_std.fanout_tree
    generic map (
      data_type => data_type,
      fanout => fanout,
      radix => radix,
      register_output => register_output,
      use_valid => true)
    port map (
      clk => clk,
      rst => rst,
      input => input,
      valid_in => valid_in,
      output => output,
      valid_out => valid_out);
  
  -- Clock driver; 50% duty cycle.
  clk <= not clk after clock_half_period when done = '0' else clk;

  process

    variable num_errors : natural := 0;

  begin
    
    -- Reset design(s) for, arbitrarily, 5 clock cycles.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;

    wait until falling_edge(clk);
    rst <= '0';

    input <= to_slv(data_type, 50.0);
    valid_in <= '1';

    wait until rising_edge(clk);

    input <= to_slv(data_type, 0.0);
    valid_in <= '0';

    -- Let the design finish propagating its output.
    for i in 1 to latency-1 loop
      wait until rising_edge(clk);
    end loop;

    -- Validate the design.          
    num_errors := num_errors + validate(input, output);
    
    -- Allow some additional clock cycles to pass to verify
    -- that the `valid_out` signal becomes de-asserted.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;

    -- Wrap up simulation.
    report "Total number of errors: " & integer'image(num_errors);

    report "Simulation complete!";
    done <= '1';
    wait;
    
  end process;

end TB;
