-- ****************************************************************************
-- decoder_tb.vhd --
--
--     Testbench for `decoder` entity.
--
-- Author(s):
--     Benjamin Hicks (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Benjamin Hicks
--
-- Last Modified On:
--     September 1, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.decoder_pkg;
use arc_std.decoder_pkg.all;

entity decoder_tb is
end decoder_tb;

architecture TB of decoder_tb is

    constant num_outputs : positive := 32;
    constant input_width : positive := get_num_bits_for_amount(num_outputs);
    constant radix : positive := 2;
    constant latency : natural := get_latency(num_outputs, radix);

    function generate_input_set(
        num_outputs : positive) return tuple_t is

            constant input_width : positive := get_num_bits_for_amount(num_outputs);

            variable input_set : tuple_t(num_outputs-1 downto 0)(
                input_width-1 downto 0) := (others => (others => '0'));
            
        begin

            for i in 0 to num_outputs-1 loop
                input_set(i) := to_slv(to_unsigned(i, input_width));
            end loop;

            return input_set;

    end function;

    constant input_set : tuple_t(num_outputs-1 downto 0)(
        input_width-1 downto 0) := generate_input_set(num_outputs);
    
    function generate_output_set(
        num_outputs : positive) return tuple_t is

            variable output_set : tuple_t(num_outputs-1 downto 0)(
                num_outputs-1 downto 0) := (others => (others => '0'));
        
        begin

            for i in 0 to num_outputs-1 loop
                output_set(i)(i) := '1';
            end loop;

            return output_set;

    end function;

    constant output_set : tuple_t(num_outputs-1 downto 0)(
        num_outputs-1 downto 0) := generate_output_set(num_outputs);
    
    -- Parameters for simulation.
    constant clock_half_period : time := 10 ns;
    constant clock_full_period : time := clock_half_period * 2;
    
    -- Simulation signals.
    signal done : std_logic := '0';

    -- Entity signals.
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';

    signal input : std_logic_vector(input_width-1 downto 0);

    signal valid_in : std_logic := '0';

    signal output : std_logic_vector(num_outputs-1 downto 0);
    
    signal valid_out : std_logic;

begin

    UUT : entity arc_std.decoder
        generic map (
            num_outputs => num_outputs,
            use_pipelining => true,
            radix => radix)    
        port map (
            clk => clk,
            rst => rst,

            input => input,
            valid_in => valid_in,
            output => output
        );

    -- Clock driver; 50% duty cycle.
    clk <= not clk after clock_half_period when done = '0' else clk;

    -- valid_out is all the bits in output OR'd together
    process(output)
    begin
        valid_out <= '0';
        for i in 0 to num_outputs-1 loop
            if (output(i) = '1') then
                valid_out <= '1';
            end if;
        end loop;
    end process;

    -- Drive the DUT inputs.
    process

        begin
        
        -- Reset design(s) for, arbitrarily, 5 clock cycles.
        for i in 0 to 4 loop
            wait until rising_edge(clk);
        end loop;

        wait until falling_edge(clk);
        rst <= '0';

    -------------------------------------------------------------------------------

        -- Test all the relevant select combinations of every design.
        for i in 0 to num_outputs-1 loop
            -- Write the input
            valid_in <= '1';
            input <= input_set(i);
            wait until rising_edge(clk);
        end loop;

        valid_in <= '0';

        
        -- Allow some additional clock cycles to pass to verify
        -- that the `valid_out` signal becomes de-asserted.
        for i in 0 to 4 loop
            wait until rising_edge(clk);
        end loop;        
        wait;
        
    end process;

    -- Monitor the DUT outputs.
    process

        variable num_errors : natural := 0;

    begin

        for i in 0 to num_outputs-1 loop

            wait until rising_edge(clk) and valid_out = '1';

            if (output /= output_set(i)) then
                num_errors := num_errors + 1;
            end if;     

        end loop;


        -- Wrap up simulation.
        report "Total number of errors: " & integer'image(num_errors);

        report "Simulation complete!";
        done <= '1';
        wait;
    end process;

end TB;