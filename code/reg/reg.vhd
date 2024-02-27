-- ****************************************************************************
-- reg.vhd.
--
--     Register entity.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--     Greg Stitt (gstitt@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified On:
--     November 12, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package reg_pkg is

  type reg_t is (no_rst_t, async_rst_t, sync_reset_t);

end package;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.reg_pkg.all;

entity reg is
  generic (
    data_type : type_t;
    reg_type : reg_t := async_rst_t;
    
    data_width : positive := get_width(data_type);
    reset_value : std_logic_vector(data_width-1 downto 0) := (others => '0'));
  port (
    clk    : in  std_logic;
    rst    : in  std_logic := '0';
    enable : in  std_logic := '1';
    input  : in  std_logic_vector(data_width-1 downto 0) := (others => '0');
    output : out std_logic_vector(data_width-1 downto 0) := (others => '0'));
end reg;


architecture BHV of reg is
begin

  U_REG_GEN : if (reg_type = no_rst_t) generate
    -- No reset architecture.
    
    process(clk)
    begin
      if (rising_edge(clk)) then
        if (enable = '1') then
          output <= input;
        end if;
      end if;
    end process;

    
  elsif (reg_type = async_rst_t) generate
    -- Asynchronous reset architecture.

    process(clk,rst)
    begin
      if (rst = '1') then
        output <= reset_value;      
      elsif (rising_edge(clk)) then
        if (enable = '1') then
          output <= input;
        end if;
      end if;    
    end process;


  else generate
    -- Synchronous reset architecture.
         
    process(clk)
    begin
      if (rising_edge(clk)) then
        if (rst = '1') then
          output <= reset_value;      
        else
          if (enable = '1') then
            output <= input;
          end if;
        end if;     
      end if;    
    end process;
    

  end generate U_REG_GEN;
    
end architecture BHV;
