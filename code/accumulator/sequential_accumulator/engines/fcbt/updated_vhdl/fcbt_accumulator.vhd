-- ****************************************************************************
-- fcbt_accumulator.vhd
-- 
--     The fcbt entity implements the fully compacted binary tree design similar
--     to the architecture described in the paper "High-Performance Reduction 
--     Circuits Using Deeply Pipelined Operators on FPGAs" by 
--     Ling Zhuo, G.R. Morris and V.K. Prasanna (2007)
-- 
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu),
--     Caleb Bean (caleb.bean@ufl.edu),
--     Benjamin Hicks (benjamin.hicks@ufl.edu)
--     Jared Herbert (jaredherbert@ufl.edu)
--     Ryan Laur (ryan.laur@ufl.edu)
--
-- Last Modified By:
--     Ryan Laur
--
--
-- Last Modified On:
--     November 4, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;
use arc_std.adder_pkg;

package fcbt_accumulator_pkg is

    function get_latency(
        input_type : type_t; max_inputs : positive) return natural;

end package;


package body fcbt_accumulator_pkg is

    function get_latency(
        input_type : type_t; max_inputs : positive) return natural is
        
        variable num_levels : positive := clog2(max_inputs);
        
        variable latency : natural := 0;

    begin
        -- This is the upper bound on the maximum latency of the FCBT.
        -- The proof of the upper bound is from the paper.
        if (max_inputs > 1) then
            latency := 3*max_inputs
                +(adder_pkg.get_latency(input_type)-1)*num_levels;
        end if;

        return latency;

    end function;

end package body;

library arc_std;
context arc_std.std_context;

-------------------------------------------------------------------------------
-- Generics Description
-- width             : The width of the input and output in bits
-- add_core_name     : A string representing different optimizations for the
--                     actual adder core. See add_flt.vhd and flt_pkg.vhd for
--                     more information.
-- FCBT_max_inputs   : This positive indicates the maximum amount of inputs
--                     per input group. Buffer size scales with the log of
--                     of this generic.
-- FCBT_obuf_size    : Specifies the size of the output buffer for the
--                     FCBT architecture. 
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Port Description:
-- clk          : clock input
-- rst          : reset input (asynchronous, active high)
-- ready        : when asserted, the fcbt is ready to accept new inputs. If not
--                asserted, external components must hold the current input or
--                it will be lost (active high)
-- end_of_group : should be asserted on the same cycle as the last input in a
--                group (active high)
-- input        : fcbt input
-- output       : fcbt output
-- valid_in     : assert when the input to the fcbt is valid and ready is
--                asserted (active high)
-- valid_out    : asserted when the output from the fcbt is valid.
--                valid_out is only asserted for one cycle. (active high)
-------------------------------------------------------------------------------

entity fcbt_accumulator is
    generic (
        data_type       : type_t;
        width           : positive := get_width(data_type);
        add_core_name   : string   := "speed";
        FCBT_max_inputs : positive := 128;
        FCBT_obuf_size  : positive := 14;
        mux_radix       : positive := 4
        );
    port (
        clk          : in  std_logic;
        rst          : in  std_logic;
        ready        : out std_logic;   -- '1' when fcbt can accept input
        end_of_group : in  std_logic;   -- specifies last input in group
        input     : in  std_logic_vector(width-1 downto 0);
        output    : out std_logic_vector(width-1 downto 0);
        valid_in  : in  std_logic;
        valid_out : out std_logic
        );
end fcbt_accumulator;

