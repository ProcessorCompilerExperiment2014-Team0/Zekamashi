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

  type src_t is (SRC_SRAM, SRC_DATA, SRC_U232C, SRC_NOPE);

  type latch_t is record
    src  : src_t;
    data : unsigned(7 downto 0);
  end record latch_t;

  signal r, rin : latch_t;

begin

  process (r, uio, uoo, cacheo, din) is
    variable v      : latch_t;
    variable dv     : mmu_out_t;
    variable uiv    : u232c_in_in_t;
    variable uov    : u232c_out_in_t;
    variable cachev : datacache_in_t;
  begin
    v := r;
    dv := (data => (others => '-'),
           miss => '0');
    uiv := (rden => '0');
    uov := (data => (others => '-'),
            go   => '0');
    cachev := (addr => (others => '-'),
               data => (others => '-'),
               en   => '0',
               we   => '1');

    ---------------------------------------------------------------------------


    case din.addr(20) is
      when '0' =>
        cachev := (addr => din.addr(19 downto 0),
                   data => din.data,
                   en   => din.en,
                   we   => din.we);
        v.src := SRC_SRAM;

      when '1' =>
        if din.en = '1' then
          if din.we = '1' then
            case din.addr(19 downto 0) is
              when x"00000" | x"00001" | x"00002" =>
                assert false report "cannot write to this address" severity error;
              when x"00003" =>
                uov.data := din.data(7 downto 0);
                uov.go   := '1';
                v.src        := SRC_NOPE;
              when others => null;
            end case;
          else
            case din.addr(19 downto 0) is
              when x"00000" =>
                v.data := (0      => not uio.empty,
                           others => '0');
                v.src := SRC_DATA;
              when x"00001" =>
                uiv.rden := '1';
                v.src := SRC_U232C;
              when x"00002" =>
                v.data := (0      => uoo.busy,
                           others => '0');
                v.src := SRC_DATA;
              when x"00003" =>
                assert false report "cannot read from this address" severity error;
              when others => null;
            end case;
          end if;
        end if;

      when others => null;
    end case;

    ---------------------------------------------------------------------------

    case r.src is
      when SRC_SRAM =>
        dv.data := cacheo.data;
        dv.miss := cacheo.miss;
      when SRC_DATA =>
        dv.data := resize(r.data, 32);
        dv.miss := '0';
      when SRC_U232C =>
        dv.data := resize(uio.data, 32);
        dv.miss := '0';
      when SRC_NOPE =>
        dv.data := (others => '-');
        dv.miss := '0';
      when others => null;
    end case;

    ---------------------------------------------------------------------------

    rin    <= v;
    uii    <= uiv;
    uoi    <= uov;
    cachei <= cachev;
    dout   <= dv;
  end process;

  process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= (src  => SRC_NOPE,
            data => (others => '-'));
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
