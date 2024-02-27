-- ****************************************************************************
-- pcbt_accumulator_helper.vhd --
--
--     Helper entity to allow the `pcbt_accumulator` entity to be more
--     easily amenable to performing recursion.
--
--     At first, utilizing recursion was avoided for the `pcbt_accumulator`
--     entity, since it seemed a bit tricky to relay the last operand
--     for the PCBT from potentially any arbitrary level within the PCBT.
--
--     However, the alternative to recursion was to utilize an array for
--     storing the inputs/outputs of each level within the PCBT, which
--     led to problems of its own. To ensure that each level, with its
--     potentially varying input/output width, could utilize an array,
--     the array had to be defined such that all its elements had a bit
--     width of the largest output within the PCBT, which is always the
--     output of the entire PCBT. This is fine in and of itself, but to
--     further ensure that each level of the PCBT only utilized as many bits
--     of an array element as were needed (to avoid unnecessary circuit area),
--     some complex, non-static slicing operations needed to take place by
--     way of a function. These complex slicing operations were supported
--     by the relevant synthesis tool (Quartus 19.4), but not by the relevant
--     simulation tool (ModelSim 10.5c). Thus, this is why recursion was
--     ultimately pursued for this entity.
--
--     Although it would be possible to have the `pcbt_accumulator` entity
--     perform recursion by itself, i.e., without a "helper" entity such as
--     `pcbt_accumulator_helper`, doing so would cause the interface of the
--     `pcbt_accumulator` entity to change for the worse, since the last
--     operand of the PCBT potentially needs to be routed through multiple
--     recursive instantiations.
--
--     Regardless, in the end, it seems that recursion provided the most
--     robust means for implementing the relevant design.
--
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
use arc_std.adder_pkg;


package pcbt_accumulator_helper_pkg is

  -- Return the number of clock cycles that the bypass of a specified level
  -- will need to be delayed, if a bypass is to exist for this level;
  -- otherwise, return zero.
  --
  -- In general, a level will bypass an input only when there will not exist
  -- another valid input derived from the current input set to enter this level.
  -- Since all inputs of an input set only pass through a level at most once,
  -- a level will only ever bypass an input at most once for a given input set.
  --
  -- The level to which an input is to be bypassed is the first in which,
  -- including the bypassed input, there will exist two valid operands for
  -- the adder of this level. (This ensures that the input set is correctly
  -- accumulated.)
  --
  -- Clearly, the other operand for the adder on the destination level must
  -- have been derived from the previous level that bypassed the relevant
  -- input, since the previous level only bypasses once for a given input
  -- set. In fact, it must be that this other operand was derived from the
  -- input that immediately preceded the bypassed input. Since the previous
  -- input will not have been bypassed, it will have been fed through the
  -- logic of at least one level, incurring some latency.
  --
  -- On the other hand, the bypassed input will avoid the logic of at
  -- least one level, and, thus, it could reach its destination level
  -- before the previous input does. Unfortunately, depending on the
  -- latency of the relevant adder circuitry as well as the number of
  -- inputs that the PCBT is to accumulate overall, it is possible that
  -- a bypassed input will reach a destination level either before, after,
  -- or at the same time as the other relevant input of the destination
  -- level. Hence, it is appropriate to avoid any possible race condition
  -- involving the arrival time of a bypassed input.
  --
  -- Since the second-to-last input of the previous level will have
  -- started its journey to the destination level before that of
  -- the bypassed input, it is appropriate to ensure that the bypassed
  -- input will always reach the destination level after that of the
  -- other input. (Other possible implementations exist, but the
  -- following minimizes the amount of memory utilized to store operands.)
  --
  -- Let us reemphasize that, although a bypassed input will avoid the logic
  -- of at least one level, this by itself does not guarantee that the
  -- bypassed input will reach a destination level before the other relevant
  -- input. In addition to the latency of the adder circuitry, the particular
  -- level from which an input is to be bypassed generally dictates how
  -- quickly a bypassed input will reach a destination level in relation to a
  -- previous input, since each level of the PCBT receives an input at a
  -- different rate. (In general, assuming that valid inputs are fed into the
  -- PCBT every single cycle, the first level of the PCBT will receive a new
  -- input every cycle, the second level will receive a new input every two
  -- cycles, the third level every four cycles, and so on.)
  --
  -- If, depending on the above factors, the bypassed input is already going
  -- to reach a destination level after that of the other relevant input,
  -- the bypass input does not need to be delayed. However, if the bypassed
  -- input would, without a delay, reach the destination level before or at
  -- the same time as the other relevant input, then the bypassed input must
  -- be delayed. Here, it is defined that if a bypassed input is to be delayed,
  -- it will be delayed such that it will reach the destination level exactly
  -- one cycle after the other relevant input. This is reasonable, since an
  -- input will only ever be bypassed when `num_inputs > 2` (refer to the
  -- definition of the `will_bypass` function to see why this is so), in which
  -- case it is impossible for another valid input from a following input set
  -- to reach a bypass destination level in less than two cycles. In fact,
  -- delaying by two or more cycles opens up the possibility for a valid input
  -- from a following input set to reach the relevant destination level before
  -- or at the same time as a bypassed input, which is clearly intolerable.
  -- In addition, delaying in the manner defined above minimizes the amount of
  -- memory that is needed to implement an appropriate delay.
  function get_bypass_delay(
    input_type : type_t;
    num_inputs : positive;
    level : positive) return natural;

  -- Return latency of PCBT architecture.
  function get_latency(
    input_type : type_t; num_inputs : positive) return natural;

  -- Return the input width for a particular level of the PCBT.
  function get_level_input_type(
    input_type : type_t; level : natural) return type_t;

  -- Return the output type for a particular level of the PCBT.
  function get_level_output_type(
    input_type : type_t; level : positive) return type_t;


  -- Return `true` if the specified level will, at some point,
  -- bypass its input directly to a following level;
  -- otherwise, return `false`.
  function will_bypass(
    num_inputs : positive; level : natural) return boolean;

  
