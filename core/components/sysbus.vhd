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
use work.instcache_p.all;

package sysbus_p is

  type sysbus_in_t is record
    addr : unsigned(20 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record sysbus_in_t;

  type sysbus_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record sysbus_out_t;

  component sysbus is
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      uii     : out u232c_in_in_t;
      uio     : in  u232c_in_out_t;
      uoi     : out u232c_out_in_t;
      uoo     : in  u232c_out_out_t;
      dcachei : out datacache_in_t;
      dcacheo : in  datacache_out_t;
      icachei : out instcache_write_in_t;
      icacheo : in  instcache_write_out_t;

      din  : in  sysbus_in_t;
      dout : out sysbus_out_t);
  end component sysbus;

end package sysbus_p;


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
use work.instcache_p.all;
use work.sysbus_p.all;

entity sysbus is
  port (
    clk  : in std_logic;
    xrst : in std_logic;

    uii     : out u232c_in_in_t;
    uio     : in  u232c_in_out_t;
    uoi     : out u232c_out_in_t;
    uoo     : in  u232c_out_out_t;
    dcachei : out datacache_in_t;
    dcacheo : in  datacache_out_t;
    icachei : out instcache_write_in_t;
    icacheo : in  instcache_write_out_t;

    din  : in  sysbus_in_t;
    dout : out sysbus_out_t);
end entity sysbus;

architecture behavior of sysbus is

  type state_t is (
    ST_FINE,                            -- no pending cache access
    ST_WAIT);                           -- wait cache access till cache is ready

  type src_t is (
    SRC_SRAM,
    SRC_DATA,
    SRC_U232C,
    SRC_NOPE);

  type latch_t is record
    src        : src_t;
    data       : unsigned(7 downto 0);
    state      : state_t;
    cache_we   : std_logic;
    cache_addr : unsigned(19 downto 0);
    cache_data : unsigned(31 downto 0);
  end record latch_t;

  constant latch_init : latch_t := (
    src        => SRC_NOPE,
    data       => (others => '0'),
    state      => ST_FINE,
    cache_we   => '-',
    cache_addr => (others => '-'),
    cache_data => (others => '-'));

  signal r, rin : latch_t := latch_init;

begin

  process (r, uio, uoo, dcacheo, icacheo, din) is
    variable v       : latch_t;
    variable dv      : sysbus_out_t;
    variable uiv     : u232c_in_in_t;
    variable uov     : u232c_out_in_t;
    variable dcachev : datacache_in_t;
    variable icachev : instcache_write_in_t;

    variable addr19 : unsigned(19 downto 0);
  begin
    v := r;
    dv := (
      data => (others => '-'),
      miss => '0');
    uiv := (
      rden => '0');
    uov := (
      data => (others => '-'),
      go   => '0');
    dcachev := (
      addr => (others => '-'),
      data => (others => '-'),
      en   => '0',
      we   => '1');
    icachev := (
      we   => '0',
      addr => (others => '0'),
      data => (others => '0'));

    case r.state is
      when ST_WAIT =>
        dv.miss := '1';

        if dcacheo.busy = '0' then
          v.state := ST_FINE;
          v.src   := SRC_SRAM;
          dcachev := (
            en   => '1',
            we   => r.cache_we,
            addr => r.cache_addr,
            data => r.cache_data);
        end if;

      when ST_FINE =>
        if din.en = '1' then
          if din.addr(20 downto 14) = 0 then
            icachev := (
              we   => '1',
              addr => din.addr(13 downto 0),
              data => din.data);
          end if;

          if din.addr(20) = '1' then
            addr19 := din.addr(19 downto 0);

            if din.we = '1' then
              case addr19 is
                when x"00000" | x"00001" | x"00002" =>
                  assert false report "cannot write to this address" severity error;
                when x"00003" =>
                  uov.data := din.data(7 downto 0);
                  uov.go   := '1';
                  v.src    := SRC_NOPE;
                when others => null;
              end case;
            else
              case addr19 is
                when x"00000" =>
                  v.data := (0      => not uio.empty,
                             others => '0');
                  v.src := SRC_DATA;
                when x"00001" =>
                  uiv.rden := '1';
                  v.src    := SRC_U232C;
                when x"00002" =>
                  v.data := (0      => not uoo.busy,
                             others => '0');
                  v.src := SRC_DATA;
                when x"00003" =>
                  assert false report "cannot read from this address" severity error;
                when others => null;
              end case;
            end if;
          else
            v.src := SRC_SRAM;

            if dcacheo.busy = '0' then
              dcachev := (
                en   => '1',
                we   => din.we,
                addr => din.addr(19 downto 0),
                data => din.data);
            else
              v.state      := ST_WAIT;
              v.cache_we   := din.we;
              v.cache_addr := din.addr(19 downto 0);
              v.cache_data := din.data;
            end if;
          end if;
        else
          v.src := SRC_SRAM;
        end if;

        case r.src is
          when SRC_SRAM =>
            dv.data := dcacheo.data;
            dv.miss := dcacheo.miss;
          when SRC_DATA =>
            dv.data := resize(r.data, 32);
            dv.miss := '0';
          when SRC_U232C =>
            dv.data := resize(uio.data, 32);
            dv.miss := '0';
          when SRC_NOPE =>
            dv.data := (others => '0');
            dv.miss := '0';
        end case;
    end case;

    rin     <= v;
    uii     <= uiv;
    uoi     <= uov;
    dcachei <= dcachev;
    icachei <= icachev;
    dout    <= dv;
  end process;

  process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
