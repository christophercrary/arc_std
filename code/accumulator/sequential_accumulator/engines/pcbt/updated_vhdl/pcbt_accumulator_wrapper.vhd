library arc_std;
context arc_std.std_context;

entity pcbt_wrapper is
    generic (
        width : positive := 32;
        max_inputs : positive := 128
        );
    port (
        clk          : in  std_logic;
        rst          : in  std_logic;
        ready        : out std_logic;   -- '1' when fcbt can accept input
        end_of_group : in  std_logic;   -- specifies last input in group

        ip        : in  std_logic_vector(width-1 downto 0);
        result    : out std_logic_vector(width-1 downto 0);
        valid_in  : in  std_logic;
        valid_out : out std_logic
        );
end pcbt_wrapper;

architecture STR of pcbt_wrapper is
begin
    U_PCBT : entity arc_std.pcbt_accumulator
        generic map (
            input_type      => float32_t,
            max_inputs      => max_inputs
        )
        port map (
            clk          => clk,
            rst          => rst,
            ready        => ready,   -- '1' when fcbt can accept input
            end_of_group => end_of_group,   -- specifies last input in group
            input     => ip,
            output    => result,
            valid_in  => valid_in,
            valid_out => valid_out
        );
end STR;