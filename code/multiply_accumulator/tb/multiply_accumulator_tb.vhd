-- ****************************************************************************
-- multiply_accumulator_tb.vhd --
--
--     Testbench for `multiply_accumulator` entity.
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

use arc_std.parallel_accumulator_pkg.all;
use arc_std.sequential_accumulator_pkg.all;
use arc_std.accumulator_pkg.all;

package multiply_accumulator_tb_pkg is

  constant input1_type : type_t := float32_t;
  constant input2_type : type_t := float32_t;

  constant input1_width : natural := get_width(input1_type);
  constant input2_width : natural := get_width(input2_type);
  
  constant accumulator_type : accumulator_t := (
    parallel => bt_t,
    sequential => pcbt_t);
  
  constant max_num_input_pairs : positive := 64;
  constant num_input_pairs : positive := 9;
  constant max_num_input_pairs_per_cycle : positive := num_input_pairs;
  
  constant num_input_pairs_start : positive := 1;
  constant num_input_pairs_end : positive := num_input_pairs;
  constant num_input_pairs_per_cycle_start : positive := 1;
  constant num_input_pairs_per_cycle_end : positive := 1;
  
  constant product_type : type_t :=
    arc_std.math_pkg.get_multiplication_output_type(input1_type, input2_type);

  constant product_width : positive := get_width(product_type);
  
  constant largest_output_type : type_t :=
    arc_std.math_pkg.get_multiply_accumulation_output_type(
      input1_type, input2_type, max_num_input_pairs);

  constant max_output_width : positive := get_width(largest_output_type);
  

  -- Input sets that will be validated.

  constant in1 : tuple_t(0 to max_num_input_pairs-1)(
    input1_width-1 downto 0) :=
    
    (to_slv(input1_type, 0.124), to_slv(input1_type, 6.0),
     to_slv(input1_type, 1.0), to_slv(input1_type, 3.0),
     to_slv(input1_type, 3.2), to_slv(input1_type, 1.7),
     to_slv(input1_type, 17.9), to_slv(input1_type, 44.3744),
     to_slv(input1_type, 10), to_slv(input1_type, 5),
     to_slv(input1_type, 4), to_slv(input1_type, 10),
     to_slv(input1_type, 3.7), to_slv(input1_type, 2.3),
     to_slv(input1_type, 8.8), to_slv(input1_type, 1.9899),
     to_slv(input1_type, 0.124), to_slv(input1_type, 6.0),
     to_slv(input1_type, 1.0), to_slv(input1_type, 3.0),
     to_slv(input1_type, 3.2), to_slv(input1_type, 1.7),
     to_slv(input1_type, 17.9), to_slv(input1_type, 44.3744),
     to_slv(input1_type, 10), to_slv(input1_type, 5),
     to_slv(input1_type, 4), to_slv(input1_type, 10),
     to_slv(input1_type, 3.7), to_slv(input1_type, 2.3),
     to_slv(input1_type, 8.8), to_slv(input1_type, 1.9899),
     to_slv(input1_type, 0.124), to_slv(input1_type, 6.0),
     to_slv(input1_type, 1.0), to_slv(input1_type, 3.0),
     to_slv(input1_type, 3.2), to_slv(input1_type, 1.7),
     to_slv(input1_type, 17.9), to_slv(input1_type, 44.3744),
     to_slv(input1_type, 10), to_slv(input1_type, 5),
     to_slv(input1_type, 4), to_slv(input1_type, 10),
     to_slv(input1_type, 3.7), to_slv(input1_type, 2.3),
     to_slv(input1_type, 8.8), to_slv(input1_type, 1.9899),
     to_slv(input1_type, 0.124), to_slv(input1_type, 6.0),
     to_slv(input1_type, 1.0), to_slv(input1_type, 3.0),
     to_slv(input1_type, 3.2), to_slv(input1_type, 1.7),
     to_slv(input1_type, 17.9), to_slv(input1_type, 44.3744),
     to_slv(input1_type, 10), to_slv(input1_type, 5),
     to_slv(input1_type, 4), to_slv(input1_type, 10),
     to_slv(input1_type, 3.7), to_slv(input1_type, 2.3),
     to_slv(input1_type, 8.8), to_slv(input1_type, 1.9899));

  
  constant in2 : tuple_t(0 to max_num_input_pairs-1)(
    input2_width-1 downto 0) :=
    
    (to_slv(input2_type, 0.0023), to_slv(input2_type, 3.0),
     to_slv(input2_type, 1.0), to_slv(input2_type, 3.0),
     to_slv(input2_type, 69.69), to_slv(input2_type, 85.5),
     to_slv(input2_type, 74.99), to_slv(input2_type, -150.1),
     to_slv(input2_type, 2.5), to_slv(input2_type, 5.3),
     to_slv(input2_type, 10.4), to_slv(input2_type, 55.0003),
     to_slv(input2_type, 88), to_slv(input2_type, 337),
     to_slv(input2_type, 15), to_slv(input2_type, -79),
     to_slv(input2_type, 0.0023), to_slv(input2_type, 3.0),
     to_slv(input2_type, 1.0), to_slv(input2_type, 3.0),
     to_slv(input2_type, 69.69), to_slv(input2_type, 85),
     to_slv(input2_type, 74.99), to_slv(input2_type, -150.1),
     to_slv(input2_type, 2.5), to_slv(input2_type, 5.3),
     to_slv(input2_type, 10.4), to_slv(input2_type, 55),
     to_slv(input2_type, 88), to_slv(input2_type, 337),
     to_slv(input2_type, 15), to_slv(input2_type, -79),
     to_slv(input2_type, 0.0023), to_slv(input2_type, 3.0),
     to_slv(input2_type, 1.0), to_slv(input2_type, 3.0),
     to_slv(input2_type, 69.69), to_slv(input2_type, 1000),
     to_slv(input2_type, 74.99), to_slv(input2_type, -150.1),
     to_slv(input2_type, 2.5), to_slv(input2_type, 5.3),
     to_slv(input2_type, 1.4), to_slv(input2_type, 55),
     to_slv(input2_type, 88), to_slv(input2_type, 337),
     to_slv(input2_type, 5), to_slv(input2_type, -79),
     to_slv(input2_type, 0.023), to_slv(input2_type, 3.0),
     to_slv(input2_type, 1.0), to_slv(input2_type, 3.0),
     to_slv(input2_type, 69.69), to_slv(input2_type, 85),
     to_slv(input2_type, 74.99), to_slv(input2_type, -10.1),
     to_slv(input2_type, 2.5), to_slv(input2_type, 5.3),
     to_slv(input2_type, 10.4), to_slv(input2_type, 55),
     to_slv(input2_type, 88), to_slv(input2_type, 7),
     to_slv(input2_type, 15), to_slv(input2_type, -79));
  
  
  constant zero1 : tuple_t(0 to max_num_input_pairs-1)(
    input1_width-1 downto 0) := (others => (others => '0'));

  constant zero2 : tuple_t(0 to max_num_input_pairs-1)(
    input2_width-1 downto 0) := (others => (others => '0'));
  
  
  constant clock_half_period : time := 10 ns;
  constant clock_full_period : time := clock_half_period * 2;

  constant output_file_path : string :=
    "../code/hdl/components/arc/arc_std/multiply_accumulator/tb/dat/output.dat";