end package;


package body pcbt_accumulator_helper_pkg is

  
  function get_bypass_delay(
    input_type : type_t;
    num_inputs : positive;
    level : positive) return natural is


    variable num_levels : positive := clog2(num_inputs);
    
    variable currentLevelWillBypass :
      boolean := will_bypass(num_inputs, level);
    
    variable previousLevelWillBypass :
      boolean := will_bypass(num_inputs, level-1);

    
    variable destination_level : positive;

    variable i, j : positive;
    variable previous_input_latency : positive;
    variable bypass_input_latency_reduction : natural;
    variable bypass_input_latency : positive;

    
    variable bypass_delay : natural;

    
  begin

    if (currentLevelWillBypass = false) then

      -- No input will be bypassed by the specified level.
      bypass_delay := 0;

    elsif (currentLevelWillBypass = true and
           previousLevelWillBypass = true) then

      -- For simplicity, it is defined that only the level that initiates
      -- some input bypass, not one that continues a bypass from a previous
      -- level, is responsible for implementing a delay.

      -- Thus, in this case, the current level is not to have a bypass delay.

      bypass_delay := 0;

    else

      -- In this case, the specified level will, at some point, initiate a
      -- bypass. 
      --
      -- Below, we determine how many cycles it will take for the previous
      -- input of the bypassing level to reach the destination level.
      -- Then, first assuming that the bypassed input will not be delayed, we
      -- determine how many cycles it would take for the bypassed input to
      -- reach the destination level.
      -- 
      -- If the number of cycles that it takes to generate the bypassed input
      -- after the previous input is greater than the number of cycles that it
      -- will take for the previous input to reach the destination level,
      -- zero delay is assigned to the bypassed input. Otherwise, a delay amount
      -- is assigned such that the bypassed input will arrive at the destination
      -- level exactly one cycle after the previous input.
      --
      -- But here's where it gets tricky... If there exists a level prior
      -- to the current one that will receive a bypassed input from an even
      -- further previous level, then, since a bypassed input can arrive
      -- earlier than any other input, this previous receiving level can
      -- generate an output via its bypassed input earlier than any other
      -- output of this level. Thus, in such circumstances, the current level
      -- of interest can receive its bypassed input earlier than any other
      -- input of the level, which complicates the below procedure!
      --    
      -- More specifically, if a previous level `j`, `j < level`, is to
      -- receive an input that was bypassed from a further previous level `i`,
      -- `i < j`, this bypassed input received by level `j` can arrive up to
      -- 2^(j-1)-1 clock cycles earlier than any other input for level `j`,
      -- since it was defined that all bypassed inputs can arrive as early as
      -- one cycle after a input to the same level. (Recall that, for a level
      -- `j`, the fastest that non-bypass inputs can arrive is every 2^(j-1)
      -- clock cycles, which occurs when a new input is fed in every cycle.)
      --
      -- If level `j` is the only level preceding the current level in which
      -- the above occurs, then the bypass input for the current level will
      -- appear the same amount of cycles earlier that level `j` receives
      -- its bypass input. However, it is possible that the above occurs
      -- multiple times before the current level. In this case, the arrival
      -- time for the bypass input of the current level still depends on
      -- the arrival time for the bypass input of the immediately preceding
      -- bypassing level, but this latter arrival time unfortunately depends
      -- on all previous bypassing levels.
      --
      -- Thus, to determine the arrival time of the bypass input for the
      -- current level, all levels before the current one must be
      -- evaluated, and the bypassing level that immediately precedes the
      -- current level, if one exists, dictates how quickly the current level
      -- can receive its bypass input.
      

      
      -- Initialize the "bypass input latency reduction" value, which is used
      -- to determine how many cycles earlier a level can receive its bypass
      -- input, compared to the earliest amount of cycles that this level can
      -- receive all other inputs.
      bypass_input_latency_reduction := 0;

      -- Search for bypassing levels, starting with the first level of the PCBT
      -- and ending when the specified level, `level`, has been surpassed.
      i := 1;

      while (i <= level) loop
        
        if (not will_bypass(num_inputs, i)) then
          -- Level `i` will not bypass an input; check the following level.
          i := i+1;
          
        else
          -- Level `i` will bypass an input; find the destination
          -- level `j` for this bypass, starting from the level following `i`.
          --
          -- Note that, in this case, it is guaranteed that there exists a
          -- destination level `j`, `j <= num_levels`.
          j := i+1;

          while (j < num_levels) loop

            if (not will_bypass(num_inputs, j)) then
              -- Level `j` is the destination for the bypass of level `i`.
              exit;
            else
              -- Level `j` is not the destination for the bypass of
              -- level `i`; check the following level.
              j := j+1;
            end if;
            
          end loop;

          -- Level `j`, `j <= num_levels`, is the destination of the
          -- bypass of level `i`.

          

          -- Determine whether or not the bypass of level `i` will be delayed.
          --
          -- If the bypass of level `i` is to be delayed, then the destination
          -- level `j` can receive the bypass input of `i` up to 2^(j-1)-1
          -- clock cycles earlier than any other input of `j`, for the reasons
          -- described above.
          --
          -- Otherwise, if the bypass of level `i` is not to be delayed, then
          -- the bypass input will already arrive at the destination level
          -- after the previous input of `i`, and the destination level
          -- can receive the bypass input up to (2^(j-1) -
          -- (bypass_input_latency - previous_input_latency)) clock cycles
          -- earlier than any other input, where (i) `previous_input_latency`
          -- is the number of cycles following the arrival of the second-to-last
          -- input at level `i` that it will take for the second-to-last input
          -- to reach the destination level `j`, and where (ii)
          -- `bypass_input_latency` is the number of cycles following the
          -- arrival of the second-to-last input at level `i` that it would
          -- take for the bypass input to reach the destination level `j`,
          -- excluding any possible delay that may ultimately be implemented
          -- by level `i`.
          

          
          -- The number of cycles following the arrival of the second-to-last
          -- input at level `i` that it will take for the second-to-last input
          -- to reach the destination level `j`.
          --
          -- Note that the term `1+` is to account for the one register
          -- that the second-to-last input must pass through before reaching
          -- an adder of a level. Only one register must be passed through,
          -- rather than two, since, if an input is to be bypassed by level
          -- `i`, it is guaranteed that the second-to-last input of level `i`
          -- will accompany another operand already stored by level `i`.
          previous_input_latency :=
            (1+adder_pkg.get_latency(input_type))*(j-i);


          -- The number of cycles following the arrival of the second-to-last
          -- input at level `i` that it would take for the bypass input to
          -- reach the destination level `j`, excluding any possible delay
          -- that may ultimately be implemented by level `i`. 
          --
          -- Note that, for the first bypassing level of the PCBT,
          -- `bypass_input_latency_reduction` will be equal to zero.
          -- However, for any additional bypassing level, this variable
          -- will be greater than zero, accounting for the fact that the
          -- bypass input of the additional bypassing level will arrive
          -- sooner than any other input of this level.
          bypass_input_latency := 2**(i-1) - bypass_input_latency_reduction;

          
          if (bypass_input_latency <= previous_input_latency) then
            -- In this case, if no delay was to be implemented for the bypass
            -- input, the second-to-last input would arrive at level `j` either
            -- (i) at the same time as or (ii) later than the bypass input.
            -- As mentioned above, this cannot be allowed, and the bypass input
            -- must be delayed such that it arrives exactly one cycle after the
            -- second-to-last input.
            
            bypass_delay := (previous_input_latency - bypass_input_latency + 1);

            
            -- Since, the bypassed input will be delayed, it is guaranteed
            -- that the destination level `j` can receive the bypassed input
            -- up to 2^(j-1)-1 cycles earlier than any other input. Thus,
            -- any following level that must bypass an input can receive
            -- its bypass input up to 2^(j-1)-1 cycles earlier than any
            -- other input. The `bypass_input_latency_reduction` variable
            -- is updated to reflect this fact.

            bypass_input_latency_reduction := 2**(j-1) - 1;

            
          else
            -- In this case, if no delay was to be implemented for the
            -- bypass input, the second-to-last input would actually
            -- arrive at level `j` before the bypass input. Thus,
            -- the bypassed input does not need to be delayed.
            
            bypass_delay := 0;

            
            -- Since the bypassed input does not need to be delayed,
            -- it is guaranteed that the destination level `j` can
            -- receive the bypassed input up to (2^(j-1) -
            -- (bypass_input_latency - previous_input_latency)) cycles
            -- earlier than any other input. Thus, any following
            -- level that must bypass an input can receive its
            -- bypass input up to this same amount of cycles earlier
            -- than any other input. The `bypass_input_latency_reduction`
            -- variable is updated to reflect this fact.

            bypass_input_latency_reduction :=
              (2**(j-1) - (bypass_input_latency - previous_input_latency));

          end if;
          
          -- Attempt to search for another bypassing level, starting
          -- at the level following that of the previously found
          -- destination level.
          i := j+1;

        end if;
        
      end loop;

      -- After executing the above loop, the final value of `bypass_delay`
      -- is guaranteed to be the correct delay value for the level that
      -- was originally specified to the function.

    end if;

    
    return bypass_delay;

    
  end function;

  

  function get_latency(
    input_type : type_t; num_inputs : positive) return natural is

    variable num_levels : positive := clog2(num_inputs);
    
    variable latency : positive;

    variable i : positive;
    
  begin
    -- It is assumed that `num_inputs > 1`, since this function will
    -- only ever be called by the `pcbt_accumulator_pkg` package when
    -- this is indeed the case.
    
    if (is_power_of_two(num_inputs)) then
      -- When `num_inputs` is a power of two, it takes `num_inputs-1` cycles
      -- for all of the inputs to enter the PCBT and then `num_levels*
      -- (1+adder_pkg.get_latency(input_type))` additional cycles for the last
      -- input to pass through the PCBT.
      latency := (num_inputs-1)+
                 num_levels*(1+adder_pkg.get_latency(input_type));
    else
      -- When `num_inputs` is not a power of two, certain levels of the PCBT
      -- will route their last input directly to a following level. This
      -- ultimately causes the last input of the PCBT to pass through the
      -- PCBT faster than normal. (For more details regarding input bypassing,
      -- see the `get_bypass_delay` function of this file.)

      
      -- First, there exists a certain amount of latency before all inputs
      -- have entered the PCBT.
      latency := (num_inputs-1);

      -- Then, there exists latency for last input of the PCBT to pass through
      -- the PCBT. This latency is dependent on how the input is bypassed
      -- through certain levels of the PCBT. 
      --
      -- For each non-bypassing level that the last input passes through, a
      -- latency of `1+adder_pkg.get_latency(input_type)` clock cycles is
      -- incurred. For each bypassing level `i` that the last input passes
      -- through, a latency of `get_bypass_delay(input_type, num_inputs, i)`
      -- clock cycles is incurred.

      -- Determine the latency incurred by the last input passing through
      -- each level `i` of the PCBT.
      i := 1;

      while (i <= num_levels) loop
        if (will_bypass(num_inputs, i)) then
          latency := latency + get_bypass_delay(input_type, num_inputs, i);
        else
          latency := latency + (1+adder_pkg.get_latency(input_type));
        end if;

        i := i+1;
      end loop;

    end if;

    return latency;
    
  end function;    

  
  function get_level_input_type(
    input_type : type_t; level : natural) return type_t is

    variable result : type_t;
    
  begin
    
    if (is_float(input_type)) then
      -- For floating-point arithmetic, the input width
      -- of every level is equivalent to the initial input width.
      result := input_type;
      
    else
      -- For integer arithmetic, the input width grows from
      -- the initial input width by one for every level after the first.
      result := init_type(get_integer_encoding(input_type),
                          get_width(input_type)+(level-1));

    end if;

    return result;
    
  end function;



  function get_level_output_type(
    input_type : type_t; level : positive) return type_t is

  begin
    -- The output width of a level is one more than the input
    -- width of the level, since only one addition operation is
    -- performed within a level. Equivalently, the output width
    -- of a level is the input width of the following level,
    -- assuming that one always exists.
    
    return get_level_input_type(input_type, level+1);
    
  end function;

  
  
  function will_bypass(
    num_inputs : positive; level : natural) return boolean is

  begin
    
    if (level = 0) then
      -- This case was introduced to handle a recursion base case;
      -- there is no zeroth level of the PCBT.
      
      return false;
      
    else
      -- The specified level will need to, at some point, bypass its
      -- input if the number of inputs that will enter *this* level is
      -- not divisible by two. (This is because the adder that exists
      -- at every level only adds pairs of inputs.)
      --
      -- Note that the final level, i.e., `level = num_levels`, will never
      -- bypass its input, and note that this fact is correctly reflected
      -- by the following conditional check, since `2**(num_levels-1)` is
      -- always greater than or equal to half of `num_inputs`, but not
      -- greater than `num_inputs`, so that the ceiling of `num_inputs`
      -- divided by `2**(num_levels-1)` will always be a multiple of two. 
      
      return (((integer(ceil(real(num_inputs)/real(2**(level-1))))) mod 2) = 1);
      
    end if;
    
  end function;

  
