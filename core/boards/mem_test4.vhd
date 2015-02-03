library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.u232c_out_p.all;

entity mem_test4 is

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


end entity mem_test4;

architecture rtl of mem_test4 is

  constant wtime : unsigned(15 downto 0) := x"023D";

  signal clk, clk1, iclk, dclk, iclkfd, clkfd: std_logic;

  signal uoi : u232c_out_in_t;

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

  xe1       <= '0';
  e2a       <= '1';
  xe3       <= '0';
  xzbe      <= (others => '0');
  xga       <= '0';
  xzcke     <= '0';
  zclkma(0) <= clk;
  zclkma(1) <= clk;
  adva      <= '0';
  xft       <= '1';
  zza       <= '0';
  xlbo      <= '1';
  za        <= (others => '0');
  zd        <= (others => 'Z');
  zdp       <= (others => 'Z');
  xwa       <= '1';

  uoi <= (data => x"61",
          go   => '1');

  u232c_out : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => rs_tx,
      din  => uoi,
      dout => open);

end architecture rtl;
