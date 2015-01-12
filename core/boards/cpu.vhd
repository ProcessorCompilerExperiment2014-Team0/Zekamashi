library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.alu_p.all;
use work.core_p.all;
use work.instcache_p.all;
use work.datacache_p.all;
use work.mmu_p.all;
use work.sram_p.all;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

entity cpu is

  port (
    mclk1 : in  std_logic;
    xrst  : in  std_logic;

    rs_rx : in  std_logic;
    rs_tx : out std_logic;

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
    zza    : out   std_logic);


end entity cpu;

architecture rtl of cpu is

  constant wtime : unsigned(15 downto 0) := x"023D";

  signal clk, iclk, dclk, iclkfd, clkfd: std_logic;

  signal alui    : alu_in_t;
  signal aluo    : alu_out_t;
  signal dcachei : datacache_in_t;
  signal dcacheo : datacache_out_t;
  signal icachei : instcache_in_t;
  signal icacheo : instcache_out_t;
  signal mmui    : mmu_in_t;
  signal mmuo    : mmu_out_t;
  signal srami   : sram_in_t;
  signal sramo   : sram_out_t;
  signal uii     : u232c_in_in_t;
  signal uio     : u232c_in_out_t;
  signal uoi     : u232c_out_in_t;
  signal uoo     : u232c_out_out_t;

begin

  ib: ibufg
    port map (
      i => mclk1,
      o => iclk);

  dcm : dcm_base
    generic map (
      clk_feedback          => "1X",
      duty_cycle_correction => true)
    port map (
      rst      => not xrst,
      clkin    => iclk,
      clkfb    => clkfd,
      clk0     => iclkfd,
      clk90    => open,
      clk180   => open,
      clk270   => open,
      clk2x    => open,
      clk2x180 => open,
      clkdv    => open,
      clkfx    => open,
      clkfx180 => open);

  bg: bufg port map (
    i => iclkfd,
    o => clkfd);

  ss: bufg port map (
    i => iclkfd,
    o => clk);

    corec : core
    port map (
      clk     => clk,
      xrst    => xrst,
      icachei => icachei,
      icacheo => icacheo,
      alui    => alui,
      aluo    => aluo,
      mmui    => mmui,
      mmuo    => mmuo);

  instcachec : instcache
    port map (
      clk  => clk,
      din  => icachei,
      dout => icacheo);

  aluc : alu
    port map (
      din  => alui,
      dout => aluo);

  mmuc : mmu
    port map (
      clk    => clk,
      xrst   => xrst,
      uii    => uii,
      uio    => uio,
      uoi    => uoi,
      uoo    => uoo,
      cachei => dcachei,
      cacheo => dcacheo,
      din    => mmui,
      dout   => mmuo);

  datacachec : datacache
    port map (
      clk   => clk,
      xrst  => xrst,
      srami => srami,
      sramo => sramo,
      din   => dcachei,
      dout  => dcacheo);

  sramc : sram
    port map (
      clk    => clk,
      xrst   => xrst,
      zd     => zd,
      zdp    => zdp,
      za     => za,
      xe1    => xe1,
      e2a    => e2a,
      xe3    => xe3,
      xzbe   => xzbe,
      xga    => xga,
      xwa    => xwa,
      xzcke  => xzcke,
      zclkma => zclkma,
      adva   => adva,
      xft    => xft,
      xlbo   => xlbo,
      zza    => zza,
      din    => srami,
      dout   => sramo);

  u232c_in : u232c_in
    generic map (
      wtime => x"023D")
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rs_rx,
      din  => uii,
      dout => uio);

  u232c_out : u232c_out
    generic map (
      wtime => x"023D")
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => rs_tx,
      din  => uoi,
      dout => uoo);

end architecture rtl;
