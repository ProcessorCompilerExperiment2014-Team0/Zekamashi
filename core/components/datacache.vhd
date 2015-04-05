-------------------------------------------------------------------------------
-- Cache Memory
-- * 512 Line
-- * 16 word(64 byte) per line
-- * total 8KiWord
-- * 2-way set associative
--
-- tag:8 | idx:8 | line:4
---------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sram_p.all;

package datacache_p is

  type datacache_in_t is record
    addr : unsigned(19 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record datacache_in_t;

  type datacache_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
    busy : std_logic;
  end record datacache_out_t;

  component datacache is
    port (
      clk  : in std_logic;
      xrst : in std_logic;

      srami : out sram_in_t;
      sramo : in  sram_out_t;

      din  : in  datacache_in_t;
      dout : out datacache_out_t);
  end component datacache;

end package datacache_p;


-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.datacache_p.all;
use work.ram_p.all;
use work.sram_p.all;

entity datacache is
  port (
    clk : in std_logic;
    xrst : in std_logic;

    srami : out  sram_in_t;
    sramo : in sram_out_t;

    din  : in  datacache_in_t;
    dout : out datacache_out_t);
end entity datacache;

architecture behavior of datacache is

  type hotbit_in_t is record
    we   : std_logic;
    addr : unsigned(7 downto 0);
    data : unsigned(0 downto 0);
  end record hotbit_in_t;

  type hotbit_out_t is record
    data : unsigned(0 downto 0);
  end record hotbit_out_t;

  signal hotbiti : hotbit_in_t;
  signal hotbito : hotbit_out_t;


  type tagarray_in_t is record
    we   : std_logic;
    addr : unsigned(7 downto 0);
    data : unsigned(7 downto 0);
  end record tagarray_in_t;

  type tagarray_out_t is record
    data : unsigned(7 downto 0);
  end record tagarray_out_t;

  type tagarray_in_array_t is array (0 to 1) of tagarray_in_t;
  type tagarray_out_array_t is array (0 to 1) of tagarray_out_t;

  signal tagarri : tagarray_in_array_t;
  signal tagarro : tagarray_out_array_t;


  type cache_in_t is record
    en   : std_logic;
    we   : std_logic;
    addr1 : unsigned(11 downto 0);
    addr2 : unsigned(11 downto 0);
    data1 : unsigned(31 downto 0);
  end record cache_in_t;

  type cache_out_t is record
    data1 : unsigned(31 downto 0);
    data2 : unsigned(31 downto 0);
  end record cache_out_t;

  type cache_in_array_t is array (0 to 1) of cache_in_t;
  type cache_out_array_t is array (0 to 1) of cache_out_t;

  signal cachei : cache_in_array_t;
  signal cacheo : cache_out_array_t;


  type state_t is (ST_FINE, ST_BUSY);

  type latch_t is record
    state          : state_t;
    -- cache fetch
    cnt            : integer range 0 to 19;
    hot            : integer range 0 to 1;
    tag            : unsigned(7 downto 0);
    tag_idx        : unsigned(7 downto 0);
    line_idx       : unsigned(3 downto 0);
    -- hit line
    hit            : std_logic;
    hit_line       : integer range 0 to 1;
    -- write buffer
    we             : std_logic;
    write_tag_idx  : unsigned(7 downto 0);
    write_line_idx : unsigned(3 downto 0);
    write_data     : unsigned(31 downto 0);
  end record latch_t;

  constant latch_init : latch_t := (
    state          => ST_FINE,
    cnt            => 0,
    hot            => 0,
    tag            => (others => '-'),
    tag_idx        => (others => '-'),
    line_idx       => (others => '-'),
    hit            => '0',
    hit_line       => 0,
    we             => '-',
    write_tag_idx  => (others => '-'),
    write_line_idx => (others => '-'),
    write_data     => (others => '-'));

  signal r, rin : latch_t := latch_init;

begin

  hotbit : distram_single
    generic map (
      length     => 1,
      width      => 8,
      init_value => x"00")
    port map (
      clk   => clk,
      we    => hotbiti.we,
      addr  => hotbiti.addr,
      idata => hotbiti.data,
      odata => hotbito.data);

  tagarray0 : distram_single
    generic map (
      length     => 8,
      width      => 8,
      init_value => x"00")
    port map (
      clk   => clk,
      we    => tagarri(0).we,
      addr  => tagarri(0).addr,
      idata => tagarri(0).data,
      odata => tagarro(0).data);

  tagarray1 : distram_single
    generic map (
      length     => 8,
      width      => 8,
      init_value => x"01")
    port map (
      clk   => clk,
      we    => tagarri(1).we,
      addr  => tagarri(1).addr,
      idata => tagarri(1).data,
      odata => tagarro(1).data);

  cache0 : blockram_dual
    generic map (
      writefirst => true,
      length     => 32,
      width      => 12,
      init_value => to_unsigned(0, 32))
    port map (
      clk    => clk,
      en     => cachei(0).en,
      we     => cachei(0).we,
      addr1  => cachei(0).addr1,
      addr2  => cachei(0).addr2,
      idata1 => cachei(0).data1,
      odata1 => cacheo(0).data1,
      odata2 => cacheo(0).data2);

  cache1 : blockram_dual
    generic map (
      writefirst => true,
      length     => 32,
      width      => 12,
      init_value => to_unsigned(0, 32))
    port map (
      clk    => clk,
      en     => cachei(1).en,
      we     => cachei(1).we,
      addr1  => cachei(1).addr1,
      addr2  => cachei(1).addr2,
      idata1 => cachei(1).data1,
      odata1 => cacheo(1).data1,
      odata2 => cacheo(1).data2);

  cmb: process (din, hotbito, tagarro, cacheo, sramo, r) is

    -- temporary variables
    variable hot      : unsigned(0 downto 0);
    variable tag      : unsigned(7 downto 0);
    variable tag_idx  : unsigned(7 downto 0);
    variable line_idx : unsigned(3 downto 0);

    -- output variables
    variable v       : latch_t;
    variable dv      : datacache_out_t;
    variable hotbitv : hotbit_in_t;
    variable tagarrv : tagarray_in_array_t;
    variable cachev  : cache_in_array_t;
    variable sramv   : sram_in_t;

  begin
    v := r;
    dv := (
      data => (others => '-'),
      miss => '-',
      busy => '-');
    hotbitv := (
      we   => '0',
      addr => (others => '0'),
      data => (others => '-'));
    tagarrv := (others => (
      we   => '0',
      addr => (others => '0'),
      data => (others => '-')));
    cachev := (others => (
      en    => '0',
      we    => '0',
      addr1 => (others => '0'),
      addr2 => (others => '0'),
      data1 => (others => '-')));
    sramv := (
      we   => '0',
      addr => (others => '-'),
      data => (others => '-'));

    -- default values for hit line
    v.hit            := '0';
    v.hit_line       := 0;
    -- default values for write buffer
    v.we             := '-';
    v.write_tag_idx  := (others => '-');
    v.write_line_idx := (others => '-');
    v.write_data     := (others => '-');

    case r.state is
      when ST_FINE =>
        tag      := din.addr(19 downto 12);
        tag_idx  := din.addr(11 downto 4);
        line_idx := din.addr(3 downto 0);

        -- write buffering
        if r.hit = '1' then
          hotbitv := (
            we   => '1',
            addr => r.write_tag_idx,
            data => to_unsigned(r.hit_line, 1));

          if r.we = '1' then
            cachev(r.hit_line).en    := '1';
            cachev(r.hit_line).we    := '1';
            cachev(r.hit_line).addr1 := r.write_tag_idx & r.write_line_idx;
            cachev(r.hit_line).data1 := r.write_data;
          end if;
        end if;

        if din.en = '1' then
          tagarrv(0) := (
            we   => '0',
            addr => tag_idx,
            data => (others => '-'));
          tagarrv(1) := (
            we   => '0',
            addr => tag_idx,
            data => (others => '-'));

          -- check cache hit/miss
          if tag = tagarro(0).data then
            v.hit      := '1';
            v.hit_line := 0;
          elsif tag = tagarro(1).data then
            v.hit      := '1';
            v.hit_line := 1;
          else
            v.hit := '0';
          end if;

          v.we             := din.we;
          v.write_tag_idx  := tag_idx;
          v.write_line_idx := line_idx;
          v.write_data     := din.data;

          v.tag      := tag;
          v.tag_idx  := tag_idx;
          v.line_idx := line_idx + 1;

          cachev(0).en    := '1';
          cachev(0).addr2 := tag_idx & line_idx;
          cachev(1).en    := '1';
          cachev(1).addr2 := tag_idx & line_idx;

          sramv := (
            we   => din.we,
            addr => din.addr,
            data => din.data);

          if din.we = '0' then
            if (tag = tagarro(0).data) or (tag = tagarro(1).data) then
              v.state := ST_FINE;
            else
              v.state := ST_BUSY;
              v.cnt   := 1;
            end if;
          end if;
        end if;

      when ST_BUSY =>

        -----------------------------------------------------------------------
        -- Fetch CacheLine
        --   r.cnt    0                  19
        --   SRAM in  xxxxxxxxxxxxxxxx----
        --   SRAM out ----xxxxxxxxxxxxxxxx
        --   miss     xxxx----------------
        --   busy     xxxxxxxxxxxxxxxxxxxx
        -----------------------------------------------------------------------

        if r.cnt = 1 then
          hotbitv := (
            we   => '0',
            addr => r.tag_idx,
            data => (others => '-'));
          v.hot := to_integer(not hotbito.data);
        elsif r.cnt = 2 then
          hotbitv := (
            we   => '1',
            addr => r.tag_idx,
            data => to_unsigned(r.hot, 1));
          tagarrv(r.hot) := (
            we   => '1',
            addr => r.tag_idx,
            data => r.tag);
        end if;

        if r.cnt >= 4 then
          cachev(r.hot).en    := '1';
          cachev(r.hot).we    := '1';
          cachev(r.hot).addr1 := r.tag_idx & (r.line_idx - 4);
          cachev(r.hot).data1 := sramo.data;
        end if;

        if r.cnt <= 15 then
          sramv := (
            we   => '0',
            addr => r.tag & r.tag_idx & r.line_idx,
            data => (others => '-'));
        end if;

        if r.cnt = 19 then
          v.state := ST_FINE;
          v.cnt   := 0;
        else
          v.cnt      := r.cnt + 1;
          v.line_idx := r.line_idx + 1;
        end if;
    end case;

    -- Output
    case r.state is
      when ST_FINE =>
        dv.data := cacheo(r.hit_line).data2;
        dv.busy := '0';

      when ST_BUSY =>
        dv.data := sramo.data;
        dv.busy := '1';
    end case;

    if r.state = ST_BUSY and r.cnt <= 3  then
      dv.miss := '1';
    else
      dv.miss := '0';
    end if;

    -- Signal Assign
    hotbiti <= hotbitv;
    tagarri <= tagarrv;
    cachei  <= cachev;
    srami   <= sramv;
    dout    <= dv;
    rin     <= v;
  end process;

  seq: process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
