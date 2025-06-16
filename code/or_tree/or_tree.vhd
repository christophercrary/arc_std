-- ****************************************************************************
-- or_tree.vhd --
--
--     Generic or tree. Code is derived from `multiplexer`.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--     Caleb Bean (caleb.bean@ufl.edu)
--     Benjamin Hicks (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Benjamin Hicks
--
-- Last Modified On:
--     August 29, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package or_tree_pkg is

  -- Return latency for a pipelined (`radix` x 1) or tree
  -- with `num_inputs` inputs.
  function get_latency(
    num_inputs : positive; radix : positive) return natural;
  
  -- Return the or of every element in `input`
  function get_or(
    input : tuple_t) return std_logic_vector;
  
end package;

package body or_tree_pkg is

  function get_latency(
    num_inputs : positive; radix : positive) return natural is

    constant depth : positive := clog_pos(num_inputs, radix);
    
  begin

    -- In the case of pipelining, there is a register placed at
    -- every level of the relevant or tree; hence, the
    -- latency in this case is `depth`.
    return depth;

  end function;

  function get_or(
    input : tuple_t) return std_logic_vector is

    variable or_result :
      std_logic_vector(input(0)'range) := (others => '0');

  begin

    for i in 0 to input'right loop
        or_result := or_result or input(i);
    end loop;

    return or_result;
    
  end function;


end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.or_tree_pkg;
use arc_std.or_tree_pkg.all;

entity or_tree is
  generic (
    data_type : type_t;
    num_inputs : positive;
    use_pipelining : boolean := false;

    -- The following two generics are only applicable if
    -- `use_pipelining` is true.
    radix : positive := 2;
    use_valid : boolean := false;

    data_width : positive := get_width(data_type));
  
  port (
    clk : in std_logic := '0';
    rst : in std_logic := '0';
    
    input : in tuple_t(0 to num_inputs-1)(data_width-1 downto 0);
    valid_in : in std_logic := '0';
    output : out std_logic_vector(data_width-1 downto 0);
    valid_out : out std_logic := '-');
  
end entity;

architecture BHV of or_tree is

  -- Note that all of the following functions, constants, and signals are
  -- only pertinent when the Boolean generic `use_pipelining` is true.

-------------------------------------------------------------------------------
  -- Number of levels for a (`radix` x 1) or tree.
  -- This is used to delay the `valid_in` signal, if needed.
  constant num_levels : natural := arc_std.math_pkg.clog(num_inputs, radix);
  
  -- All of the following constants are only relevant when num_inputs > radix.
  constant depth : positive := clog_pos(num_inputs, radix);
  constant full_subtree_num_inputs : positive := radix**(depth-1);

  -- Number of subtrees for a (`radix` x 1) or tree.
  constant num_subtrees : positive := positive(ceil(real(num_inputs)
    /real(full_subtree_num_inputs)));
  constant last_subtree_num_inputs : positive := num_inputs
    -(num_subtrees-1)*full_subtree_num_inputs;

-------------------------------------------------------------------------------
  
  -- The outputs of each of the `num_subtrees` or trees.
  signal subtree_output, subtree_output_aligned : tuple_t(
    0 to num_subtrees-1)(data_width-1 downto 0) := (
      others => (others => '0'));
  
begin

  U_OR_TREE_GEN : if (use_pipelining = false) generate

    -- No pipelining.
    output <= or_tree_pkg.get_or(input);
    valid_out <= valid_in;

  else generate

    -- Recursively generate a (`radix` x 1) or tree,
    -- placing registers between each level.

    U_RECURSION : if (num_inputs <= radix) generate

      -- Base case. Produce the output of the current or tree
      -- by feeding the current input directly into a (`radix` x 1)
      -- or tree, followed by a register.

      U_OR_TREE : entity arc_std.or_tree
        generic map (
          data_type => data_type,
          num_inputs => num_inputs,
          use_pipelining => false)
        port map (
          input => input,
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
      -- or subtrees, and then use a (`radix` x 1)
      -- or tree to or the `num_subtrees` outputs.

      -- Generate the full subtrees.
      U_MUX_FULL_SUBTREE_GEN : for i in 0 to num_subtrees-2 generate

        U_OR_TREE : entity arc_std.or_tree
          generic map (
            data_type => data_type,
            num_inputs => full_subtree_num_inputs,
            use_pipelining => true,
            radix => radix)
          port map (
            clk => clk,
            rst => rst,
            input => input(full_subtree_num_inputs*i to
              full_subtree_num_inputs*(i+1)-1),
            output => subtree_output(i));
                          
      end generate U_MUX_FULL_SUBTREE_GEN;
      
      -- Generate the last subtree.
      U_LAST_MUX : entity arc_std.or_tree
        generic map (
          data_type => data_type,
          num_inputs => last_subtree_num_inputs,
          use_pipelining => true,
          radix => radix)
        port map (
          clk => clk,
          rst => rst,
          input => input(full_subtree_num_inputs*(num_subtrees-1) to
            full_subtree_num_inputs*(num_subtrees-1)+last_subtree_num_inputs-1),
          output => subtree_output(num_subtrees-1));

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
            get_latency(full_subtree_num_inputs, radix) -
            get_latency(last_subtree_num_inputs , radix)))
        port map (
          clk => clk,
          input => subtree_output(num_subtrees-1),
          output => subtree_output_aligned(num_subtrees-1));

      -- Or tree to get the or of each the subtree outputs
      -- and to define the output of the current tree.
      U_OR_TREE : entity arc_std.or_tree
        generic map (
          data_type => data_type,
          num_inputs => num_subtrees,
          use_pipelining => true,
          radix => radix)
        port map (
          clk => clk,
          rst => rst,
          input => subtree_output_aligned,
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
    

  end generate U_OR_TREE_GEN;

  
end architecture BHV;
