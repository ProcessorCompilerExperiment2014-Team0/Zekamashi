library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package loopback_p is

  component loopback is
    generic (
      wtime : unsigned(15 downto 0));
    port (
      clk : in  std_logic;
      rst : in  std_logic;
      rx  : in  std_logic;
      tx  : out std_logic);
  end component loopback;

end package loopback_p;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

entity loopback is

  generic (
    wtime : unsigned(15 downto 0));
  port (
    clk : in  std_logic;
    rst : in  std_logic;
    rx  : in  std_logic;
    tx  : out std_logic);

end entity loopback;

architecture behavior of loopback is

  signal idata, odata : unsigned(31 downto 0);
  signal uii : u232c_in_in_t;
  signal uio : u232c_in_out_t;
  signal uoi : u232c_out_in_t;
  signal uoo : u232c_out_out_t;

  signal rd  : std_logic := '0';
  signal buf : unsigned(7 downto 0);

begin

  input : u232c_in
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      rx   => rx,
      din  => uii,
      dout => uio);

  output : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      tx   => tx,
      din  => uoi,
      dout => uoo);

  process (clk, rst) is
  begin
    if rising_edge(clk) then
      -- input
      if uio.empty = '0' then
        rd       <= '1';
        uii.rden <= '1';
      else
        rd       <= '0';
        uii.rden <= '0';
      end if;

      -- output
      if rd = '1' then
        assert uoo.busy = '1' report "poyo" severity error;
        uoi.go   <= '1';
        uoi.data <= uio.data;
      else
        uoi.go <= '0';
      end if;
    end if;
  end process;

end architecture behavior;
