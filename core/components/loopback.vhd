library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package loopback_p is

  component loopback is
    generic (
      wtime : unsigned(15 downto 0));
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      rx   : in  std_logic;
      tx   : out std_logic);
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
    clk  : in  std_logic;
    xrst : in  std_logic;
    rx   : in  std_logic;
    tx   : out std_logic);

end entity loopback;

architecture behavior of loopback is

  signal idata, odata : unsigned(31 downto 0);
  signal uii : u232c_in_in_t;
  signal uio : u232c_in_out_t;
  signal uoi : u232c_out_in_t;
  signal uoo : u232c_out_out_t;

  type latch_t is record
    rd  : std_logic;
  end record latch_t;

  signal r, rin : latch_t := (rd => '0');

begin

  input : u232c_in
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rx,
      din  => uii,
      dout => uio);

  output : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => tx,
      din  => uoi,
      dout => uoo);

  process (r, rx, uio, uoo) is
    variable v : latch_t;
  begin
    v := r;

    -- input
    if uio.empty = '0' and uoo.busy = '0' then
      v.rd     := '1';
      uii.rden <= '1';
    else
      v.rd     := '0';
      uii.rden <= '0';
    end if;

    -- output
    if r.rd = '1' then
      uoi.go   <= '1';
      uoi.data <= uio.data;
    else
      uoi.go <= '0';
    end if;

    rin <= v;
  end process;

  process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= (rd => '0');
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
