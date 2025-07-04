--  Copyright (c) 2015 University of Florida
--
--  This file is part of uaa.
--
--  uaa is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  uaa is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with uaa.  If not, see <http://www.gnu.org/licenses/>.

-- Greg Stitt
-- University of Florida
--
-- Entity: delay
-- Description: This entity delays an input by a specified number of cycles,
-- while also allowing stalls and specific output values on reset.

library ieee;
use ieee.std_logic_1164.all;

library arc_std;
context arc_std.std_context;


-------------------------------------------------------------------------------
-- Generic Descriptions
-- cycles : The length of the delay in cycles (required)
-- width  : The width of the input signal (required)
-- init   : An initial value (of width bits) for the first "cycles" output
--          after a reset (required)
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Port Description
-- clk : clock
-- rst : reset
-- en : enable (active high), '0' stalls the delay pipeline
-- input : The input to be delayed
-- output : The input after "cycles" pass (assuming no stalls from en='0')
-------------------------------------------------------------------------------

entity delay_fcbt is
  generic(cycles :     natural;
          width  :     positive;
          init   :     std_logic_vector);
  port( clk      : in  std_logic;
        rst      : in  std_logic;
        en       : in  std_logic;
        input    : in  std_logic_vector(width-1 downto 0);
        output   : out std_logic_vector(width-1 downto 0));
end delay_fcbt;


architecture FF of delay_fcbt is

  type reg_array is array (0 to cycles-1) of std_logic_vector(width-1 downto 0);
  signal regs : reg_array;

begin  -- BHV

  U_CYCLES_GT_0 : if cycles > 0 generate

    process(clk, rst)
    begin
      if (rst = '1') then
        for i in 0 to cycles-1 loop
          regs(i) <= init;
        end loop;
      elsif (clk'event and clk = '1') then

        if (en = '1') then
          regs(0) <= input;
        end if;

        for i in 0 to cycles-2 loop
          if (en = '1') then
            regs(i+1) <= regs(i);
          end if;
        end loop;

      end if;
    end process;

    output <= regs(cycles-1);

  end generate U_CYCLES_GT_0;

  U_CYCLES_EQ_0 : if cycles = 0 generate

    output <= input;

  end generate U_CYCLES_EQ_0;

end FF;