end package body;


-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.reg_pkg.all;
use arc_std.counter_pkg.all;
use arc_std.pcbt_accumulator_helper_pkg.all;
  
entity pcbt_accumulator_helper is
  generic (
    input_type : type_t;
    num_inputs : positive;
    
    num_levels : positive := clog2(num_inputs);
    current_level : positive := num_levels;

    input_width : positive := get_width(input_type);
    output_type : type_t := get_level_output_type(input_type, current_level);
    output_width : positive := get_width(output_type));
  port (
    clk : in std_logic;
    rst : in std_logic;

    input : in std_logic_vector(input_width-1 downto 0);
    valid_in : in std_logic;
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic;
    
    bypass_out : out std_logic_vector(output_width-1 downto 0);
    bypass_valid_out : out std_logic);
end entity;


architecture MIX of pcbt_accumulator_helper is

  -- Return the number of valid inputs that will enter a specified
  -- level before a valid input is bypassed by the level, if such an
  -- input is to exist; returns zero otherwise.
  --
  -- More specifically, if a positive number `n` is returned by this
  -- function, the `n`-th valid input (not `n+1`-th valid input)
  -- of the specified level is to be bypassed by the level.  
  function get_num_valid_inputs_until_bypass(
    level : positive; num_inputs : positive := num_inputs) return natural is

    variable will_bypass : boolean := will_bypass(num_inputs, level);

  begin
    
    if (will_bypass = false) then
      
      -- No input will be bypassed by the specified level.
      return 0;
      
    else

      -- At some point, an input will be bypassed by the
      -- specified level; return the number of valid inputs
      -- that must occur before a valid input is bypassed
      -- by the level.
      return integer(ceil(real(num_inputs)/real(2**(level-1))));
      
    end if;
      
  end function;


  -- Return a bypass signal that is resized for the output width of the
  -- current level, based on the relevant data type.
  function resize_bypass(
    bypass : std_logic_vector;
    input_type : type_t := input_type;
    output_width : positive := output_width) return std_logic_vector is

    variable bypass_resized : std_logic_vector(output_width-1 downto 0);
    
  begin
    
    if (is_float(input_type)) then
      -- For a floating-point value, a bypass signal will not be resized.
      bypass_resized := bypass;
      
    else
      -- For an integer value, a bypass signal will be resized
      -- based on its type.
      if (is_unsigned_integer(input_type)) then
        bypass_resized :=
          std_logic_vector(resize(unsigned(bypass), output_width));

      else
        bypass_resized :=
          std_logic_vector(resize(signed(bypass), output_width));

      end if;
    end if;

    return bypass_resized;
    
  end function;
  
