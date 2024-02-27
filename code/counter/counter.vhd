-- ****************************************************************************
-- counter.vhd --
--
--     Counter entity.
--
--     The counter increments an output value `count` every rising clock edge
--     in which an enable signal, `enable`, is asserted to `1`. The count value
--     starts at zero and overflows upon incrementing past the value that is
--     one less than that specified by the VHDL generic `period`. Upon overflow,
--     the counter resets `count` back to zero.
--
--     Depending on the chosen architecture, a separate output signal `overflow`
--     is set to `1` when either (i) the count value is to overflow upon the
--     following rising clock edge or (ii) the count value has overflowed in the
--     current clock cycle. In particular, the former occurs with the `async_t`
--     architecture, and the latter occurs with  the `sync_t` architecture,
--     where these are specified by the `counter_type` generic. Regardless,
--     `overflow` is set once for every `period` rising clock edges in which
--     `enable` is set to `1`, and cleared otherwise.
--
--     The `count` value can be asynchronously reset by way of asserting the
--     `rst` input signal to `1`. 
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 12, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package counter_pkg is

  type counter_t is (async_t, sync_t);

end package;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;
use arc_std.counter_pkg.all;

entity counter is
  generic (
    period : positive;
    counter_type : counter_t;
    width : positive := n_bits_amount(period));
  port (
    clk : in std_logic;
    rst : in std_logic;

    enable : in std_logic;
    output : out std_logic_vector(width-1 downto 0);
    overflow : out std_logic);
end entity;


architecture BHV of counter is

  signal count, next_count : unsigned(width-1 downto 0);
  signal next_overflow : std_logic;
  
begin
  
  U_COUNTER_GEN : if (counter_type = async_t) generate

    -- Assert output signals asynchronously, in the same cycle
    -- that input signals change.

    process(all)
    begin

      if (rst = '1') then
        count <= to_unsigned(0, width);
        
      elsif (rising_edge(clk)) then
        count <= next_count;
      end if;
      
    end process;


    process(all)
    begin

      -- Set default values.
      next_count <= count;
      overflow <= '0';
      
      if (enable = '1') then
        -- Increment count value.
        
        if (count = to_unsigned(period-1, width)) then
          -- Overflow.
          next_count <= to_unsigned(0, width);
          overflow <= '1';
        else
          next_count <= count + 1;
        end if;
        
      end if;
      
    end process;

    output <= std_logic_vector(next_count);

-------------------------------------------------------------------------------

  elsif (counter_type = sync_t) generate
  
    -- Assert output signals synchronously, in the cycle
    -- that follows that in which input signals change.

    process(all)
    begin

      if (rst = '1') then
        count <= to_unsigned(0, width);
        overflow <= '0';
        
      elsif (rising_edge(clk)) then
        count <= next_count;
        overflow <= next_overflow;
      end if;
      
    end process;


    process(all)
    begin

      -- Set default values.
      next_count <= count;
      next_overflow <= '0';
      
      if (enable = '1') then
        -- Increment count value.
        
        if (count = to_unsigned(period-1, width)) then
          -- Overflow.
          next_count <= to_unsigned(0, width);
          next_overflow <= '1';
        else
          next_count <= count + 1;
        end if;
        
      end if;
      
    end process;

    output <= std_logic_vector(count);

    
  end generate U_COUNTER_GEN;

end architecture BHV;
