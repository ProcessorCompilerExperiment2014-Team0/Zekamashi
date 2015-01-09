library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.loopback_p.all;

entity echo is

  port (
    mclk1 : in  std_logic;
    xrst  : in  std_logic;
    rs_rx    : in  std_logic;
    rs_tx    : out std_logic);

end entity echo;

architecture rtl of echo is

  constant wtime : unsigned(15 downto 0) := x"1adb";

  signal clk, iclk, dclk, iclkfd, clkfd: std_logic;
  signal rst: std_logic := '0';

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
      rst      => rst,
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

  doloopback : loopback
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rs_rx,
      tx   => rs_tx);

end architecture rtl;