-------------------------------------------------------------------------------

  constant input_type_current_level :
    type_t := get_level_input_type(input_type, current_level);

  constant input_width_current_level : positive :=
    get_width(input_type_current_level);


  -- Boolean constants to determine whether or not the previous and
  -- current levels of the PCBT will, at some point, bypass their inputs.
  --
  -- Note that these constants allow the below recursion to be structured
  -- in a simple manner.
  constant current_level_will_bypass : 
    boolean := will_bypass(num_inputs, current_level);
  
  constant previous_level_will_bypass :
    boolean := will_bypass(num_inputs, current_level-1);
    
-------------------------------------------------------------------------------
  
  -- Input signals for the current level of the PCBT.
  signal input_current_level :
    std_logic_vector(input_width_current_level-1 downto 0);

  signal valid_in_current_level : std_logic;


  -- Signals for the shift register pair of the current level.
  signal first_operand_reg_in :
    std_logic_vector(input_width_current_level-1 downto 0);

  signal first_operand_reg_out :
    std_logic_vector(input_width_current_level-1 downto 0);

  signal second_operand_reg_out :
    std_logic_vector(input_width_current_level-1 downto 0);

  signal operand_reg_enable : std_logic;


  -- Signals for the `U_ADDER_COUNTER` counter entity of the current level.
  signal adder_counter_enable : std_logic;
  signal adder_counter_overflow : std_logic;


  -- Signals related to the bypass output of the previous level,
  -- with exception to the first level.
  --
  -- Note that these signals are only used in the case
  -- that `previous_level_will_bypass = true`.
  signal bypass_in : std_logic_vector(input_width_current_level-1 downto 0);
  signal bypass_valid_in : std_logic;


  -- Signals related to the bypass output of the current level,
  -- with exception to the last level.
  --
  -- Note that this signal is only used in the case
  -- that `current_level_will_bypass = true`.
  signal bypass_counter_overflow : std_logic;
  
  signal bypass_out_delay :
    std_logic_vector(input_width_current_level-1 downto 0);
  

  
