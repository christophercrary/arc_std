-- float64_sub.vhd

-- Generated using ACDS version 19.2 57

library IEEE;
library altera_fp_functions_191;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity float64_sub is
	port (
		clk    : in  std_logic                     := '0';             --    clk.clk
		areset : in  std_logic                     := '0';             -- areset.reset
		a      : in  std_logic_vector(63 downto 0) := (others => '0'); --      a.a
		b      : in  std_logic_vector(63 downto 0) := (others => '0'); --      b.b
		q      : out std_logic_vector(63 downto 0)                     --      q.q
	);
end entity float64_sub;

architecture rtl of float64_sub is
	component float64_sub_altera_fp_functions_191_ml2y6qy_cmp is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			a      : in  std_logic_vector(63 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(63 downto 0) := (others => 'X'); -- b
			q      : out std_logic_vector(63 downto 0)                     -- q
		);
	end component float64_sub_altera_fp_functions_191_ml2y6qy_cmp;

	for fp_functions_0 : float64_sub_altera_fp_functions_191_ml2y6qy_cmp
		use entity altera_fp_functions_191.float64_sub_altera_fp_functions_191_ml2y6qy;
begin

	fp_functions_0 : component float64_sub_altera_fp_functions_191_ml2y6qy_cmp
		port map (
			clk    => clk,    --    clk.clk
			areset => areset, -- areset.reset
			a      => a,      --      a.a
			b      => b,      --      b.b
			q      => q       --      q.q
		);

end architecture rtl; -- of float64_sub
