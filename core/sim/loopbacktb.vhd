library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.loopback_p.all;
use work.rxtx_p.all;

entity loopbacktb is
end entity loopbacktb;

architecture behavior of loopbacktb is

  constant wtime_a : unsigned(15 downto 0) := x"1c06";
  constant wtime_b : unsigned(15 downto 0) := x"1adb";
  signal clk       : std_logic;
  signal xrst      : std_logic;
  signal rx        : std_logic;
  signal tx        : std_logic;

begin

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

  doloopback : loopback
    generic map (
      wtime => wtime_b)
    port map(
      clk  => clk,
      xrst => xrst,
      rx   => rx,
      tx   => tx);

  clockgen: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  xrst <= '1';

end architecture behavior;
