-- ****************************************************************************
-- adder_tb.vhd --
--
--     Testbench for `adder` entity.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     September 28, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.adder_pkg;

entity adder_tb is
end adder_tb;

architecture TB of adder_tb is

  -- Parameters for `adder` entity.

  constant data_type : type_t := float32_t;
  constant data_width : natural := get_width(data_type);
  
  -- Parameters for simulation.
  constant clock_half_period : time := 10 ns;
  constant clock_full_period : time := clock_half_period * 2;

-------------------------------------------------------------------------------
 
  -- Function used to validate adder operation.
  function validate(
    input : tuple_t;
    output : std_logic_vector;
    data_type : type_t := data_type) return natural is

    constant actual_output : data_t := init_data(data_type, output);
    
    constant desired_output : data_t :=
      init_data(data_type, input(0)) + init_data(data_type, input(1));
    
    variable num_errors : natural;
    
  begin

    -- Validate the given output.
    num_errors := arc_std.math_pkg.validate(desired_output, actual_output);

    if (num_errors /= 0) then
      -- Report relevant error.

      report "For `input` " & to_string(input, data_type) & 
        ", expected `output` " &
        to_string(desired_output) & ", but received " &
        to_string(actual_output) & ". " severity error;

    end if;
    
    return num_errors;
    
  end function;

-------------------------------------------------------------------------------
  
  -- Simulation signals.
  signal done : std_logic := '0';
  
  -- Entity signals.
  signal clk    : std_logic := '0';
  signal rst    : std_logic := '1';
  
  signal input : tuple_t(0 to 1)(
    data_width-1 downto 0) := (others => (others => '0'));

  signal valid_in : std_logic := '0';
  
  signal output : std_logic_vector(data_width-1 downto 0) := (others => '0');

  signal valid_out : std_logic := '0';
  
begin -- TB

  -- Instantiate adder entity.
  UUT : entity arc_std.adder
    generic map (
      input1_type => data_type,
      input2_type => data_type,
      use_valid => true)
    port map (
      clk => clk,
      rst => rst,
      
      input1 => input(0),
      input2 => input(1),
      valid_in => valid_in,
      output => output,
      valid_out => valid_out);
  
  -- Clock driver; 50% duty cycle.
  clk <= not clk after clock_half_period when done = '0' else clk;

  process

    variable num_errors : natural := 0;

    variable latency : natural;

  begin
    
    -- Reset design(s) for, arbitrarily, 5 clock cycles.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;

    wait until falling_edge(clk);
    rst <= '0';

    latency := adder_pkg.get_latency(data_type, data_type);

    input(0) <= to_slv(data_type, 50.0);
    input(1) <= to_slv(data_type, 50.0);
    valid_in <= '1';

    wait until rising_edge(clk);

    valid_in <= '0';

    -- Let the design finish propagating its output.
    for i in 0 to 100*latency+1 loop
      wait until rising_edge(clk);
    end loop;

    -- Validate the design.          
    num_errors := (num_errors + validate(input, output));
    
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