begin -- MIX  

  
  -- Recursively instantiate prior levels of the PCBT, if any.

  
  U_RECURSION : if (current_level = 1) generate
    -- Base case.
    --
    -- First level of PCBT.

    input_current_level <= input;
    valid_in_current_level <= valid_in;

  else generate
    -- Recursive case.
    --
    -- Any level of the PCBT following than the first.

    U_PCBT_RECURSIVE : entity arc_std.pcbt_accumulator_helper
      generic map (
        input_type => input_type,
        num_inputs => num_inputs,
        current_level => current_level-1)
      port map (
        clk => clk,
        rst => rst,

        input => input,
        valid_in => valid_in,

        output => input_current_level,
        valid_out => valid_in_current_level,

        bypass_out => bypass_in,
        bypass_valid_out => bypass_valid_in);

    
  end generate U_RECURSION;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  
  -- Construct the current level.


  -- First, construct the elements common to every level.

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  
  -- Shift registers to store the operands for the adder of this level.
  
  U_REG_FIRST_OPERAND : entity arc_std.reg
    generic map (
      data_type => input_type_current_level,
      reg_type => no_rst_t)
    port map (
      clk => clk,
      enable => operand_reg_enable,
      input => first_operand_reg_in,
      output => first_operand_reg_out);


  U_REG_SECOND_OPERAND : entity arc_std.reg
    generic map (
      data_type => input_type_current_level,
      reg_type => no_rst_t)
    port map (
      clk => clk,
      enable => operand_reg_enable,
      input => first_operand_reg_out,
      output => second_operand_reg_out);

