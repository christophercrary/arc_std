	component float32_mult is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			b      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- b
			q      : out std_logic_vector(31 downto 0)                     -- q
		);
	end component float32_mult;

	u0 : component float32_mult
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			a      => CONNECTED_TO_a,      --      a.a
			b      => CONNECTED_TO_b,      --      b.b
			q      => CONNECTED_TO_q       --      q.q
		);