architecture STR of fcbt_accumulator is

    -- The minimum max_inputs for the fcbt is 5.
    function set_max_inputs return positive is
    begin
        if FCBT_max_inputs < 5 then
            return 5;
        else
            return FCBT_max_inputs;
        end if;
    end function set_max_inputs;

    -- The minimum obuf_size for the fcbt is 4.
    function set_obuf_size return positive is
	begin
		if FCBT_obuf_size < 4 then
			return 4;
		else
			return FCBT_obuf_size;
		end if;
	end function set_obuf_size;

    constant ADD_LATENCY      : natural  := 3; 
    constant BUFFER_DEPTH     : integer  := 3;
    constant MAX_INPUTS       : positive := set_max_inputs;
    constant TREE_LEVELS      : integer := clog2(MAX_INPUTS);
    constant TREE_LEVELS_BITS : integer := clog2(TREE_LEVELS+1);
    constant MAX_GROUP        : integer := set_obuf_size;
    constant MAX_GROUP_BITS   : integer := clog2(MAX_GROUP);
    constant TAGGING_BITS     : integer := MAX_GROUP_BITS+2;
    constant MAX_CTRL_COUNT   : unsigned(TREE_LEVELS-2 downto 0) := (others => '1');

    -- Tag the input groups so that the circular output
    -- buffer can resolve the correct output order.
    signal start_of_group : std_logic;
    signal group_num      : std_logic_vector(MAX_GROUP_BITS-1 downto 0);

    signal add_in1                : tuple_t(1 downto 0)(width-1 downto 0);
    signal add_in2                : tuple_t(1 downto 0)(width-1 downto 0);
    signal add_out                : tuple_t(1 downto 0)(width-1 downto 0);
    signal add_valid_in           : std_logic_vector(1 downto 0);
    signal add_valid_out          : std_logic_vector(1 downto 0);

    -- The tagging signals must be retained as the data propagates
    -- through the adders.
    signal add_group_tags_in      : tuple_t(1 downto 0)(TAGGING_BITS-1 downto 0);
    signal add_group_tags_out     : tuple_t(1 downto 0)(TAGGING_BITS-1 downto 0);
    signal add_group_num_in       : tuple_t(1 downto 0)(MAX_GROUP_BITS-1 downto 0);
    signal add_group_num_out      : tuple_t(1 downto 0)(MAX_GROUP_BITS-1 downto 0);
    signal add_end_of_group_in    : std_logic_vector(1 downto 0);
    signal add_end_of_group_out   : std_logic_vector(1 downto 0);
    signal add_start_of_group_in  : std_logic_vector(1 downto 0);
    signal add_start_of_group_out : std_logic_vector(1 downto 0);
    signal add_last_element       : std_logic_vector(1 downto 0);

    -- Every level of the tree requires a buffer
    signal buf_regs_0 : tuple_t (0 to 1)
        (width+TAGGING_BITS-1 downto 0);
    signal buf_regs   : tuple_array(1 to TREE_LEVELS-1)(0 to BUFFER_DEPTH-1)
        (width+TAGGING_BITS-1 downto 0);
    signal buf_wr_en  : std_logic_vector(TREE_LEVELS-1 downto 0);
    signal level_en, level_en_r : std_logic_vector(TREE_LEVELS-2 downto 0);
    signal buf_count  : tuple_t(0 to TREE_LEVELS-1)(clog2(BUFFER_DEPTH+1)-1 downto 0);
    signal buf_rd_en1, buf_rd_en2 : std_logic_vector(0 to TREE_LEVELS-1);

    signal buf_regs_add_in, buf_regs_add_in_masked, buf_regs_add_in_masked_r : tuple_array(0 to 1)
        (0 to TREE_LEVELS-2)
        (width-1 downto 0);

    signal buf_regs_tags_in, buf_regs_tags_in_masked, buf_regs_tags_in_masked_r : tuple_t(0 to TREE_LEVELS-2)
        (TAGGING_BITS-1 downto 0);
    
    signal buf_regs_valid : std_logic;

    signal adder2_mux_sel : std_logic_vector(
        clog2(TREE_LEVELS-1)-1 downto 0);
    signal adder2_inputs : tuple_t(0 to 1)(width-1 downto 0);
    signal adder2_tags : std_logic_vector(TAGGING_BITS-1 downto 0);

    constant tags_t : type_t := uint_type(TAGGING_BITS); 

    -- The output buffer allows up to MAX_GROUP-1 groups to propagate through
    -- the FCBT at any moment.
    signal obuf_valid_decode : std_logic_vector(1 downto 0);
    signal obuf_wr_en    : tuple_t(0 to 1)(MAX_GROUP-1 downto 0);
    signal add_out_delayed        : tuple_t(1 downto 0)(width-1 downto 0);
    signal obuf_out      : tuple_t(0 to MAX_GROUP-1)(width-1 downto 0);
    signal obuf_out_masked, obuf_out_masked_r : tuple_t(0 to MAX_GROUP-1)(width-1 downto 0);
    signal obuf_valid_out    : std_logic_vector(MAX_GROUP-1 downto 0);
    signal obuf_mask : std_logic_vector(MAX_GROUP-1 downto 0);
    signal obuf_valid_out_masked, obuf_valid_out_masked_r : std_logic_vector(MAX_GROUP-1 downto 0);
    signal obuf_valid_out_masked_tuple : tuple_t(0 to MAX_GROUP-1)(0 downto 0);
    -- signal obuf_valid_out_int : std_logic;
    signal output_ptn    : unsigned(MAX_GROUP_BITS-1 downto 0);
    
    signal ctrl_en : std_logic;
    signal ctrl_count : unsigned(TREE_LEVELS-2 downto 0);

    constant wr_buf_sel_t  : type_t := uint_type(clog2(TREE_LEVELS-2));
    constant WR_BUF_SEL_WIDTH : positive := get_width(wr_buf_sel_t);
    signal wr_buf_sel_in : std_logic_vector(WR_BUF_SEL_WIDTH-1 downto 0);
    signal wr_buf_sel_out : std_logic_vector(WR_BUF_SEL_WIDTH-1 downto 0);

    signal valid_decode : std_logic;
    signal adder2_out, adder2_out_delayed : std_logic_vector(width+TAGGING_BITS-1 downto 0);
    constant buf_regs_t : type_t := uint_type(width+TAGGING_BITS);
    