-------------------------------------------------------------------------------
  
  -- Counter to determine the `valid_in` signal for the adder of this level.
  --
  -- The counter will produce a valid signal for the adder once two valid
  -- operands have been shifted into the above registers.

  U_ADDER_COUNTER : entity arc_std.counter
    generic map (
      period => 2,
      counter_type => sync_t)
    port map (
      clk => clk,
      rst => rst,
      enable => adder_counter_enable,
      output => open,
      overflow => adder_counter_overflow);

-------------------------------------------------------------------------------

  -- Adder to perform the addition of this level.
  
  U_ADD : entity arc_std.adder
    generic map (
      input1_type => input_type_current_level,
      input2_type => input_type_current_level,
      use_valid => true,
      output_type => output_type)
    port map (
      clk => clk,
      rst => rst,
      input1 => first_operand_reg_out,
      input2 => second_operand_reg_out,
      valid_in => adder_counter_overflow,
      output => output,
      valid_out => valid_out);
  
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  
  -- Next, construct the remaining elements of the current level
  -- and connect any relevant signals together, all of which depends
  -- on whether or not the previous and current levels will, at some
  -- point, bypass an input.

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  
  U_BYPASS_COND: if ((current_level_will_bypass = false) and
                     (previous_level_will_bypass = false)) generate

    -- In this case, the current level can simply
    -- utilize the common level elements.

    first_operand_reg_in <= input_current_level;

    operand_reg_enable <= valid_in_current_level;
    
    adder_counter_enable <= operand_reg_enable;


    -- Drive the bypass outputs to avoid simulator warnings.
    -- (Note that these bypass outputs are not utilized.)
    bypass_out <= (others => '0');
    bypass_valid_out <= '0';

