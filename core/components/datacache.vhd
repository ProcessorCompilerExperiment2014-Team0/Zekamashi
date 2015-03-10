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

  -- signals for hot bit

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

  -- signals for tagarray

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

  -- signals for cache

  type cache_in_t is record
    en   : std_logic;
    we   : std_logic;
    addr : unsigned(12 downto 0);
    data : unsigned(31 downto 0);
  end record cache_in_t;

  type cache_out_t is record
    data : unsigned(31 downto 0);
  end record cache_out_t;

  signal cachei : cache_in_t;
  signal cacheo : cache_out_t;

  -- state

  type state_t is (ST_FINE, ST_BUSY);

  type latch_t is record
    state    : state_t;
    cnt      : integer range 0 to 19;
    hot      : unsigned(0 downto 0);
    tag      : unsigned(7 downto 0);
    tag_idx  : unsigned(7 downto 0);
    line_idx : unsigned(3 downto 0);
  end record latch_t;

  constant latch_init : latch_t := (
    state    => ST_FINE,
    cnt      => 0,
    hot      => (others => '-'),
    tag      => (others => '-'),
    tag_idx  => (others => '-'),
    line_idx => (others => '-'));

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

  cache : blockram_single
    generic map (
      length => 32,
      width  => 13,
      init_value => to_unsigned(0, 13))
    port map (
      clk   => clk,
      en    => cachei.en,
      we    => cachei.we,
      addr  => cachei.addr,
      idata => cachei.data,
      odata => cacheo.data);

  process (din, hotbito, tagarro, cacheo, sramo, r) is

    -- temporary variables
    variable tag      : unsigned(7 downto 0);
    variable tag_idx  : unsigned(7 downto 0);
    variable line_idx : unsigned(3 downto 0);

    -- output variables
    variable v       : latch_t;
    variable dv      : datacache_out_t;
    variable hotbitv : hotbit_in_t;
    variable tagarrv : tagarray_in_array_t;
    variable cachev  : cache_in_t;
    variable sramv   : sram_in_t;

  begin
    v  := r;
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
    cachev := (
      en   => '0',
      we   => '-',
      addr => (others => '-'),
      data => (others => '-'));
    sramv := (
      we   => '0',
      addr => (others => '-'),
      data => (others => '-'));

    case r.state is
      when ST_FINE =>
        if din.en = '1' then
          tag      := din.addr(19 downto 12);
          tag_idx  := din.addr(11 downto 4);
          line_idx := din.addr(3 downto 0);

          tagarrv(0) := (
            we   => '0',
            addr => tag_idx,
            data => (others => '-'));
          tagarrv(1) := (
            we   => '0',
            addr => tag_idx,
            data => (others => '-'));

          if din.we = '1' then
            if tag = tagarro(0).data then
              cachev := (
                en   => '1',
                we   => '1',
                addr => tag_idx & "0" & line_idx,
                data => din.data);
              hotbitv := (
                we   => '1',
                addr => tag_idx,
                data => "0");
            elsif tag = tagarro(1).data then
              cachev := (
                en   => '1',
                we   => '1',
                addr => tag_idx & "1" & line_idx,
                data => din.data);
              hotbitv := (
                we   => '1',
                addr => tag_idx,
                data => "1");
            end if;

            sramv := (
              we   => '1',
              addr => tag & tag_idx & line_idx,
              data => din.data);
          else
            if tag = tagarro(0).data then
              cachev := (
                en   => '1',
                we   => '0',
                addr => tag_idx & "0" & line_idx,
                data => (others => '-'));
              hotbitv := (
                we   => '1',
                addr => tag_idx,
                data => "0");
              v.state := ST_FINE;
            elsif tag = tagarro(1).data then
              cachev := (
                en   => '1',
                we   => '0',
                addr => tag_idx & "1" & line_idx,
                data => (others => '-'));
              hotbitv := (
                we   => '1',
                addr => tag_idx,
                data => "1");
              v.state := ST_FINE;
            else
              sramv := (
                addr => tag & tag_idx & line_idx,
                data => (others => '-'),
                we   => '0');
              v.state    := ST_BUSY;
              v.cnt      := 1;
              v.tag      := tag;
              v.tag_idx  := tag_idx;
              v.line_idx := line_idx + 1;
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
          v.hot := not hotbito.data;
        elsif r.cnt = 2 then
          hotbitv := (
            we   => '1',
            addr => r.tag_idx,
            data => r.hot);
          tagarrv(to_integer(r.hot)) := (
            we   => '1',
            addr => r.tag_idx,
            data => r.tag);
        end if;

        if r.cnt >= 4 then
          cachev := (
            en   => '1',
            we   => '1',       
            addr => r.tag_idx & r.hot & (r.line_idx - 4),
            data => sramo.data);
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
        dv.data := cacheo.data;
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

  process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