begin
    -- the FCBT deasserts ready when fcbt holds the max number of groups
    ctrl_en   <= '1';

---------------------------------------------------------------
-- Input Tagging

    -- Assign group number for incoming inputs. Group numbers will correspond to index in
    -- output buffer and will ensure in-order outputs from the buffer.
    process(clk, rst)
    begin
        if (rst = '1') then
            group_num <= std_logic_vector(to_unsigned(0, MAX_GROUP_BITS));
            
        elsif (rising_edge(clk)) then
			if (ready = '1') then
                -- use next group number after receiving the current group's last element
                if (valid_in = '1' and end_of_group = '1') then
                    if (to_integer(unsigned(group_num)) = MAX_GROUP-1) then
                        group_num <= std_logic_vector(to_unsigned(0, MAX_GROUP_BITS));
                    else
                        group_num <= std_logic_vector(unsigned(group_num)+1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if (rst = '1') then
            ready <= '1';
        elsif (rising_edge(clk)) then
            if (ready = '1' and output_ptn = to_unsigned(to_integer(unsigned(group_num)+2) mod MAX_GROUP, MAX_GROUP_BITS)) then
                ready <= '0';
            elsif (ready = '0' and output_ptn = to_unsigned(to_integer(unsigned(group_num)+3) mod MAX_GROUP, MAX_GROUP_BITS)) then
                ready <= '1';
            end if;
        end if;
    end process;

    -- Keep track of which input is the first element of a group. This will be the first
    -- received element or the next valid element following the last element of a
    -- previous group.
    process(clk, rst)
    begin
        if (rst = '1') then
            -- First received element will be the start of the first group
            start_of_group <= '1';
            
        elsif (rising_edge(clk)) then
			if (ready = '1') then
                -- The element following the end of one group will be the start of the 
                -- next group
                if (end_of_group = '1' and valid_in = '1') then
                    start_of_group <= '1';

                -- Any other element is not the start of the next group
                elsif (valid_in = '1') then
                    start_of_group <= '0';
                end if;
            end if;
        end if;
    end process;

---------------------------------------------------------------
-- BUF

    process(clk, rst) 

        -- Temporary buffer count.
        variable temp_buf_count : tuple_t(0 to TREE_LEVELS-1)(clog2(BUFFER_DEPTH+1)-1 downto 0);

    begin
        if (rst = '1') then

            for i in 0 to TREE_LEVELS-1 loop
                buf_count(i) <= (others => '0'); 
            end loop;

        elsif (rising_edge(clk)) then

            for i in 0 to TREE_LEVELS-1 loop

                if (buf_wr_en(i) = '1') then
                    -- Write new element to buffer `i`.

                    -- Determine from where the new element originates,
                    -- and update the first register in the buffer
                    -- accordingly.
                    if (i = 0) then
                        -- Element originates directly from input.
                        buf_regs_0(0) <= group_num & start_of_group & end_of_group & input;
                        -- Shift all other elements in the buffer.
                        buf_regs_0(1) <= buf_regs_0(0);
                    elsif (i = 1) then
                        -- Element originates from the first adder.
                        buf_regs(1)(0) <= add_group_num_out(0) & add_start_of_group_out(0) & add_end_of_group_out(0) & add_out(0);
                    else
                        -- Element originates from the second adder.
                        buf_regs(i)(0) <= adder2_out_delayed;
                    end if;

                    -- `buf_regs_0` has already been shifted.
                    if (i /= 0) then
                        -- Shift all other elements in the buffer.
                        for j in 0 to BUFFER_DEPTH-2 loop
                            buf_regs(i)(j+1) <= buf_regs(i)(j);
                        end loop;
                    end if;

                end if;

                -- Update buffer count accordingly.
                temp_buf_count(i) := buf_count(i);

                if (buf_wr_en(i) = '1') then
                    temp_buf_count(i) := to_slv(unsigned(temp_buf_count(i)) + 1);
                end if;

                if (buf_rd_en1(i) = '1') then
                    temp_buf_count(i) := to_slv(unsigned(temp_buf_count(i)) - 1);
                elsif (buf_rd_en2(i) = '1') then
                    temp_buf_count(i) := to_slv(unsigned(temp_buf_count(i)) - 2);
                end if;

                buf_count(i) <= temp_buf_count(i);

            end loop;
        end if;
    end process;

    buf_wr_en(0)  <= '1' when valid_in = '1' and ready = '1' else 
                '0';
    buf_wr_en(1)  <= '1' when add_valid_out(0) = '1' and add_last_element(0) = '0' else
                '0';

    -- Generate buf_wr_en using pipelined decoder tree           
    U_WR_EN_DECODER : entity arc_std.decoder
        generic map(
            num_outputs => TREE_LEVELS-2,
            use_pipelining => true,
            radix => mux_radix)
        port map(
            clk => clk,
            rst => rst,

            input => wr_buf_sel_out,
            valid_in => valid_decode,
            output => buf_wr_en(TREE_LEVELS-1 downto 2)
        );

    valid_decode <= add_valid_out(1) and not add_last_element(1);

    -- Delay adder2_out by the decoder latency
    U_DELAY_ADDER2_OUT : entity arc_std.delay
        generic map (
            data_type => buf_regs_t,
            num_cycles => arc_std.decoder_pkg.get_latency(
                TREE_LEVELS-2, mux_radix))
        port map (
            clk => clk,
            input => adder2_out,
            output => adder2_out_delayed
            );

    adder2_out <= add_group_num_out(1) & add_start_of_group_out(1) & add_end_of_group_out(1) & add_out(1);

    -- This process schedules adds to the first adder,
    -- which only reads from buf_reg(0), level 0 of the tree
    process(ctrl_count, buf_count, buf_regs, buf_regs_0)
    begin
        -- default values
        buf_rd_en1            <= (others => '0');
        buf_rd_en2            <= (others => '0');
        add_valid_in(0)       <= '0';
        buf_regs_valid    <= '0';
        add_end_of_group_in(0) <= '0';
        add_start_of_group_in(0) <= '0';

        -- Select from buf_regs_0(0) by default.
        add_in1(0) <= buf_regs_0(0)(width-1 downto 0);
        add_in2(0) <= buf_regs_0(0)(width-1 downto 0);
        add_group_num_in(0)      <= (others => '0');

        buf_regs_add_in <= (others => (others => (others => '0')));
        buf_regs_tags_in <= (others => (others => '0'));

        -- Perform singleton addition with 1st adder if the next element in 
        -- buffer 0 is the last element of a group
        if(buf_count(0) > std_logic_vector(to_unsigned(0, buf_count(0)'length)) and
            buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width) = '1') then
            
            buf_rd_en1(0)            <= '1';
            add_in1(0)               <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width-1 downto 0);
            add_in2(0)               <= (others => '0');
            add_valid_in(0)          <= '1';

            -- `start_of_group` and `end_of_group` only considers first element in singleton add.
            add_end_of_group_in(0)   <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width);
            add_start_of_group_in(0) <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width+1);
            add_group_num_in(0)      <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width+TAGGING_BITS-1 downto width+2);

        elsif(buf_count(0) > std_logic_vector(to_unsigned(1, buf_count(0)'length))) then
            
            buf_rd_en2(0)            <= '1';
            add_in1(0)               <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width-1 downto 0);
            add_in2(0)               <= buf_regs_0(to_integer(unsigned(buf_count(0))-2))(width-1 downto 0);
            add_valid_in(0)          <= '1';
            
            -- `end_of_group` is guaranteed to come from the "newer" element
            add_end_of_group_in(0)   <= buf_regs_0(to_integer(unsigned(buf_count(0))-2))(width);
            -- `start_of_group` is guaranteed to come from the "older" element
            add_start_of_group_in(0) <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width+1);
            add_group_num_in(0)      <= buf_regs_0(to_integer(unsigned(buf_count(0))-1))(width+TAGGING_BITS-1 downto width+2);
        end if;

        for i in 1 to TREE_LEVELS-1 loop
            -- 2nd adder uses inputs from buffer i (i>=1) every 2^i cycles 
            if (level_en(i-1)) then

                -- Perform singleton addition if the next element in buffer i is the last 
                -- element of a group
                if(buf_count(i) > std_logic_vector(to_unsigned(0, buf_count(i)'length)) and
                    buf_regs(i)(to_integer(unsigned(buf_count(i))-1))(width) = '1') then
                    
                    buf_rd_en1(i)            <= '1';
                    buf_regs_add_in(0)(i-1)        <= buf_regs(i)(to_integer(unsigned(buf_count(i))-1))(width-1 downto 0);
                    buf_regs_valid <= '1';
                    buf_regs_tags_in(i-1) <= buf_regs(i)(to_integer(unsigned(buf_count(i))-1))(width+TAGGING_BITS-1 downto width);
                   
                elsif(buf_count(i) > std_logic_vector(to_unsigned(1, buf_count(0)'length))) then
                    buf_rd_en2(i)            <= '1';
                    buf_regs_add_in(0)(i-1)        <= buf_regs(i)(to_integer(unsigned(buf_count(i))-1))(width-1 downto 0);
                    buf_regs_add_in(1)(i-1)        <= buf_regs(i)(to_integer(unsigned(buf_count(i))-2))(width-1 downto 0);
                    buf_regs_valid <= '1';
                    buf_regs_tags_in(i-1) <= buf_regs(i)(to_integer(unsigned(buf_count(i))-1))(width+TAGGING_BITS-1 downto width);
                    -- `end_of_group` comes from newer element
                    buf_regs_tags_in(i-1)(0) <= buf_regs(i)(to_integer(unsigned(buf_count(i))-2))(width);
                end if;
            end if;
        end loop;
    end process;

    -- This process generates the output of the comparators that determine the
    -- schedule for adds into the second adder.
    process (clk, rst)
    begin
        if (rst = '1') then
            level_en <= (others => '0');
        elsif (rising_edge(clk)) then
            -- default value
            level_en <= (others => '0');
            -- generate comparators
            for i in 0 to TREE_LEVELS-2 loop
                if (ctrl_count(i downto 0) = to_unsigned(2**(i)-1,i+1)) then
                    level_en(i) <= '1';
                end if;
            end loop;
        end if;
    end process;

    -- Delay `buf_regs_valid_delayed` by or tree + 1 latency 
    U_DELAY_VALID : entity arc_std.delay
        generic map (
            data_type => STD_LOGIC_T,
            num_cycles => arc_std.or_tree_pkg.get_latency(
                TREE_LEVELS-1, mux_radix) + 1)
        port map (
            clk => clk,
            rst => rst,
            input(0) => buf_regs_valid,
            output(0) => add_valid_in(1)
        );

    -- Bit-mask using 1-Hot level_en Signal
    process(level_en, buf_regs_add_in)
    begin
        for i in 0 to TREE_LEVELS-2 loop
            for j in 0 to width-1 loop
                buf_regs_add_in_masked(0)(i)(j) <= buf_regs_add_in(0)(i)(j) and level_en(i);
                buf_regs_add_in_masked(1)(i)(j) <= buf_regs_add_in(1)(i)(j) and level_en(i);
            end loop;
        end loop;
    end process;

    -- Register `buf_regs_add_in_masked` to break up combinational logic
    U_DELAY_BUF_REGS_ADD_IN_MASKED_GEN : for i in 0 to 1 generate

        U_LEVEL_GEN : for j in 0 to TREE_LEVELS-2 generate

            U_DELAY_BUF_REGS_ADD_IN_MASKED : entity arc_std.delay
                generic map (
                    data_type => data_type,
                    num_cycles => 1)
                port map (
                    clk => clk,
                    input => buf_regs_add_in_masked(i)(j),
                    output => buf_regs_add_in_masked_r(i)(j)
                );

        end generate;

    end generate;

    -- Bit-mask using 1-Hot level_en Signal
    process(level_en, buf_regs_tags_in)
    begin
        for i in 0 to TREE_LEVELS-2 loop
            for j in 0 to TAGGING_BITS-1 loop
                buf_regs_tags_in_masked(i)(j) <= buf_regs_tags_in(i)(j) and level_en(i);
            end loop;
        end loop;
    end process;

    -- Register `buf_regs_tags_in_masked` to break up combinational logic
    U_DELAY_BUF_REGS_TAGS_IN_MASKED_GEN : for i in 0 to TREE_LEVELS-2 generate

        U_DELAY_BUF_REGS_TAGS_IN_MASKED : entity arc_std.delay
            generic map (
                data_type => tags_t,
                num_cycles => 1)
            port map (
                clk => clk,
                input => buf_regs_tags_in_masked(i),
                output => buf_regs_tags_in_masked_r(i)
           );

    end generate;
    
    -- generate `adder2_inputs` using a pipelined or_tree
    U_ADDER_IN_OR_TREE_GEN : for i in 0 to 1 generate

        U_ADDER_IN_OR_TREE : entity arc_std.or_tree
            generic map (
                data_type => data_type,
                num_inputs => TREE_LEVELS-1,
                use_pipelining => true,
                radix => mux_radix)
            port map(
                clk => clk,
                rst => rst,
                input => buf_regs_add_in_masked_r(i),
                output => adder2_inputs(i)
            );

    end generate;

    -- generate `adder2_tags` using a pipelined or_tree
    U_ADDER2_TAGS_OR_TREE : entity arc_std.or_tree
        generic map(
            data_type => tags_t,
            num_inputs => TREE_LEVELS-1,
            use_pipelining => true,
            radix => mux_radix)
        port map(
            clk => clk,
            rst => rst,
            input => buf_regs_tags_in_masked_r,
            output => adder2_tags
        );
    
    add_in1(1) <= adder2_inputs(0);
    add_in2(1) <= adder2_inputs(1);
    
    add_end_of_group_in(1) <= adder2_tags(0);
    add_start_of_group_in(1) <= adder2_tags(1);
    add_group_num_in(1) <= adder2_tags(TAGGING_BITS-1 downto 2);
  
    U_ENCODER : entity arc_std.encoder
        generic map (
            num_inputs => TREE_LEVELS-1,
            radix => mux_radix)
        port map (
            clk => clk,
            rst => rst,
            input => level_en,
            output => adder2_mux_sel
        );

    U_DELAY_CTRL_BUF_SEL : entity arc_std.delay
        generic map (
            data_type => wr_buf_sel_t,
            num_cycles => arc_std.adder_pkg.get_latency(data_type) + 1)
        port map (
            clk => clk,
            rst => rst,
            input => wr_buf_sel_in,
            output => wr_buf_sel_out
        );
        wr_buf_sel_in <= adder2_mux_sel(wr_buf_sel_in'range);

---------------------------------------------------------------
-- Adders

    U_ADDERS : for i in 0 to 1 generate

        U_ADDER : entity arc_std.adder
            generic map(
                input1_type => data_type,
                input2_type => data_type,
                use_valid   => true
                )
            port map(
                clk       => clk,
                rst       => rst,
                input1    => add_in1(i),
                input2    => add_in2(i),
                output    => add_out(i),
                valid_in  => add_valid_in(i),
                valid_out => add_valid_out(i)
                );

        U_GROUP_TAGS : entity arc_std.delay_fcbt
            generic map(
                cycles => ADD_LATENCY,
                width  => TAGGING_BITS,
                init   => std_logic_vector(to_unsigned(0, TAGGING_BITS)))
            port map(
                clk    => clk,
                rst    => rst,
                en     => ctrl_en,
                input  => add_group_tags_in(i),
                output => add_group_tags_out(i)
                );

        -- Carry along tagging information while sum is in adder
        add_group_tags_in(i) <= add_group_num_in(i) &
                                add_end_of_group_in(i) &
                                add_start_of_group_in(i);

        -- Break up tagging signal into end_of_group flag, start_of_group flag, and group_num data
        add_end_of_group_out(i)   <= add_group_tags_out(i)(1);
        add_start_of_group_out(i) <= add_group_tags_out(i)(0);
        add_group_num_out(i)      <= add_group_tags_out(i)(TAGGING_BITS-1 downto 2);

        -- An adder output with both end_of_group and start_of_group bits asserted is 
        -- the last element in the group
        add_last_element(i) <= '1' when add_end_of_group_out(i) = '1' and add_start_of_group_out(i) = '1' else
                                '0';

    end generate;

---------------------------------------------------------------
-- OBUF

    -- Generate obuf_wr_en bits
    U_OBUF_WR_EN_GEN : for i in 0 to 1 generate
        
        U_WR_EN_DECODER : entity arc_std.decoder
            generic map(
                num_outputs => MAX_GROUP,
                use_pipelining => true,
                radix => mux_radix)
            port map(
                clk => clk,
                rst => rst,

                input => add_group_num_out(i),
                valid_in => obuf_valid_decode(i),
                output => obuf_wr_en(i)
            );
        obuf_valid_decode(i) <= add_valid_out(i) and add_last_element(i);
    
    end generate;

    -- Generate add_out_delayed fanout tree
    U_ADD_OUT_DELAYED_GEN : for i in 0 to 1 generate 

        U_ADD_OUT_DELAYED : entity arc_std.delay
            generic map (
                data_type => data_type,
                num_cycles => arc_std.decoder_pkg.get_latency(MAX_GROUP,mux_radix))
            port map (
                clk => clk,
                input => add_out(i),
                output => add_out_delayed(i));
    
    end generate;

    -- Create circular output buffer and generate valid logic.
    process(clk, rst)
    begin
        if (rst = '1') then
            for i in 0 to MAX_GROUP-1 loop
                obuf_out(i) <= (others => '0');
                obuf_valid_out(i) <= '0';
                obuf_mask(i) <= '0';
            end loop;
            -- First bit in obuf_mask is hot
            obuf_mask(0) <= '1';
            output_ptn    <= to_unsigned(0, output_ptn'length);
        elsif (rising_edge(clk)) then	
            
            for j in 0 to MAX_GROUP-1 loop
                for i in 0 to 1 loop
                    if (obuf_wr_en(i)(j)) then
                        obuf_out(j) <= add_out_delayed(i);
                        obuf_valid_out(j) <= '1';
                    end if;
                end loop;
            end loop;
            
            -- forwards data at output_ptn to the pipelined mux
            -- if the ready bit is asserted
            if (valid_out = '1') then

                -- output_ptn gets next possible index.
                if (to_integer(output_ptn) = MAX_GROUP-1) then
                    output_ptn <= to_unsigned(0, MAX_GROUP_BITS);
                else
                    output_ptn <= output_ptn+1;
                end if;
            end if;

            -- Synchronous reset of obuf_valid_out to clear the ready bit.
            for i in 0 to MAX_GROUP-1 loop
                if (obuf_valid_out_masked(i)) then
                    obuf_valid_out(i) <= '0';
                end if;
            end loop;
            
            -- When obuf_valid_out_masked(i) is asserted, shift the hot bit.
            -- To minimize the fanout from obuf_valid_out_masked(i), only enable
            -- obuf_mask(i) and obuf_mask(i+1)
            for i in 0 to MAX_GROUP-1 loop
                if (obuf_valid_out_masked(i)) then
                    obuf_mask(i) <= obuf_mask((i-1+MAX_GROUP) mod MAX_GROUP);
                    obuf_mask((i+1+MAX_GROUP) mod MAX_GROUP) <= obuf_mask(i);
                end if;
            end loop;
        end if;
    end process;

    obuf_valid_out_masked <= obuf_valid_out and obuf_mask;
    
    -- Generate obuf_out_masked by Bitmasking obuf_out
    process(obuf_mask, obuf_out)
    begin
        for i in 0 to MAX_GROUP-1 loop
            for j in 0 to width-1 loop
                obuf_out_masked(i)(j) <= obuf_out(i)(j) and obuf_mask(i);
            end loop;
        end loop;
    end process;
    
    -- generate `valid_out` using a pipelined or_tree
    U_VALID_OUT_OR_TREE : entity arc_std.or_tree
        generic map (
            data_type => STD_LOGIC_T,
            num_inputs => MAX_GROUP,
            use_pipelining => true,
            radix => mux_radix)
        port map (
            clk => clk,
            rst => rst,
            input => obuf_valid_out_masked_tuple,
            output(0) => valid_out);
    
    -- convert obuf_valid_out_masked to tuple for use in or_tree
    U_OBUF_VALID_OUT_MASKED_TUPLE_GEN : for i in 0 to MAX_GROUP-1 generate

        obuf_valid_out_masked_tuple(i)(0) <= obuf_valid_out_masked(i);

    end generate;

    -- generate `output` using a pipelined or_tree
    U_OBUF_OUT_OR_TREE : entity arc_std.or_tree
        generic map (
            data_type => data_type,
            num_inputs => MAX_GROUP,
            use_pipelining => true,
            radix => mux_radix)
        port map (
            clk => clk,
            rst => rst,
            input => obuf_out_masked,
            output => output);

---------------------------------------------------------------
-- Scheduling Counter

    -- Counter bits used for scheduling 2nd adder additions
    process(clk, rst)
    begin
        if (rst = '1') then
            ctrl_count <= (others => '0');
        elsif (rising_edge(clk)) then
            ctrl_count <= unsigned(ctrl_count)+1;
        end if;
    end process;
end STR;