-------------------------------------------------------------------------------
  
  -- Validate multiply-accumulate operation.
  procedure validate(
    input1_type : type_t;
    input2_type : type_t;    
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    input1 : tuple_t;
    input2 : tuple_t;
    output : std_logic_vector;    
    file output_file : text;
    variable output_file_line : inout line;
    variable num_errors : inout natural);
  

  -- Return string for when simulation is complete.
  function get_string_simulation_completion(
    current_time : time; num_errors : natural) return string;
    
  
  -- Return string for when the output from an entity is erroneous.
  function get_string_output_error(
    current_time : time;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    input1 : data_array;
    input2 : data_array;
    desired_output : data_t;
    actual_output : data_t) return string;

  
  -- Return string for when the calculated latency of an entity is erroneous.
  function get_string_latency_error(
    current_time : time;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    calculated_latency : natural;
    actual_latency : natural) return string;


end package;


package body multiply_accumulator_tb_pkg is

  procedure validate(
    input1_type : type_t;
    input2_type : type_t;    
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    input1 : tuple_t;
    input2 : tuple_t;
    output : std_logic_vector;    
    file output_file : text;
    variable output_file_line : inout line;
    variable num_errors : inout natural) is

    
    constant product_type : type_t :=
      math_pkg.get_multiplication_output_type(input1_type, input2_type);

    constant output_type : type_t :=
      math_pkg.get_multiply_accumulation_output_type(
        input1_type, input2_type, num_input_pairs);

    constant data_input1 : data_array := init_data_array(input1_type, input1);
    constant data_input2 : data_array := init_data_array(input2_type, input2);
    constant actual_output : data_t := init_data(output_type, output);
    
    constant desired_output : data_t := +(data_input1 * data_input2);

    constant error_string : string := get_string_output_error(
      now, num_input_pairs, num_input_pairs_per_cycle,
      data_input1, data_input2, desired_output, actual_output);
    
    variable temp_num_errors : natural;
    
  begin

    -- Validate the given output.
    temp_num_errors := math_pkg.validate(desired_output, actual_output);

    if (temp_num_errors /= 0) then
      
      -- Report relevant error.
      write(output_file_line, error_string);
      tee(output_file, output_file_line);

      -- Update overall error count.
      num_errors := num_errors + temp_num_errors;
      
    end if;
    
  end procedure;


  function get_string_simulation_completion(
    current_time : time; num_errors : natural) return string is

  begin

    return (
      "----------------------------------------" &
      "----------------------------------------" & LF &
      "Simulation complete!!!" & LF &
      "Total number of errors: " & to_string(num_errors) & LF &
      "Total time: " & to_string(current_time, ns) & LF &
      "----------------------------------------" &
      "----------------------------------------");

  end function;

  
  function get_string_output_error(
    current_time : time;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    input1 : data_array;
    input2 : data_array;
    desired_output : data_t;
    actual_output : data_t) return string is

  begin

    return (
      "----------------------------------------" &
      "----------------------------------------" & LF &
      "ERROR (" & to_string(current_time, ns) & ")" & LF &
      "----------------------------------------" &
      "----------------------------------------" & LF &
      "For `num_input_pairs = " & to_string(num_input_pairs) & "`, " & LF &
      "`num_input_pairs_per_cycle = " & to_string(num_input_pairs_per_cycle) &
      "`, " & LF & "`input1 = " & to_string(input1) & "`, and" & LF &
      "`input2 = " & to_string(input2) & "`," & LF &
      "expected `output = " & to_string(desired_output) & "`," & LF &
      "but received `output = " & to_string(actual_output) & "`." & LF &
      "Absolute difference: `" & to_string(abs_diff(
        desired_output, actual_output)) & "`." & LF &
      "----------------------------------------" &
      "----------------------------------------" & LF & LF);

  end function;
  

  function get_string_latency_error(
    current_time : time;
    num_input_pairs : positive;
    num_input_pairs_per_cycle : positive;
    calculated_latency : natural;
    actual_latency : natural) return string is

  begin

    return (
      "----------------------------------------" &
      "----------------------------------------" & LF &
      "ERROR (" & to_string(current_time, ns) & ")" & LF &
      "----------------------------------------" &
      "----------------------------------------" & LF &
      "For `num_input_pairs = " & to_string(num_input_pairs) & "` and" & LF &
      "`num_input_pairs_per_cycle = " & to_string(num_input_pairs_per_cycle) &
      "`," & LF & "expected latency of `" &
      to_string(calculated_latency) & "` clock cycles," & LF &
      "but received latency of `" &
      to_string(actual_latency) & "` clock cycles." & LF &
      "----------------------------------------" &
      "----------------------------------------" & LF & LF);

  end function;

