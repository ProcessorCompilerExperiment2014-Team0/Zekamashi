library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sramsim.all;
use work.zkms_core_p.all;
use work.zkms_mmu_p.all;
use work.zkms_u232c_in_p.all;
use work.zkms_u232c_out_p.all;

entity coretb is
end entity coretb;

architecture testbench of coretb is

  signal clk : std_logic;
  signal ci : zkms_core_in_t;
  signal co : zkms_core_out_t;

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

  core : zkms_core
    port map (
      clk => clk,
      ci  => ci,
      co  => co);

  instcache : zkms_instcache
    port map (
      din  => co.instcache,
      dout => ci.instcache);

  alu : zkms_alu
    port map (
      din  => co.alu,
      dout => ci.alu);

  mmu : zkms_mmu
    port map (
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

      din  => co.mmu,
      dout => ci.mmu);

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

end architecture testbench;
