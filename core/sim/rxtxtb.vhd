library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.loopback_p.all;
use work.rxtx_p.all;

entity rxtxtb is
end entity rxtxtb;

architecture behavior of rxtxtb is

  constant wtime_a : unsigned(15 downto 0) := x"1c06";
  constant wtime_b : unsigned(15 downto 0) := x"1adb";
  signal clk       : std_logic;
  signal xrst      : std_logic;
  signal rx        : std_logic;
  signal tx        : std_logic;

begin

  tx <= rx;

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

  clockgen: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

end architecture behavior;
