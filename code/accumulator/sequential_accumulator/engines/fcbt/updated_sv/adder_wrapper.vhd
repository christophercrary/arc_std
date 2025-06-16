library arc_std;
context arc_std.std_context;
use arc_std.adder_pkg.all;

entity adder_wrapper is
  port (
    clk       : in std_logic;
    rst       : in std_logic := '0';
    input1    : in std_logic_vector(31 downto 0);
    input2    : in std_logic_vector(31 downto 0);
    valid_in  : in std_logic := '-';
    result    : out std_logic_vector(31 downto 0);
    valid_out : out std_logic := '-');
end adder_wrapper;

architecture STR of adder_wrapper is
    
begin

UUT_ADDER : entity arc_std.adder
    generic map(
        input1_type => float32_t,
        input2_type => float32_t,
        use_valid   => true
        )
    port map(
        clk       => clk,
        rst       => rst,
        input1    => input1,
        input2    => input2,
        output    => result,
        valid_in  => valid_in,
        valid_out => valid_out
        );

end STR;