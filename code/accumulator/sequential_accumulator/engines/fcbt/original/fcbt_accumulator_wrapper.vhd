library arc_std;
context arc_std.std_context;

entity fcbtWrapper is
    generic (
        width : positive := 32;
        FCBT_max_inputs : positive := 128;
        FCBT_obuf_size  : positive := 14
        );
    port (
        clk          : in  std_logic;
        rst          : in  std_logic;
        hold_output  : in  std_logic;   -- '1' keeps outputs from disappearing
        ready        : out std_logic;   -- '1' when fcbt can accept input
        end_of_group : in  std_logic;   -- specifies last input in group

        ip        : in  std_logic_vector(width-1 downto 0);
        result    : out std_logic_vector(width-1 downto 0);
        valid_in  : in  std_logic;
        valid_out : out std_logic
        );
end fcbtWrapper;

architecture STR of fcbtWrapper is
begin
    U_FCBT : entity arc_std.fcbt_orig
        generic map (
            data_type       => float32_t,
            width           => get_width(float32_t),
            add_core_name   => "speed",
            use_bram        => true,
            FCBT_max_inputs => FCBT_max_inputs,      -- Max number of elements per group
            FCBT_obuf_size  => FCBT_obuf_size        -- Number of groups that could be computed together
        )
        port map (
            clk          => clk,
            rst          => rst,
            hold_output  => hold_output,   -- '1' keeps outputs from disappearing
            ready        => ready,   -- '1' when fcbt can accept input
            end_of_group => end_of_group,   -- specifies last input in group

            input     => ip,
            output    => result,
            valid_in  => valid_in,
            valid_out => valid_out
        );
end STR;