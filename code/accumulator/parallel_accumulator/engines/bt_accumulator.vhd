-- ****************************************************************************
-- bt_accumulator.vhd --
--
--     Binary tree accumulator.
--
--     A binary tree accumulator is the most common parallel accumulator.
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


package bt_accumulator_pkg is
  
  function get_latency(
    input_type : type_t; num_inputs : natural) return natural;

end package;


package body bt_accumulator_pkg is

  function get_latency(
    input_type : type_t; num_inputs : natural) return natural is

    variable latency : natural := 0;
    
  begin

    if (num_inputs > 1) then
      latency := clog2(num_inputs)*adder_pkg.get_latency(input_type);
    end if;

    return latency;
    
  end function;

end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.bt_accumulator_pkg.all;
  
entity bt_accumulator is
  generic (
    input_type : type_t;
    num_inputs : positive;
    use_valid : boolean := true;
    
    input_width : positive := get_width(input_type);
    output_type : type_t := math_pkg.get_accumulation_output_type(
      input_type, num_inputs);
    output_width : positive := get_width(output_type));
  port (
    clk : in std_logic;
    rst : in std_logic;
    
    input : in tuple_t(0 to num_inputs-1)(input_width-1 downto 0);
    valid_in : in std_logic := '-';
    output : out std_logic_vector(output_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture MIX of bt_accumulator is

  -- Return the height of current overall tree.
  function get_height(num_inputs : positive) return positive is

    variable height : positive;
    
  begin

    if (num_inputs = 1) then
      
      -- When the base case of the relevant recursion is met,
      -- height is indeed zero (in terms of the typical computer
      -- science definition), but with a value of zero for height,
      -- the definition of the constant `num_inputs_left_subtree`
      -- will be the source of a runtime error. Thus, for
      -- simplicity, height is defined to be one in this base case,
      -- which is ultimately arbitrary, since any positive number
      -- will suffice. (Alternatively, a function for calculating
      -- `num_inputs_left_subtree` could be created, but this
      -- was not chosen.)
      
      height := 1;

    else

      height := clog2(num_inputs);
      
    end if;

    return height;
      
  end function;


-------------------------------------------------------------------------------
  
  constant height : positive := get_height(num_inputs);
  
  constant num_inputs_left_subtree : natural := 2**(height-1);
  
  constant num_inputs_right_subtree : natural :=
    num_inputs-num_inputs_left_subtree;
  
  constant output_type_left_subtree : type_t :=
    get_accumulation_output_type(input_type, num_inputs_left_subtree);
  constant output_type_right_subtree : type_t :=
    get_accumulation_output_type(input_type, num_inputs_right_subtree);


  constant latency_left_subtree :
    natural := get_latency(input_type, num_inputs_left_subtree);
                                                         
  constant latency_right_subtree :
    natural := get_latency(input_type, num_inputs_right_subtree);

  -- Latency offset used to balance right subtree pipeline
  -- when necessary, as explained further below.
  constant latency_offset_right_subtree :
    natural := latency_left_subtree-latency_right_subtree;
  
  
-------------------------------------------------------------------------------

  signal input_left_subtree :
    tuple_t(0 to num_inputs_left_subtree-1)(
      input_width-1 downto 0);
  
  signal input_right_subtree :
    tuple_t(0 to num_inputs_right_subtree-1)(
      input_width-1 downto 0);

  
  signal output_left_subtree : 
    std_logic_vector(get_width(output_type_left_subtree)-1 downto 0);


  -- For a number of inputs that is not a power of two,
  -- there will ultimately exist a right subtree
  -- that should be balanced by delay registers.
  -- The recursion will not account for this balancing,
  -- so there must exist two signals for the result of
  -- the right subtree, one that represents the relevant
  -- imbalanced result and one that represents the
  -- relevant balanced result.
  signal output_right_subtree_imbalanced :
    std_logic_vector(get_width(output_type_right_subtree)-1 downto 0);

  -- Balanced result of right subtree.
  signal output_right_subtree :
    std_logic_vector(get_width(output_type_right_subtree)-1 downto 0);


begin -- MIX

  
  -- Via recursion, build a binary tree accumulator with `num_inputs` inputs.

  U_RECURSION : if (num_inputs = 1) generate
    
    -- Base case.
    --
    -- No addition operation needed;
    -- simply feed the input through to the output.
    output <= input(0);

    
  else generate
    
    -- Recursive case.
    --    
    -- Split the current adder subtree into two smaller adder subtrees,
    -- a "left" subtree and a "right" subtree, and compute the result
    -- of the current tree by adding the results of these two
    -- smaller subtrees.

    input_left_subtree <= input(0 to num_inputs_left_subtree-1);
    input_right_subtree <= input(num_inputs_left_subtree to num_inputs-1);

    
    U_LEFT_SUBTREE : entity arc_std.bt_accumulator
      generic map (
        input_type => input_type,
        use_valid => false,
        num_inputs => num_inputs_left_subtree)
      port map (
        clk => clk,
        rst => rst,  
        input => input_left_subtree,
        output => output_left_subtree);

    
    U_RIGHT_SUBTREE : entity arc_std.bt_accumulator
      generic map (
        input_type => input_type,
        use_valid => false,
        num_inputs => num_inputs_right_subtree)
      port map (
        clk => clk,
        rst => rst,
        input => input_right_subtree,
        output => output_right_subtree_imbalanced);


    -- If the current tree has an odd number of inputs, the pipeline
    -- created for the right subtree is not aligned with the pipeline
    -- created for the left subtree. Thus, the result of the right
    -- subtree must be delayed by the difference between the latencies
    -- of the left and right subtree pipelines, to account for this
    -- pipeline imbalance.
      
    U_DELAY : entity arc_std.delay
      generic map (
        data_type => output_type_right_subtree,
        num_cycles => latency_offset_right_subtree)
      port map (
        clk => clk,
        input => output_right_subtree_imbalanced,
        output => output_right_subtree);
      

    -- Compute the result of the current tree by adding
    -- the results of the left and right subtrees.
    U_SUBTREE_ADD : entity arc_std.adder
      generic map (
        input1_type => output_type_left_subtree,
        input2_type => output_type_right_subtree)
      port map (
        clk => clk,
        rst => rst,
        input1 => output_left_subtree,
        input2 => output_right_subtree,
        output => output);
    
  end generate U_RECURSION;


  -- Delay logic for `valid_in` signal, which is only
  -- instantiated once for an overall accumulator tree,
  -- i.e., this is not instantiated for any recursive
  -- instantiations of `bt_accumulator`.
  U_VALID_DELAY_COND : if (use_valid = true) generate
    
  U_VALID_DELAY : entity arc_std.delay
    generic map (
      use_valid => true,
      num_cycles => get_latency(input_type, num_inputs))
    port map (
      clk => clk,
      rst => rst,
      valid_in => valid_in,
      valid_out => valid_out);

  end generate U_VALID_DELAY_COND;
  

  
end architecture MIX;
