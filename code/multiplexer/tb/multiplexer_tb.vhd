-- ****************************************************************************
-- multiplexer_tb.vhd --
--
--     Testbench for `multiplexer` entity.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 11, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.multiplexer_pkg;

entity multiplexer_tb is
end multiplexer_tb;

architecture TB of multiplexer_tb is

  -- Parameters for `multiplexer` entity.
  --
  -- Change up to `use_pipelining` when testing different scenarios.

  constant data_type : type_t := uint8_t;
  constant data_width : natural := get_width(data_type);
  
  constant max_num_inputs : positive := 32;
  constant num_inputs : positive := 32;

  constant radix : positive := 16;
  
  --constant max_radix : positive := num_inputs;
  
  --constant num_inputs_start : positive := 1;
  --constant num_inputs_end : positive := num_inputs;
  
  --constant radix_start : positive := 2;
  --constant radix_end : positive := 1;

  constant use_pipelining : boolean := true;

  constant max_sel_width : positive := n_bits_amount(max_num_inputs);
  

  -- Input set that will be validated.

  constant possible_input : tuple_t(0 to max_num_inputs-1)(
    data_width-1 downto 0) :=
  
    (to_slv(data_type, 0), to_slv(data_type, 1),
     to_slv(data_type, 2), to_slv(data_type, 3),
     to_slv(data_type, 4), to_slv(data_type, 5),
     to_slv(data_type, 6), to_slv(data_type, 7),
     to_slv(data_type, 8), to_slv(data_type, 9),
     to_slv(data_type, 10), to_slv(data_type, 11),
     to_slv(data_type, 12), to_slv(data_type, 13),
     to_slv(data_type, 14), to_slv(data_type, 15),
     to_slv(data_type, 16), to_slv(data_type, 17),
     to_slv(data_type, 18), to_slv(data_type, 19),
     to_slv(data_type, 20), to_slv(data_type, 21),
     to_slv(data_type, 22), to_slv(data_type, 23),
     to_slv(data_type, 24), to_slv(data_type, 25),
     to_slv(data_type, 26), to_slv(data_type, 27),
     to_slv(data_type, 28), to_slv(data_type, 29),
     to_slv(data_type, 30), to_slv(data_type, 31));
  
     
  -- Parameters for simulation.
  constant clock_half_period : time := 10 ns;
  constant clock_full_period : time := clock_half_period * 2;


-------------------------------------------------------------------------------
 
  -- Function used to validate multiplexer operation.
  function validate(
    num_inputs : positive;
    radix : positive;
    input : tuple_t;
    sel : std_logic_vector;
    output : std_logic_vector;
    data_type : type_t := data_type) return natural is

    constant sel_type : type_t := uint_type(sel'length);
    
    constant actual_output : data_t :=
      init_data(data_type, output);
    
    constant desired_output : data_t :=
      init_data(data_type, multiplexer_pkg.sel(input, sel));
    
    variable num_errors : natural;
    
  begin

    -- Validate the given output.
    num_errors :=
      arc_std.math_pkg.validate(desired_output, actual_output);

    if (num_errors /= 0) then
      -- Report relevant error.

      report "For `num_inputs` " & to_string(num_inputs) & ", " &
        "`radix` " & to_string(radix) & ", `input` " &
        to_string(input, data_type) & ", and `sel` " &
        to_string(sel, sel_type) & ", expected `output` " &
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
  
  signal input : tuple_t(0 to max_num_inputs-1)(
    data_width-1 downto 0) := possible_input;

  signal sel : std_logic_vector(max_sel_width-1 downto 0) := (others => '0');
  
  signal output :
    tuple_t(0 to max_num_inputs-1)(
      data_width-1 downto 0) := (others => (others => '0'));
  --(max_num_inputs*(max_num_inputs+1))/2-1)(
  
begin -- TB

  -- Instantiate various multiplexer entities.

  UUT_GEN1 : for i in 1 to num_inputs generate
  --UUT_GEN1 : for i in num_inputs_start to num_inputs_end-1 generate
    --UUT_GEN2 : for j in radix_start to i generate

      UUT : entity arc_std.multiplexer
        generic map (
          data_type => data_type,
          num_inputs => i,
          use_pipelining => use_pipelining,
          radix => radix)--j)
        port map (
          clk => clk,
          rst => rst,
          
          input => input(0 to i-1),
          sel => sel(n_bits_amount(i)-1 downto 0),
          output => output(i-1));
          --output(((i*(i-1))/2)+(j-1)));

    --end generate;
  end generate;
  
  -- Clock driver; 50% duty cycle.
  clk <= not clk after clock_half_period when done = '0' else clk;

  process

    variable num_errors : natural := 0;

    variable latency : natural;

    variable sel_type : type_t;
    variable sel_width : positive;

  begin
    
    -- Reset design(s) for, arbitrarily, 5 clock cycles.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;

    wait until falling_edge(clk);
    rst <= '0';


-------------------------------------------------------------------------------

    -- Test all the relevant select combinations of every design.
    for i in 0 to num_inputs-1 loop
    --for i in num_inputs_start to num_inputs_end loop
      --for j in radix_start to i loop
        -- The current unit under test is the one in which
        -- `num_inputs => i` and `radix => j`.

        for k in 0 to i-1 loop

          latency := multiplexer_pkg.get_latency(i, radix);--j);

          sel_width := n_bits_amount(i);
          sel_type := uint_type(sel_width);

          -- Select the current input combination.
          sel(sel_width-1 downto 0) <= to_slv(sel_type, k);

          -- Let the design finish propagating its output.
          for i in 0 to latency+1 loop
            wait until rising_edge(clk);
          end loop;

          -- Validate the design.          
          num_errors := (
            num_errors + validate(i, radix, input(0 to i-1),
              sel(sel_width-1 downto 0), output(i)));
                                  --output(((i*(i-1))/2)+(j-1))));

        end loop;
        
      --end loop;

    end loop;

    
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
