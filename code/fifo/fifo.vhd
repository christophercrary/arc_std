-- ****************************************************************************
-- fifo.vhd --
--
--     Wrapper of `fifo_sv`.
--
-- Author(s):
--     Greg Stitt (gstitt@ufl.edu)
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Greg Stitt
--
-- Last Modified On:
--     November 3, 2022
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package fifo_pkg is
    function get_latency(read_latency : natural) return natural;
end package;

package body fifo_pkg is

    function get_latency(read_latency : natural) return natural is
    begin
        return read_latency;
    end function;

end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
  
entity fifo is
    generic (
        data_type : type_t;
        depth : positive;
        read_latency : positive := 1;
        almost_full_threshold : natural := depth - 1;
        ram_style : string := "";
        reg_full : std_logic := '1';
        reg_almost_full : std_logic := '1';
        reg_empty : std_logic := '1';
        read_clears_full : std_logic := '0';
        access_protection : std_logic := '1';

        data_width : positive := get_width(data_type);
        count_width : positive := n_bits_amount(depth+1));
    port (
        clk : in std_logic;
        rst : in std_logic;
        wr_en : in std_logic;
        wr_data : in std_logic_vector(data_width-1 downto 0);
        rd_en : in std_logic;
        rd_data : out std_logic_vector(data_width-1 downto 0);
        full : out std_logic;
        almost_full : out std_logic;
        empty : out std_logic;
        count : out std_logic_vector(count_width-1 downto 0));
end entity;


architecture STR of fifo is

    -- Component declaration for `fifo_sv`.
    component fifo_sv is
    generic (
        width : positive := data_width;
        depth : positive := depth;
        read_latency : positive := read_latency;
        almost_full_threshold : natural := almost_full_threshold;
        ram_style : string := ram_style;
        reg_full : std_logic := reg_full;
        reg_almost_full : std_logic := reg_almost_full;
        reg_empty : std_logic := reg_empty;
        read_clears_full : std_logic := read_clears_full;
        access_protection : std_logic := access_protection);
    port (
        clk : in std_logic;
        rst : in std_logic;
        wr_en : in std_logic;
        wr_data : in std_logic_vector(data_width-1 downto 0);
        rd_en : in std_logic;
        rd_data : out std_logic_vector(data_width-1 downto 0);
        full : out std_logic;
        almost_full : out std_logic;
        empty : out std_logic;
        count : out std_logic_vector(count_width-1 downto 0));
    end component;

begin

    U_FIFO : fifo_sv
    port map (
        clk => clk,
        rst => rst,
        wr_en => wr_en,
        wr_data => wr_data,
        rd_en => rd_en,
        rd_data => rd_data,
        full => full,
        almost_full => almost_full,
        empty => empty,
        count => count);

end architecture STR;