end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;

use arc_std.multiply_accumulator_pkg;
use arc_std.multiply_accumulator_tb_pkg.all;

entity multiply_accumulator_tb is
end multiply_accumulator_tb;

architecture TB of multiply_accumulator_tb is
  
  -- Simulator signals.
  
  signal done : std_logic := '0';
  
  -- Entity signals.
  
  signal clk    : std_logic := '0';
  signal rst    : std_logic := '1';
  
  signal input1 :
    tuple_t(0 to max_num_input_pairs_per_cycle-1)(
      input1_width-1 downto 0) := (others => (others => '0'));
  
  signal input2 :
    tuple_t(0 to max_num_input_pairs_per_cycle-1)(
      input2_width-1 downto 0) := (others => (others => '0'));
  
  signal valid_in :
    tuple_t(0 to (max_num_input_pairs*(max_num_input_pairs+1))/2-1)(
      0 downto 0) := (others => (others => '0'));
  
  signal output :
    tuple_t(0 to (max_num_input_pairs*(max_num_input_pairs+1))/2-1)(
      max_output_width-1 downto 0) := (others => (others => '0'));
  
  signal valid_out :
    tuple_t(0 to (max_num_input_pairs*(max_num_input_pairs+1))/2-1)(
      0 downto 0) := (others => (others => '0'));    

  
