-- ****************************************************************************
-- fanout_tree.vhd --
--
--     Fanout tree.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     October 24, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package fanout_tree_pkg is
  function get_latency(
    fanout : positive; radix : positive; register_output : boolean) 
      return natural;
end package;

package body fanout_tree_pkg is

  function get_latency(
    fanout : positive; radix: positive; register_output : boolean) 
      return natural is
    constant depth : natural := clog_pos(fanout, radix) - 1;
    variable latency : natural;
  begin
    if register_output then
      latency := depth + 1;
    else
      latency := depth;
    end if;
    return latency;
  end function;

end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.fanout_tree_pkg.all;
  
entity fanout_tree is
  generic (
    data_type : type_t;
    fanout : positive := 1;
    radix : positive := 2;
    register_output : boolean := false;
    use_valid : boolean := false;
    data_width : positive := get_width(data_type));
  port (
    clk : in std_logic;
    rst : in std_logic := '-';
    
    input : in std_logic_vector(data_width-1 downto 0);
    valid_in : in std_logic := '-';
    output : out tuple_t(0 to fanout-1)(data_width-1 downto 0);
    valid_out : out std_logic);
end entity;


architecture MIX of fanout_tree is

  constant depth : natural := clog_pos(fanout, radix) - 1;
  constant fanout_full_subtree : positive := radix ** depth;
  constant num_subtrees : positive := positive(
    ceil(real(fanout) / real(fanout_full_subtree)));
  constant fanout_last_subtree : positive := (
    fanout - (num_subtrees - 1) * fanout_full_subtree);
  
-------------------------------------------------------------------------------

  signal input_subtree : tuple_t(0 to num_subtrees-1)(
    data_width-1 downto 0) := (others => (others => '0'));

  signal output_last_subtree: tuple_t(
    0 to fanout_last_subtree-1)(data_width-1 downto 0) := (
      others => (others => '0'));

begin -- MIX
  
  -- Via recursion, build a fanout tree with `fanout` outputs.

  U_RECURSION : if (fanout <= radix) generate

    -- Base case.

    U_OUTPUT_GEN : for i in 0 to fanout-1 generate
      U_REGISTER_OUTPUT_COND : if register_output generate
        U_OUTPUT_REG : entity arc_std.reg
        generic map (data_type => data_type)
        port map (
          clk => clk,  
          input => input,
          output => output(i));
      else generate
        output(i) <= input;
      end generate;
    end generate;
    
  else generate
    
    -- Recursive case.
    --    
    -- Split the current adder subtree into `num_subtrees` 
    -- smaller fanout subtrees.
    -- 
    -- Note that, when in the recursive case, it is guaranteed that
    -- there exists more than one subtree. When there exists more 
    -- than one subtree, it is possible for the last subtree to have 
    -- a lesser latency than that of the other subtree(s); thus, the 
    -- output of this last subtree must be aligned with the other(s), 
    -- if this occurs. (Note that the latency of the last subtree 
    -- cannot be greater than that of the other subtrees.)

    U_SUBTREE_GEN : for i in 0 to num_subtrees-1 generate

      U_SUBTREE_INPUT_REG : entity arc_std.reg
      generic map (data_type => data_type)
      port map (
        clk => clk,  
        input => input,
        output => input_subtree(i));

      U_FULL_SUBTREE_COND : if i < num_subtrees-1 generate

        -- Generate a full subtree.
        U_FULL_SUBTREE : entity arc_std.fanout_tree
          generic map (
            data_type => data_type,
            fanout => fanout_full_subtree,
            radix => radix,
            register_output => register_output)
          port map (
            clk => clk,
            input => input_subtree(i),
            output => output(
              (i) * fanout_full_subtree to (i+1) * fanout_full_subtree - 1));
                          
      else generate
      
        -- Generate the last subtree.
        U_LAST_SUBTREE : entity arc_std.fanout_tree
          generic map (
            data_type => data_type,
            fanout => fanout_last_subtree,
            radix => radix,
            register_output => register_output)
          port map (
            clk => clk,
            input => input_subtree(i),
            output => output_last_subtree);

      end generate;

    end generate;

    U_LAST_SUBTREE_OUTPUT_DELAY_GEN : 
      for i in 0 to fanout_last_subtree-1 generate

      U_LAST_SUBTREE_OUTPUT_DELAY : entity arc_std.delay
        generic map (
          data_type => data_type,
          num_cycles => (
            get_latency(fanout_full_subtree, radix, register_output) -
            get_latency(fanout_last_subtree , radix, register_output)))
        port map (
          clk => clk,
          input => output_last_subtree(i),
          output => output((num_subtrees - 1) * fanout_full_subtree + i));

    end generate;
    
  end generate U_RECURSION;


  U_VALID_DELAY_COND : if (use_valid = true) generate
    
    U_VALID_DELAY : entity arc_std.delay
      generic map (
        use_valid => true,
        num_cycles => get_latency(fanout, radix, register_output))
      port map (
        clk => clk,
        rst => rst,
        valid_in => valid_in,
        valid_out => valid_out);

  end generate U_VALID_DELAY_COND;

  
end architecture MIX;