-------------------------------------------------------------------------------
    
  elsif ((current_level_will_bypass = false) and
         (previous_level_will_bypass = true)) generate

    -- In this case, in addition to utilizing the common elements,
    -- the current level will need to, at some point, resolve an
    -- input that was bypassed from the previous level. For the
    -- current input set, a received input that was bypassed
    -- from a previous level will represent the last operand
    -- for the adder of this level.


    -- A valid input for the first operand register will come from
    -- either `input_current_level` or `bypass_in`. It is guaranteed
    -- that a valid bypass input will never arrive at the same time
    -- as a regular valid input, since bypass inputs are delayed
    -- appropriately by the following conditional generate case
    -- statement further below.

    first_operand_reg_in <= bypass_in when bypass_valid_in = '1'
                            else input_current_level;

    
    -- Since a valid bypass input will never arrive at the same time
    -- as a regular valid input, any assertions of `valid_in_current_level`
    -- are mutually exclusive from any assertions of `bypass_valid_in`.
    -- Thus, the operand shift register pair can be enabled by either signal.
    operand_reg_enable <= valid_in_current_level or bypass_valid_in;

    
    adder_counter_enable <= operand_reg_enable;


    -- Drive the bypass outputs to avoid simulator warnings.
    -- (Note that these bypass outputs are not utilized.)
    bypass_out <= (others => '0');
    bypass_valid_out <= '0';

