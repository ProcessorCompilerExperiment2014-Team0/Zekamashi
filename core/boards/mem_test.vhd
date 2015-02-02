library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.datacache_p.all;
use work.mmu_p.all;
use work.sram_p.all;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

entity mem_test is

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


end entity mem_test;

architecture rtl of mem_test is

  constant wtime : unsigned(15 downto 0) := x"023D";

  signal clk, clk1, iclk, dclk, iclkfd, clkfd: std_logic;

  signal dcachei : datacache_in_t;
  signal dcacheo : datacache_out_t;
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

  ss: bufg port map (
    i => iclkfd,
    o => clk1);

  clkfd <= clk1;
  clk   <= clk1;

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

  mmui <= (addr => "1" & x"00003",
           data => x"00000061",
           en   => '1',
           we   => '1');

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
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rs_rx,
      din  => uii,
      dout => uio);

  u232c_out : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => rs_tx,
      din  => uoi,
      dout => uoo);

end architecture rtl;