begin

  -- Instantiate various MAC entities.

  UUT_GEN1 : for i in num_input_pairs_start to num_input_pairs_end generate
    UUT_GEN2 : for j in num_input_pairs_per_cycle_start to i generate

      UUT : entity arc_std.multiply_accumulator
        generic map (
          input1_type => input1_type,
          input2_type => input2_type,
          accumulator_type => accumulator_type,
          num_input_pairs => i,
          num_input_pairs_per_cycle => j)
        port map (
          clk => clk,
          rst => rst,
          
          input1 => input1(0 to j-1),
          input2 => input2(0 to j-1),
          valid_in => valid_in(((i*(i-1))/2)+(j-1))(0),
          output => output(((i*(i-1))/2)+(j-1))(
            get_width(get_multiply_accumulation_output_type(
              input1_type, input2_type, i))-1 downto 0),
          valid_out => valid_out(((i*(i-1))/2)+(j-1))(0));

    end generate;
  end generate;

  
  -- Clock driver; 50% duty cycle.
  clk <= not clk after clock_half_period when done = '0' else clk;

  
  process

    file output_file : text;
    
    variable output_file_line : line;    
    
    variable num_errors : natural := 0;

    variable initiation_interval : positive;
    
    variable calculated_latency : natural;

    variable actual_latency : integer := -1;

  begin

    -- Open any relevant files.
    file_open(output_file, output_file_path, write_mode);
    
    
    -- Reset design(s) for, arbitrarily, 5 clock cycles.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;

    wait until falling_edge(clk);
    rst <= '0';


    ----------------------------------------------------------------------------

    -- Feed in various combinations of inputs to the different units under test.
    
    for num_input_pairs in num_input_pairs_start to num_input_pairs_end loop

      for num_input_pairs_per_cycle in num_input_pairs_per_cycle_start to
        num_input_pairs loop
        
        -- The current unit under test is the one in which
        -- `num_input_pairs => num_input_pairs` and
        -- `num_input_pairs_per_cycle => num_input_pairs_per_cycle`.

        
        -- Calculate the initiation interval of current unit under test.
        initiation_interval :=
          integer(ceil(real(num_input_pairs)/real(num_input_pairs_per_cycle)));

        -- Calculate the latency of current unit under test.
        calculated_latency := multiply_accumulator_pkg.get_latency(
          input1_type, input2_type, accumulator_type,
          num_input_pairs, num_input_pairs_per_cycle);


        valid_in(((num_input_pairs*(num_input_pairs-1))/2)+
                 (num_input_pairs_per_cycle-1))(0) <= '1';
        
        
        -- Reset latency ticker.
        actual_latency := -1;

        
        -- Multiply-accumulate the first input set with second input set.
        for i in 0 to initiation_interval-1 loop
          
          -- Determine if the current input needs to be zero-padded due to
          -- `num_input_pairs_per_cycle` not being a multiple of `num_input_
          -- pairs`.
          --
          -- (Note that, in most cases, the input will need to be separately
          -- zero-padded to handle `num_input_pairs_per_cycle` often being less
          -- than `max_num_input_pairs_per_cycle`.)
          
          if ((i+1)*num_input_pairs_per_cycle-1 <= (num_input_pairs-1)) then

            -- Besides any zero-padding that may be needed to handle
            -- `num_input_pairs_per_cycle` being less than `max_num_input_
            -- pairs_per_cycle`, there is enough data left to fill the input
            -- vector; thus extra zero-padding is not needed.
            
            input1(0 to num_input_pairs_per_cycle-1) <=
              in1((i)*num_input_pairs_per_cycle to
                  (i+1)*num_input_pairs_per_cycle-1);
            
            input1(num_input_pairs_per_cycle to
                   max_num_input_pairs_per_cycle-1) <=
              zero1(num_input_pairs_per_cycle to
                    max_num_input_pairs_per_cycle-1);

            
            input2(0 to num_input_pairs_per_cycle-1) <=
              in2((i)*num_input_pairs_per_cycle to
                  (i+1)*num_input_pairs_per_cycle-1);
            
            input2(num_input_pairs_per_cycle to
                   max_num_input_pairs_per_cycle-1) <=
              zero2(num_input_pairs_per_cycle to
                    max_num_input_pairs_per_cycle-1);

          else
            
            -- Besides any zero-padding that may be needed to handle
            -- `num_input_pairs_per_cycle` being less than `max_num_input_
            -- pairs_per_cycle`, there is not enough data left to fill the
            -- input vector; thus extra zero-padding is needed.
            
            input1(
              0 to ((num_input_pairs-1)-(i)*num_input_pairs_per_cycle + 1)-1) <=
              in1((i)*num_input_pairs_per_cycle to num_input_pairs-1);
            
            input1(((num_input_pairs-1) - (i)*num_input_pairs_per_cycle + 1) to
                   (max_num_input_pairs_per_cycle-1)) <= 
              zero1(((num_input_pairs-1) - (i)*num_input_pairs_per_cycle + 1) to
                    (max_num_input_pairs_per_cycle-1));

            
            input2(
              0 to ((num_input_pairs-1)-(i)*num_input_pairs_per_cycle + 1)-1) <=
              in2((i)*num_input_pairs_per_cycle to num_input_pairs-1);
            
            input2(((num_input_pairs-1) - (i)*num_input_pairs_per_cycle + 1) to
                   (max_num_input_pairs_per_cycle-1)) <= 
              zero2(((num_input_pairs-1) - (i)*num_input_pairs_per_cycle + 1) to
                    (max_num_input_pairs_per_cycle-1));

          end if;


          -- Clock in data.
          actual_latency := actual_latency + 1;
          wait until rising_edge(clk);

          
        end loop;

        
        valid_in(((num_input_pairs*(num_input_pairs-1))/2)+
                 (num_input_pairs_per_cycle-1))(0) <= '0';
        
        
        -- Wait for a valid output to propagate out of the design.
        
        while (valid_out(((num_input_pairs*(num_input_pairs-1))/2)+
                         (num_input_pairs_per_cycle-1))(0) = '0') loop

          actual_latency := actual_latency + 1;
          wait until rising_edge(clk);
          
        end loop;

        
        if (calculated_latency /= actual_latency) then
          
          num_errors := num_errors + 1;
          
          swrite(output_file_line,
                 get_string_latency_error(
                   now, num_input_pairs, num_input_pairs_per_cycle,
                   calculated_latency, actual_latency));
          
          tee(output_file, output_file_line);
          
        end if;

        
        -- Validate output.
        
        wait until rising_edge(clk);
        
        validate(input1_type, input2_type,
                 num_input_pairs, num_input_pairs_per_cycle,
                 in1(0 to num_input_pairs-1), in2(0 to num_input_pairs-1),
                 output(((num_input_pairs*(num_input_pairs-1))/2)+
                        (num_input_pairs_per_cycle-1)),
                 output_file, output_file_line, num_errors);
        
        
      end loop;

    end loop;

    
    -- Allow some additional clock cycles to pass to verify
    -- that the `valid_out` signal becomes de-asserted.
    for i in 0 to 4 loop
      wait until rising_edge(clk);
    end loop;    

    
    -- Wrap up simulation.

    swrite(output_file_line, get_string_simulation_completion(now, num_errors));
    tee(output_file, output_file_line);

    file_close(output_file);

    done <= '1';
    wait;    
    
  end process;

end TB;
