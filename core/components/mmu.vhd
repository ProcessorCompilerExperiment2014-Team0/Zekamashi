-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.datacache_p.all;

package mmu_p is

  type mmu_in_t is record
    addr : unsigned(20 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record mmu_in_t;

  type mmu_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record mmu_out_t;

  component mmu is
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      uii    : out u232c_in_in_t;
      uio    : in  u232c_in_out_t;
      uoi    : out u232c_out_in_t;
      uoo    : in  u232c_out_out_t;
      cachei : out datacache_in_t;
      cacheo : in  datacache_out_t;

      din  : in  mmu_in_t;
      dout : out mmu_out_t);
  end component mmu;

end package mmu_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.datacache_p.all;
use work.mmu_p.all;

entity mmu is
  port (
    clk  : in std_logic;
    xrst : in std_logic;

    uii    : out u232c_in_in_t;
    uio    : in  u232c_in_out_t;
    uoi    : out u232c_out_in_t;
    uoo    : in  u232c_out_out_t;
    cachei : out datacache_in_t;
    cacheo : in  datacache_out_t;

    din  : in  mmu_in_t;
    dout : out mmu_out_t);
end entity mmu;

architecture behavior of mmu is

  type src_t is (SRC_SRAM, SRC_DATA, SRC_U232C);
  signal src  : src_t := SRC_DATA;
  signal data : unsigned(31 downto 0) := (others => '-');

begin

  uoi <= (data => din.data(7 downto 0),
          go   => '1')
         when din.en = '1'
         and  din.we = '1'
         and  din.addr = "1" & x"00003" else
         (data => (others => '-'),
          go   => '0');

  uii <= (rden => '1')
         when din.en = '1'
         and  din.we = '0'
         and  din.addr = "1" & x"00001" else
         (rden => '0');

  cachei <= (addr => din.addr(19 downto 0),
             data => din.data,
             en   => din.en,
             we   => din.we)
            when din.addr(20) = '1' else
            (addr => (others => '-'),
             data => (others => '-'),
             en   => '0',
             we   => '-');

  dout <= (data =>  cacheo.data,
           miss =>  cacheo.miss)
          when src = SRC_SRAM else
          (data => uio.data,
           miss => '0')
          when src = SRC_U232C else
          (data => data,
           miss => '0');

  seq : process (clk, xrst) is
  begin
    if xrst = '0' then
      src  <= SRC_DATA;
      data <= (others => '-');
    elsif rising_edge(clk) then
      if din.en = '0' and din.we = '0' then
        if din.addr(20) = '0' then
          src  <= SRC_SRAM;
        elsif din.addr = "1" & x"00000" then
          src  <= SRC_DATA;
          data <= (0      => not uio.empty,
                   others => '0');
        elsif din.addr = "1" & x"00001" then
          src  <= SRC_U232C;
        elsif din.addr = "1" & x"00002" then
          src  <= SRC_DATA;
          data <= (0      => not uoo.busy,
                   others => '0');
        else
          src  <= SRC_DATA;
          data <= (others => '-');
        end if;
      else
        src  <= SRC_DATA;
        data <= (others => '-');
      end if;
    end if;
  end process seq;

end architecture behavior;
