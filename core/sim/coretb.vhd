library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.sramsim.all;
use work.alu_p.all;
use work.core_p.all;
use work.instcache_p.all;
use work.datacache_p.all;
use work.mmu_p.all;
use work.rxtx_p.all;
use work.sram_p.all;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

entity coretb is
end entity coretb;

architecture testbench of coretb is

  constant wtime_a : unsigned(15 downto 0) := x"0255";
  constant wtime_b : unsigned(15 downto 0) := x"023d";

  signal clk  : std_logic;
  signal xrst : std_logic;

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

  signal rx    : std_logic;
  signal tx    : std_logic;
  signal zd    : std_logic_vector(31 downto 0);
  signal zdp   : std_logic_vector(3  downto 0);
  signal za    : std_logic_vector(19 downto 0);
  signal xe1   : std_logic;
  signal e2a   : std_logic;
  signal xe3   : std_logic;
  signal xzbe  : std_logic_vector(3 downto 0);
  signal xga   : std_logic;
  signal xwa   : std_logic;
  signal xzcke : std_logic;
  signal zclkma: std_logic_vector(1 downto 0);
  signal adva  : std_logic;
  signal xft   : std_logic;
  signal xlbo  : std_logic;
  signal zza   : std_logic;

begin

  xrst <= '1';

  simulateio : rxtx
    generic map (
      send_wtime => wtime_a,
      recv_wtime => wtime_b,
      i          => "input.dat",
      o          => "output.dat")
    port map (
      clk => clk,
      rx  => rx,
      tx  => tx,
      eof => open);

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

  u232c_inc : u232c_in
    generic map (
      wtime => wtime_b)
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rx,
      din  => uii,
      dout => uio);

  u232c_outc : u232c_out
    generic map (
      wtime => wtime_b)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => tx,
      din  => uoi,
      dout => uoo);

  sram_unit0 : GS8160Z18
    generic map (
      report_read  => false,
      report_write => false)
    port map (
      a    => za,
      ck   => zclkma(0),
      xba  => xzbe(0),
      xbb  => xzbe(1),
      xw   => xwa,
      xe1  => xe1,
      e2   => e2a,
      xe3  => xe3,
      xg   => xga,
      adv  => adva,
      xcke => xzcke,
      dqa  => zd(7 downto 0),
      dqb  => zd(15 downto 8),
      dqpa => zdp(0),
      dqpb => zdp(1),
      zz   => zza,
      xft  => xft,
      xlbo => xlbo);

  sram_unit1 : GS8160Z18
    generic map (
      report_read  => false,
      report_write => false)
    port map (
      a    => za,
      ck   => zclkma(1),
      xba  => xzbe(2),
      xbb  => xzbe(3),
      xw   => xwa,
      xe1  => xe1,
      e2   => e2a,
      xe3  => xe3,
      xg   => xga,
      adv  => adva,
      xcke => xzcke,
      dqa  => zd(23 downto 16),
      dqb  => zd(31 downto 24),
      dqpa => zdp(2),
      dqpb => zdp(3),
      zz   => zza,
      xft  => xft,
      xlbo => xlbo);

  clockgen: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

end architecture testbench;