-------------------------------------------------------------------------------
    
  elsif ((current_level_will_bypass = true) and
         (previous_level_will_bypass = false)) generate

    -- In this case, in addition to utilizing the common elements,
    -- the current level will, at some point, bypass its input directly
    -- to a following level. For the current input set, an input that is
    -- to be bypassed is the last input that will enter the current level.

    
    -- A counter is used to determine when the level must bypass its input.
    U_BYPASS_COUNTER : entity arc_std.counter
      generic map (
        period => get_num_valid_inputs_until_bypass(current_level),
        counter_type => async_t)
      port map (
        clk => clk,
        rst => rst,
        enable => valid_in_current_level,
        output => open,
        overflow => bypass_counter_overflow);


    -- It is possible that the bypassed input and the valid signal
    -- associated with the bypassed input will need to be delayed.
    -- For simplicity, the entire relevant delay is implemented
    -- in the level that is to initiate the bypass.

    U_BYPASS_INPUT_DELAY : entity arc_std.delay
      generic map (
        data_type => input_type_current_level,
        num_cycles => get_bypass_delay(input_type, num_inputs, current_level))
      port map (
        clk => clk,
        input => input_current_level,
        output => bypass_out_delay);

    U_BYPASS_VALID_DELAY : entity arc_std.delay
      generic map (
        use_valid => true,
        num_cycles => get_bypass_delay(input_type, num_inputs, current_level))
      port map (
        clk => clk,
        rst => rst,
        valid_in => bypass_counter_overflow,
        valid_out => bypass_valid_out);


    
    -- Assign other relevant signals.

    first_operand_reg_in <= input_current_level;
    
    operand_reg_enable <= valid_in_current_level;
    
    -- It must be ensured that the `U_ADDER_COUNTER` entity
    -- of this level does not get enabled when the
    -- to-be-bypassed input arrives, since this would
    -- cause the count value to be invalid upon the PCBT
    -- handling an additional input set, if any.
    adder_counter_enable <= operand_reg_enable and
                            (not bypass_counter_overflow);



    -- Assign the bypass outputs of this level.
    bypass_out <= resize_bypass(bypass_out_delay);


-------------------------------------------------------------------------------

  elsif ((current_level_will_bypass = true) and
         (previous_level_will_bypass = true)) generate

    -- In this final case, in addition to utilizing the common
    -- elements, the current level must simply continue bypassing
    -- some input that was bypassed from a previous level.
    --
    -- No additional delay must be implemented for the bypass of
    -- this level, since the entire relevant delay was implemented
    -- by the level from which the bypass input originated.

    bypass_out <= resize_bypass(bypass_in);
    bypass_valid_out <= bypass_valid_in;

    
    first_operand_reg_in <= input_current_level;
    
    operand_reg_enable <= valid_in_current_level;
    
    adder_counter_enable <= operand_reg_enable;
    
  end generate U_BYPASS_COND;
  
end architecture MIX;
