-- ****************************************************************************
-- demultiplexer.vhd --
--
--     Generic demultiplexer. Code derived from arc_std/multiplexer
--
-- Author(s):
--     Christopher Crary  (ccrary@ufl.edu)
--     Caleb Bean         (caleb.bean@ufl.edu)
--     Benjamin Hicks     (benjamin.hicks@ufl.edu)
--
-- Last Modified By:
--     Caleb Bean
--
-- Last Modified On:
--     August 25, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package demultiplexer_pkg is

  -- Return latency for a pipelined (`radix` x 1) multiplexer tree
  -- with `num_outputs` outputs.
  function get_latency(
    num_outputs : positive; radix : positive) return natural;


  -- FIX THIS COMMENT
  -- Return the element of `output` whose index is the integer representation
  -- of `sel`, if this integer is within the index range of `inputs`;
  -- otherwise, return a `std_logic_vector` whose value is zero and whose
  -- width is the same as all elements of `input`.
  function sel(
    input : std_logic_vector; sel : std_logic_vector; num_outputs : positive) return tuple_t;

  
end package;

package body demultiplexer_pkg is

  function get_latency(
    num_outputs : positive; radix : positive) return natural is

    constant depth : positive := clog_pos(num_outputs, radix);
    
  begin

    -- In the case of pipelining, there is a register placed at
    -- every level of the relevant multiplexer tree; hence, the
    -- latency in this case is `depth`.
    return depth;

  end function;

  
  function sel( -- NEED to work on this function first
    input : std_logic_vector;
    sel : std_logic_vector;
    num_outputs : positive) return tuple_t is

    -- Create an array to map all possible select values,
    -- where any value outside the range of `input` is set to '0'.
    variable demultiplexer_out :
      tuple_t(0 to 2**(sel'length)-1)(input'range) :=
      (others => (others => '0'));

  begin

    demultiplexer_out(to_integer(unsigned(sel))) := input;
    return demultiplexer_out(0 to num_outputs-1);
    
  end function;

  
end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.demultiplexer_pkg;
use arc_std.demultiplexer_pkg.all;

entity demultiplexer is -- Modify the generics once demux verified through testbench
  generic (
    data_type : type_t := uint8_t;
    num_outputs : positive := 9;
    use_pipelining : boolean := false;

    -- The following two generics are only applicable if
    -- `use_pipelining` is true.
    radix : positive := 2;
    use_valid : boolean := false;

    data_width : positive := get_width(data_type);
    sel_width : positive := get_num_bits_for_amount(num_outputs));
  
  port (
    clk : in std_logic := '0';
    rst : in std_logic := '0';
    
    input : in std_logic_vector(data_width-1 downto 0);
    sel : in std_logic_vector(sel_width-1 downto 0) := (others => '0');
    valid_in : in std_logic := '1';
    output : out tuple_t(0 to num_outputs-1)(data_width-1 downto 0);
    valid_out : out std_logic := '-');
  
end entity;

architecture BHV of demultiplexer is

  -- Note that all of the following functions, constants, and signals are
  -- only pertinent when the Boolean generic `use_pipelining` is true.

-------------------------------------------------------------------------------
  -- Number of levels for a (1 x 'radix') demultiplexer tree.
  -- This is used to delay the `valid_in` signal, if needed.
  constant num_levels : natural := arc_std.math_pkg.clog(num_outputs, radix);
  
  -- All of the following constants are only relevant when num_outputs > radix.
  constant depth : positive := clog_pos(num_outputs, radix);
  constant full_subtree_num_outputs : positive := radix**(depth-1);

  -- Number of subtrees for a (1 x `radix`) demultiplexer tree.
  constant num_subtrees : positive := positive(ceil(real(num_outputs)
    /real(full_subtree_num_outputs)));
  constant last_subtree_num_outputs : positive := num_outputs
    -(num_subtrees-1)*full_subtree_num_outputs;

  -- Number of bits needed for the select lines of each subtree.
  constant full_subtree_sel_width : positive := get_num_bits_for_amount(
    full_subtree_num_outputs);
  constant last_subtree_sel_width : positive := get_num_bits_for_amount(
    last_subtree_num_outputs);

  -- Number of bits needed for the output demultiplexer of the current tree.
  constant output_demux_sel_width : positive :=
    get_num_bits_for_amount(num_subtrees);

  constant output_demux_sel_type : type_t :=
    uint_type(sel_width);

-------------------------------------------------------------------------------
  
  -- The inputs of each of the `num_subtrees` demultiplexer trees.
  signal subtree_input : tuple_t(
    0 to num_subtrees-1)(data_width-1 downto 0) := (
      others => (others => '0'));
  
  -- The unaligned outputs of each of the `num_subtrees` demultiplexer trees.
  signal subtree_output : tuple_t(
    0 to num_outputs-1)(data_width-1 downto 0);

  -- Select lines for the output demultiplexer of the current tree. 
  signal output_demux_sel : std_logic_vector(
    sel_width-1 downto 0) := (others => '0');

  
begin

  U_DEMUX_GEN : if (use_pipelining = false) generate

    -- No pipelining.
    output <= demultiplexer_pkg.sel(input, sel, num_outputs);
    valid_out <= valid_in;

  else generate

    -- Recursively generate a (`radix` x 1) multiplexer tree,
    -- placing registers between each level.

    U_RECURSION : if (num_outputs <= radix) generate

      -- Base case. Produce the output of the current demultiplexer tree
      -- by feeding the current input directly into a (`radix` x 1)
      -- demultiplexer, followed by a register.

      U_DEMUX : entity arc_std.demultiplexer
        generic map (
          data_type => data_type,
          num_outputs => num_outputs,
          use_pipelining => false)
        port map (
          input => input,
          sel => sel,
          output => subtree_output);
      
      U_DEMUX_REG_GEN : for i in 0 to num_outputs-1 generate
        U_REG : entity arc_std.reg
          generic map (data_type => data_type)
          port map (
            clk => clk,
            rst => rst,
            input => subtree_output(i),
            output => output(i));
        end generate;


    else generate

      -- Recursive case. Generate `num_subtrees` (`radix` x 1)
      -- multiplexer subtrees, and then use a (`radix` x 1)
      -- multiplexer to select from the `num_subtrees` outputs.

      -- Generate the full subtrees.
      U_DEMUX_FULL_SUBTREE_GEN : for i in 0 to num_subtrees-2 generate

        U_DEMUX : entity arc_std.demultiplexer
          generic map (
            data_type => data_type,
            num_outputs => full_subtree_num_outputs,
            use_pipelining => true,
            radix => radix)
          port map (
            clk => clk,
            rst => rst,
            input => subtree_input(i),
            sel => output_demux_sel(full_subtree_sel_width-1 downto 0),
            output => subtree_output(full_subtree_num_outputs*i to
            full_subtree_num_outputs*(i+1)-1));
                          
      end generate U_DEMUX_FULL_SUBTREE_GEN;
      
      -- Generate the first subtree.
      U_FIRST_DEMUX : entity arc_std.demultiplexer
        generic map (
          data_type => data_type,
          num_outputs => last_subtree_num_outputs,
          use_pipelining => true,
          radix => radix)
        port map (
          clk => clk,
          rst => rst,
          input => subtree_input(num_subtrees-1),
          sel => output_demux_sel(last_subtree_sel_width-1 downto 0),
          output => subtree_output(full_subtree_num_outputs*(num_subtrees-1) to
          full_subtree_num_outputs*(num_subtrees-1)+last_subtree_num_outputs-1));

      -- Note that, when in this recursive case, it is guaranteed that there
      -- exists more than one subtree. When there exists more than one subtree,
      -- it is possible for the final subtree to have a lesser latency
      -- than that of the other subtree(s); thus, the output of this final
      -- subtree must be aligned with the other(s), if this occurs. (Note
      -- that the latency of the final subtree cannot be greater than that
      -- of the other subtrees.)

      -- The first `num_subtrees-1` trees are guaranteed to be aligned.
      output(0 to full_subtree_num_outputs*(num_subtrees-1)-1) <=
        subtree_output(0 to full_subtree_num_outputs*(num_subtrees-1)-1);

      U_FINAL_SUBSTREE_OUTPUT_DELAY_GEN : for i in 0 to last_subtree_num_outputs-1 generate
        U_FINAL_SUBTREE_OUTPUT_DELAY : entity arc_std.delay
          generic map (
            data_type => data_type,
            num_cycles => (
              get_latency(full_subtree_num_outputs, radix) -
              get_latency(last_subtree_num_outputs , radix)))
          port map (
            clk => clk,
            input => subtree_output(full_subtree_num_outputs*(num_subtrees-1)+i),
            output => output(full_subtree_num_outputs*(num_subtrees-1)+i));
        end generate;


      -- Delay the select lines relevant to the output multiplexer
      -- of the current tree by a number of cycles equivalent to
      -- that of the latency of the aligned subtrees.
      --
      -- Note that the most-significant `subtree_sel_width` bits of
      -- `sel` define the least-significant `subtree_sel_width` bits
      -- of `output_demux_select`; all other bits of `output_demux_select`,
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
        data_type => output_demux_sel_type,
        num_cycles => get_latency(num_subtrees, radix))
      port map (
        clk => clk,
        input => sel,
        output => output_demux_sel);


      -- Multiplexer to select from each the subtree outputs
      -- and to define the output of the current tree.
      U_DEMUX : entity arc_std.demultiplexer
        generic map (
          data_type => data_type,
          num_outputs => num_subtrees,
          use_pipelining => true,
          radix => radix)
        port map (
          clk => clk,
          rst => rst,
          input => input,
          sel => sel(sel_width-1 downto sel_width-output_demux_sel_width),
          output => subtree_input);

      
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
    

  end generate U_DEMUX_GEN;

  
end architecture BHV;
