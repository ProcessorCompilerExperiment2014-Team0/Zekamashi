-------------------------------------------------------------------------------
-- SRAM wrapper module
--   latency : 4clk
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sram_p is

  type sram_in_t is record
    addr : unsigned(19 downto 0);
    data : unsigned(31 downto 0);
    we   : std_logic;
  end record sram_in_t;

  type sram_out_t is record
    data : unsigned(31 downto 0);
  end record sram_out_t;

  component sram is
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;

      zd     : inout std_logic_vector(31 downto 0);
      zdp    : inout std_logic_vector(3 downto 0);
      za     : out   std_logic_vector(19 downto 0);
      xe1    : out   std_logic;
      e2a    : out   std_logic;
      xe3    : out   std_logic;
      xzbe   : out   std_logic_vector(3 downto 0);
      xga    : out   std_logic;
      xwa    : out   std_logic;
      xzcke  : out   std_logic;
      zclkma : out   std_logic_vector(1 downto 0);
      adva   : out   std_logic;
      xft    : out   std_logic;
      xlbo   : out   std_logic;
      zza    : out   std_logic;

      din  : in  sram_in_t;
      dout : out sram_out_t);
  end component sram;

end package sram_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sram_p.all;

entity sram is
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;

    zd     : inout std_logic_vector(31 downto 0);
    zdp    : inout std_logic_vector(3 downto 0);
    za     : out   std_logic_vector(19 downto 0);
    xe1    : out   std_logic;
    e2a    : out   std_logic;
    xe3    : out   std_logic;
    xzbe   : out   std_logic_vector(3 downto 0);
    xga    : out   std_logic;
    xwa    : out   std_logic;
    xzcke  : out   std_logic;
    zclkma : out   std_logic_vector(1 downto 0);
    adva   : out   std_logic;
    xft    : out   std_logic;
    xlbo   : out   std_logic;
    zza    : out   std_logic;

    din  : in  sram_in_t;
    dout : out sram_out_t);
end entity sram;

architecture behavior of sram is

  type latch_t is record
    we0   : std_logic;
    addr0 : std_logic_vector(19 downto 0);
    data0 : std_logic_vector(31 downto 0);
    we1   : std_logic;
    data1 : std_logic_vector(31 downto 0);
    we2   : std_logic;
    data2 : std_logic_vector(31 downto 0);
    odata : std_logic_vector(31 downto 0);
  end record latch_t;

  constant latch_init : latch_t := (
    we0   => '0',
    addr0 => (others => '0'),
    data0 => (others => '0'),
    we1   => '0',
    data1 => (others => '0'),
    we2   => '0',
    data2 => (others => '0'),
    odata => (others => '0'));

  signal r, rin : latch_t := latch_init;

begin  -- architecture behavior

  xe1   <= '0';
  e2a   <= '1';
  xe3   <= '0';
  xzbe  <= (others => '0');
  xga   <= '0';
  xzcke <= '0';
  zclkma(0) <= clk;
  zclkma(1) <= clk;
  adva  <= '0';
  xft   <= '1';
  zza   <= '0';
  xlbo  <= '1';

  process (r, din, zd, zdp) is
    variable v    : latch_t;
    variable dv   : sram_out_t;
    variable zav  : std_logic_vector(19 downto 0);
    variable zdv  : std_logic_vector(31 downto 0);
    variable zdpv : std_logic_vector(3 downto 0);
    variable xwav : std_logic;
  begin

    v    := r;
    dv   := (data => (others => '-'));
    zav  := (others => '0');
    zdv  := (others => '0');
    zdpv := (others => '0');
    xwav := '1';

    -- stage 0
    v.we0   := din.we;
    v.addr0 := std_logic_vector(din.addr);
    v.data0 := std_logic_vector(din.data);

    -- stage 1
    zav     := r.addr0;
    xwav    := not r.we0;
    v.we1   := r.we0;
    v.data1 := r.data0;

    -- stage 2
    v.we2   := r.we1;
    v.data2 := r.data1;

    -- stage 3
    if r.we2 = '1' then
      zdv     := r.data2;
      zdpv    := "0000";
      v.odata := (others => '-');
    else
      zdv     := (others => 'Z');
      zdpv    := (others => 'Z');
      v.odata := zd;
    end if;

    -- stage 4
    dv.data := unsigned(r.odata);

    rin  <= v;
    dout <= dv;
    za   <= zav;
    zd   <= zdv;
    zdp  <= zdpv;
    xwa  <= xwav;

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
