-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
-- use std.textio.all;

-- --use work.flt_pkg.all;

-- use ieee.fixed_float_types.all;
-- use ieee.float_pkg.all;

library arc_std;
context arc_std.std_context;

--use arc_std.uaa_pkg.all;
--use arc_std.uaa_tb_pkg.all;

entity fcbt_accumulator_tb is
end fcbt_accumulator_tb;

architecture tb of fcbt_accumulator_tb is

    constant data_type : type_t := float32_t;
	constant WIDTH : positive := get_width(data_type);
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal hold_output : std_logic := '0';
    signal ready : std_logic;
    signal end_of_group : std_logic := '0';
    signal input : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal output : std_logic_vector(WIDTH-1 downto 0);
    signal valid_in : std_logic := '0';
    signal valid_out : std_logic;
     
    signal sim_done       : std_logic;
    
    type ARRAY_INT     is array(natural range<>) of integer;
 
begin
	
	UUT_FCBT : entity arc_std.fcbt
    generic map(
        data_type       => float32_t,
        FCBT_max_inputs => 10      -- Max number of elements per group
        )
    port map(
        clk          => clk,
        rst          => rst,
        hold_output  => '0',   -- '1' keeps outputs from disappearing
        ready        => ready,   -- '1' when fcbt can accept input
        end_of_group => end_of_group,   -- specifies last input in group

        input     => input,
        output    => output,
        valid_in  => valid_in,
        valid_out => valid_out
		);

    clk <= clk when sim_done = '1' else
           not clk after 10 ns;


    process
    begin
        sim_done <= '0';
        -- Reset sequence
        rst         <= '1';
        end_of_group <= '0';
		input <= (others => '0');
        for i in 0 to 3 loop
            wait until rising_edge(clk);
        end loop;
        rst         <= '0';
            
        for j in 0 to 30 loop
            for i in 1 to 15 loop
                if (ready = '1') then
                    input <= to_slv(data_type, i*(j + 1));
                    valid_in      <= '1';
                    if ((j = 1) and (i = 2)) then
                        end_of_group  <= '1';
                        wait until rising_edge(clk);
                        exit;
                    elsif (i = 15) then
                        end_of_group  <= '1';
                    else
                        end_of_group  <= '0';
                    end if;
                    wait until rising_edge(clk);
                end if;
            end loop;
            valid_in      <= '0';
		    end_of_group <= '0';
        end loop;
        valid_in      <= '0';
		end_of_group <= '0';

        wait for 800 ns;
        sim_done <= '1';
        wait;		
    end process;
end tb;