-- ****************************************************************************
-- multiplexer.vhd --
--
--     Generic multiplexer.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 10, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package multiplexer_pkg is

  -- Return latency for a pipelined (`radix` x 1) multiplexer tree
  -- with `num_inputs` inputs.
  function get_latency(
    num_inputs : positive; radix : positive) return natural;


  -- Return the element of `input` whose index is the integer representation
  -- of `sel`, if this integer is within the index range of `inputs`;
  -- otherwise, return a `std_logic_vector` whose value is zero and whose
  -- width is the same as all elements of `input`.
  function sel(
    input : tuple_t; sel : std_logic_vector) return std_logic_vector;

  
end package;

package body multiplexer_pkg is

  function get_latency(
    num_inputs : positive; radix : positive) return natural is

    constant depth : positive := clog_pos(num_inputs, radix);
    
  begin

    -- In the case of pipelining, there is a register placed at
    -- every level of the relevant multiplexer tree; hence, the
    -- latency in this case is `depth`.
    return depth;

  end function;

  
  function sel(
    input : tuple_t;
    sel : std_logic_vector) return std_logic_vector is

    -- Create an array to map all possible select values,
    -- where any value outside the range of `input` is set to '0'.
    variable multiplexer_in :
      tuple_t(0 to 2**(sel'length)-1)(input(0)'range) :=
      (others => (others => '0'));

  begin

    multiplexer_in(input'range) := input;
    return multiplexer_in(to_integer(unsigned(sel)));
    
  end function;

  
end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.multiplexer_pkg;
use arc_std.multiplexer_pkg.all;

entity multiplexer is
  generic (
    data_type : type_t;
    num_inputs : positive;
    use_pipelining : boolean := false;

    -- The following two generics are only applicable if
    -- `use_pipelining` is true.
    radix : positive := 2;
    use_valid : boolean := false;

    data_width : positive := get_width(data_type);
    sel_width : positive := n_bits_amount(num_inputs));
  
  port (
    clk : in std_logic := '0';
    rst : in std_logic := '0';
    
    input : in tuple_t(0 to num_inputs-1)(data_width-1 downto 0);
    sel : in std_logic_vector(sel_width-1 downto 0) := (others => '0');
    valid_in : in std_logic := '0';
    output : out std_logic_vector(data_width-1 downto 0);
    valid_out : out std_logic := '-');
  
end entity;

architecture BHV of multiplexer is

  -- Note that all of the following functions, constants, and signals are
  -- only pertinent when the Boolean generic `use_pipelining` is true.

-------------------------------------------------------------------------------
  
  -- Return the number of subtrees for a (`radix` x 1) multiplexer tree
  -- with `num_inputs` inputs.
  --
  -- Note that it is defined that there will always exist at least one
  -- subtree, so that some synthesis warnings can be avoided for some of
  -- the below signals.
  function get_num_subtrees(
    num_inputs : positive; radix : positive) return positive is

    constant depth : positive := clog_pos(num_inputs, radix);
    
    constant num_possible_subtrees : positive := radix;

    constant num_possible_subtree_inputs : positive := radix**(depth-1);    

    variable num_subtrees : positive := 1;

  begin

    for i in 1 to num_possible_subtrees-1 loop

      if ((num_inputs-(i*num_possible_subtree_inputs)) <= 0) then
        -- No available inputs.
        exit;
        
      else
        -- More than zero available inputs; thus, another
        -- subtree is to exist.
        num_subtrees := num_subtrees+1;
        
      end if;
      
    end loop;

    return num_subtrees;

  end function;


  -- Return an array containing the number of inputs for each subtree.
  function get_num_subtree_inputs(
    num_inputs : positive; radix : positive) return positive_array is

    constant num_subtrees : positive := get_num_subtrees(num_inputs, radix);    

    constant depth : positive := clog_pos(num_inputs, radix);
    
    constant num_possible_subtree_inputs : positive := radix**(depth-1);

    variable num_subtree_inputs : positive_array(0 to num_subtrees-1);

  begin

    for i in 0 to num_subtrees-1 loop

      if ((num_inputs-(i*num_possible_subtree_inputs)) <
          (num_possible_subtree_inputs)) then
        -- Between one and `num_possible_subtree_inputs-1` inputs are available.
        --
        -- Note that, since `num_subtrees` is calculated to be the number
        -- of subtrees with at least one input, it is impossible to have
        -- the below calculation result in zero.
        num_subtree_inputs(i) := num_inputs-(i*num_possible_subtree_inputs);
        
      else
        -- Exactly `num_possible_subtree_inputs` or more inputs are available.
        num_subtree_inputs(i) := num_possible_subtree_inputs;
        
      end if;
      
    end loop;

    return num_subtree_inputs;

  end function;
  

  -- Return an array of cumulative sums of the number of subtree inputs, but
  -- where the first element of the array is zero and the cumulative sum does
  -- not begin until the second element. The sums are derived from each of
  -- the subtree inputs except the last, starting with the first.
  function get_cumulative_num_subtree_inputs(
    num_subtree_inputs : positive_array) return natural_array is

    constant num_subtrees : positive := num_subtree_inputs'length;
    
    variable cumulative_num_subtree_inputs : natural_array(0 to num_subtrees-1);

  begin

    cumulative_num_subtree_inputs(0) := 0;

    for i in 1 to num_subtrees-1 loop

      cumulative_num_subtree_inputs(i) :=
        cumulative_num_subtree_inputs(i-1) + num_subtree_inputs(i-1);
      
    end loop;

    return cumulative_num_subtree_inputs;

  end function;


  -- Return an array containing the select width of each subtree.
  function get_subtree_sel_widths(
    num_subtree_inputs : positive_array) return positive_array is

    constant num_subtrees : positive := num_subtree_inputs'length;

    variable subtree_select_widths : positive_array(0 to num_subtrees-1);

  begin

    for i in 0 to num_subtrees-1 loop

      subtree_select_widths(i) :=
        n_bits_amount(num_subtree_inputs(i));
      
    end loop;

    return subtree_select_widths;

  end function;

-------------------------------------------------------------------------------

  -- Number of levels for a (`radix` x 1) multiplexer tree.
  -- This is used to delay the `valid_in` signal, if needed.
  constant num_levels : natural := arc_std.math_pkg.clog(num_inputs, radix);
  
  -- Number of subtrees for a (`radix` x 1) multiplexer tree.
  constant num_subtrees : positive := get_num_subtrees(num_inputs, radix);

  -- Number of multiplexer inputs for each of the subtrees.
  constant num_subtree_inputs : positive_array(0 to num_subtrees-1) :=
    get_num_subtree_inputs(num_inputs, radix);

  -- Cumulative sums of the number of subtree inputs, so that the following
  -- recursion can easily extract which inputs to supply to each of the
  -- multiplexer subtrees.
  constant cumulative_num_subtree_inputs : natural_array(0 to num_subtrees-1) :=
    get_cumulative_num_subtree_inputs(num_subtree_inputs);

  -- Number of bits needed for the select lines of each subtree.
  constant subtree_sel_widths : positive_array :=
    get_subtree_sel_widths(num_subtree_inputs);

  -- Number of bits needed for the output multiplexer of the current tree.
  constant output_mux_sel_width : positive :=
    n_bits_amount(num_subtrees);

  constant output_mux_sel_type : type_t :=
    uint_type(output_mux_sel_width);

-------------------------------------------------------------------------------
  
  -- The outputs of each of the `num_subtrees` multiplexer trees.
  signal subtree_output, subtree_output_aligned : tuple_t(
    0 to num_subtrees-1)(data_width-1 downto 0) := (
      others => (others => '0'));

  -- Select lines for the output multiplexer of the current tree. 
  signal output_mux_sel : std_logic_vector(
    output_mux_sel_width-1 downto 0) := (others => '0');

  
begin

  U_MUX_GEN : if (use_pipelining = false) generate

    -- No pipelining.
    output <= multiplexer_pkg.sel(input, sel);
    valid_out <= valid_in;

  else generate

    -- Recursively generate a (`radix` x 1) multiplexer tree,
    -- placing registers between each level.

    U_RECURSION : if (num_inputs <= radix) generate

      -- Base case. Produce the output of the current multiplexer tree
      -- by feeding the current input directly into a (`radix` x 1)
      -- multiplexer, followed by a register.

      U_MUX : entity arc_std.multiplexer
        generic map (
          data_type => data_type,
          num_inputs => num_inputs,
          use_pipelining => false)
        port map (
          input => input,
          sel => sel,
          output => subtree_output(0));

      U_REG : entity arc_std.reg
        generic map (data_type => data_type)
        port map (
          clk => clk,
          rst => rst,
          input => subtree_output(0),
          output => output);


    else generate

      -- Recursive case. Generate `num_subtrees` (`radix` x 1)
      -- multiplexer subtrees, and then use a (`radix` x 1)
      -- multiplexer to select from the `num_subtrees` outputs.

      U_MUX_SUBTREE_GEN : for i in 0 to num_subtrees-1 generate

        U_MUX : entity arc_std.multiplexer
          generic map (
            data_type => data_type,
            num_inputs => num_subtree_inputs(i),
            use_pipelining => true,
            radix => radix)
          port map (
            clk => clk,
            rst => rst,
            input => input(cumulative_num_subtree_inputs(i) to
              cumulative_num_subtree_inputs(i)+num_subtree_inputs(i)-1),
            sel => sel(subtree_sel_widths(i)-1 downto 0),
            output => subtree_output(i));
                          
      end generate U_MUX_SUBTREE_GEN;


      -- Note that, when in this recursive case, it is guaranteed that there
      -- exists more than one subtree. When there exists more than one subtree,
      -- it is possible for the final subtree to have a lesser latency
      -- than that of the other subtree(s); thus, the output of this final
      -- subtree must be aligned with the other(s), if this occurs. (Note
      -- that the latency of the final subtree cannot be greater than that
      -- of the other subtrees.)

      -- The first `num_subtrees-1` trees are guaranteed to be aligned.
      subtree_output_aligned(0 to num_subtrees-2) <=
        subtree_output(0 to num_subtrees-2);

      
      U_FINAL_SUBTREE_OUTPUT_DELAY : entity arc_std.delay
        generic map (
          data_type => data_type,
          num_cycles => (
            get_latency(num_subtree_inputs(num_subtrees-2), radix) -
            get_latency(num_subtree_inputs(num_subtrees-1), radix)))
        port map (
          clk => clk,
          input => subtree_output(num_subtrees-1),
          output => subtree_output_aligned(num_subtrees-1));


      -- Delay the select lines relevant to the output multiplexer
      -- of the current tree by a number of cycles equivalent to
      -- that of the latency of the aligned subtrees.
      --
      -- Note that the most-significant `subtree_sel_width` bits of
      -- `sel` define the least-significant `subtree_sel_width` bits
      -- of `output_mux_select`; all other bits of `output_mux_select`,
      -- if any, are forced to zero whenever there is not enough
      -- subtrees to warrant driving them conditionally.
      --
      -- Also, note that every output multiplexer of the overall
      -- multiplexer tree has its own select line delay. Theoretically,
      -- only one delay is needed for each level of the overall tree,
      -- but has not been implemented as of now. It may (or may not)
      -- be useful to reduce the fanout of the select delay output by
      -- having specialized delays for each output mux, like it is
      -- done below.

      U_SEL_DELAY : entity arc_std.delay
      generic map (
        data_type => output_mux_sel_type,
        num_cycles => get_latency(num_subtree_inputs(0), radix))
      port map (
        clk => clk,
        input => sel(sel_width-1 downto sel_width-output_mux_sel_width),
        output => output_mux_sel);


      -- Multiplexer to select from each the subtree outputs
      -- and to define the output of the current tree.
      U_MUX : entity arc_std.multiplexer
        generic map (
          data_type => data_type,
          num_inputs => num_subtrees,
          use_pipelining => true,
          radix => radix)
        port map (
          clk => clk,
          rst => rst,
          input => subtree_output_aligned,
          sel => output_mux_sel,
          output => output);

      
    end generate U_RECURSION;

    
    U_VALID_DELAY_COND : if (use_valid = true) generate
      
      -- Valid signal delay.
      U_VALID_DELAY : entity arc_std.delay
        generic map (
          num_cycles => num_levels,
          use_valid => true)
        port map (
          clk => clk,
          rst => rst,
          valid_in => valid_in,
          valid_out => valid_out);

    end generate U_VALID_DELAY_COND;
    

  end generate U_MUX_GEN;

  
end architecture BHV;
