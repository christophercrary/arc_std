-- ****************************************************************************
-- ram.vhd --
--
--     RAM with a standard 1-read port, 1-write port interface. The RAM is
--     configurable in terms of data type, RAM type, and the number of words.
--     The RAM has an optional write enable and an optional read enable.
--
--     The RAM type (`ram_type`) specifies one of several different archi-
--     tectures that implement different RAM behaviors. e.g., asynchronous
--     reads, synchronous reads, and synchronous reads during writes. Note
--     that asychronous reads are not supported by all FPGAs.
--
--     Note that if the write port signals are not driven, the entity will
--     act as a read-only memory (ROM).
--
--
-- Usage:
--
--     > The data type is specified by the generic `data_type`.
--
--     > The number of words in the memory is specified by the generic
--       `num_words`. This generic will usually be `2**addr_width`, but the
--       entity supports non-powers of 2.
--
--     > The RAM architecture type is specified by the generic `ram_type`.
--       The possible values for `ram_type` are `async_read_t`,
--       `sync_read_rdw_new_data_t`, `sync_read_rdw_old_data_t`,
--       and `sync_read_rdw_dont_care_t`.
--
--       The value `async_read_t` corresponds to an "asynchronous read" RAM,
--       where read data is given during the same cycle in which a read is
--       initiated.
--
--       The value `sync_read_rdw_new_data_t` corresponds to a "synchronous 
--       read" RAM, where read data is given in the cycle following that in 
--       which a read is initiated. In the case of reading and writing to the
--       same address at the same time--denoted a "read-during-write (RDW)"--
--       operation, the read returns the new data that was written.
--
--       The value `sync_read_rdw_old_data_t` also corresponds to a 
--       "synchronous read" RAM, but in the case of reading and writing to 
--       the same address at the same time, the read returns the data that was
--       available before the write.
--
--       The value `sync_read_rdw_dont_care_t` also corresponds to a 
--       "synchronous read" RAM, but in the case of reading and writing to 
--       the same address at the same time, the read returns don't care values.
--       In practice, this architecture should only be chosen if such a RDW
--       operation will not take place, or if the results of such an operation
--       will be ignored. Ultimately, this architecture is meant to allow 
--       Quartus software to more easily infer MLAB blocks automatically for
--       Intel FPGAs.
--
--     > The initial value(s) of the memory is specified by the generic `init`.
--
--     > The generic `style` allows the user to optionally specify a
--       device-specific RAM type. See the relevant FPGA documentation
--       for appropriate strings. This should likely only be needed for
--       Intel FPGAs when specifying an MLAB.
--
--     > All other generics should not be manually configured.
--
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--     Greg Stitt (gstitt@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     December 7, 2021
-- ****************************************************************************

library arc_std;
context arc_std.std_context;

package ram_pkg is

  type ram_t is (
    async_read_t, 
    sync_read_rdw_new_data_t, 
    sync_read_rdw_old_data_t,
    sync_read_rdw_dont_care_t);

  -- Return the latency of the specified RAM type.
  function get_latency(ram_type : ram_t) return natural;
  
end package;

package body ram_pkg is  

  function get_latency(ram_type : ram_t) return natural is
    
    variable latency : natural := 0;
    
  begin

    if (ram_type /= async_read_t) then
      latency := 1;
    end if;

    return latency;
      
  end function;


end package body;

-------------------------------------------------------------------------------

library arc_std;
context arc_std.std_context;

use arc_std.ram_pkg.all;

entity ram is
  generic(
    data_type : type_t;
    data_width : positive := get_width(data_type);
    
    num_words : positive;
    ram_type : ram_t;
    
    init : tuple_t(0 to num_words-1)(data_width-1 downto 0) :=
      (others => (others => '0'));

    style : string := "";
    
    addr_width : positive := n_bits_amount(num_words));
  
  port(
    clk   : in  std_logic;
    
    wen   : in  std_logic := '0';
    waddr : in  std_logic_vector(addr_width-1 downto 0) := (others => '0');
    wdata : in  std_logic_vector(data_width-1 downto 0) := (others => '0');

    ren   : in  std_logic := '1';
    raddr : in  std_logic_vector(addr_width-1 downto 0);
    rdata : out std_logic_vector(data_width-1 downto 0));
end entity;


architecture BHV of ram is

  signal memory : tuple_t(0 to num_words-1)(
    data_width-1 downto 0) := init;

  signal raddr_reg : std_logic_vector(
    addr_width-1 downto 0) := (others => 'X');

  attribute ramstyle : string;
  attribute ramstyle of memory : signal is style;

begin  

  U_RAM_COND : if (ram_type = async_read_t) generate

    -- Data for a read is given during the same cycle in which
    -- a read is initiated.
    
    process(clk)
    begin
      if (rising_edge(clk)) then
        if (wen = '1') then
          memory(to_integer(unsigned(waddr))) <= wdata;
        end if;
      end if;
    end process;

    rdata <= memory(to_integer(unsigned(raddr)));
    

  elsif (ram_type = sync_read_rdw_new_data_t) generate
    
    -- Data for a read is given in the cycle following that in
    -- which a read is initiated. In the case of reading and
    -- writing to the same address at the same time, the read
    -- returns the new data that was written.

    process(clk)
    begin
      if (rising_edge(clk)) then
        if (wen = '1') then
          memory(to_integer(unsigned(waddr))) <= wdata;
        end if;
        
        if (ren = '1') then
          raddr_reg <= raddr;
        end if;
      end if;
    end process;

    rdata <= memory(to_integer(unsigned(raddr_reg)));

    
  elsif (ram_type = sync_read_rdw_old_data_t) generate
         
    -- Data for a read is given in the cycle following that in
    -- which the read is initiated. In the case of reading and
    -- writing to the same address at the same time, the read
    -- returns the data that was available before the write.

    process(clk)
    begin
      if (rising_edge(clk)) then
        if (wen = '1') then
          memory(to_integer(unsigned(waddr))) <= wdata;
        end if;

        if (ren = '1') then
          rdata <= memory(to_integer(unsigned(raddr)));
        end if;
      end if;
    end process;


  else generate

    -- Data for a read is given in the cycle following that in
    -- which the read is initiated. In the case of reading and
    -- writing to the same address at the same time, the read
    -- returns don't care values.

    process(clk)
    begin
      if (rising_edge(clk)) then
        if (wen = '1') then
          memory(to_integer(unsigned(waddr))) <= wdata;
        end if;

        if (wen = '1' and ren = '1') then
          rdata <= (others => '-');
        elsif (ren = '1') then
          rdata <= memory(to_integer(unsigned(raddr)));
        end if;
      end if;
    end process;


  end generate U_RAM_COND;
  
end architecture BHV;
