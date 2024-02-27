-- ****************************************************************************
-- counter_tb.vhd --
--
--     Testbench for `counter` entity.
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
use arc_std.counter_pkg.all;

entity counter_tb is
end counter_tb;

architecture TB of counter_tb is

  -- Parameters for `counter` entity.
  constant period : natural := 3;
  constant width : positive := n_bits_amount(period);
  
  -- Simulation signals.
  signal done : std_logic := '0';
  
  -- Entity signals.
  signal clk : std_logic := '0';
  signal rst : std_logic := '1';

  signal enable : std_logic := '0';
  signal output : std_logic_vector(width-1 downto 0);
  signal overflow : std_logic;
  
begin -- TB

  -- Instantiate counter entity.
  UUT : entity arc_std.counter
    generic map (
      period => period,
      counter_type => sync_t)
    port map (
      clk => clk,
      rst => rst,

      enable => enable,
      output => output,
      overflow => overflow);

  -- Clock driver statement.
  clk <= not clk after 10 ns when done = '0' else clk;

  process

  begin

    
    -- Reset design for, arbitrarily, `period+1` clock cycles.
    for j in 0 to period loop
      wait until rising_edge(clk);
    end loop;

    rst <= '0';

    
    -- Do not count for `period+1` clock cycles.
    enable <= '0';

    for j in 0 to period loop
      wait until rising_edge(clk);
    end loop;

    
    -- Count for `2*(period+1)` clock cycles.
    enable <= '1';
    
    for j in 0 to 2*period+1 loop
      wait until rising_edge(clk);
    end loop;


    -- Do not count for `period+1` clock cycles.
    enable <= '0';
    
    for j in 0 to period loop
      wait until rising_edge(clk);
    end loop;

    
    -- Wrap up simulation.
    report "Simulation complete!";
    done <= '1';
    wait;
    
  end process;

end TB;

