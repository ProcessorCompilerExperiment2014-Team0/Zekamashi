library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.loopback_p.all;

entity u232ctb is
end entity u232ctb;

architecture behavior of u232ctb is

  constant wtime : unsigned(15 downto 0) := x"000f";
  signal clk     : std_logic;
  signal rst     : std_logic;
  signal uii     : u232c_in_in_t;
  signal uio     : u232c_in_out_t;
  signal uoi     : u232c_out_in_t;
  signal uoo     : u232c_out_out_t;
  signal tako    : std_logic;

  signal rd       : std_logic;
  signal rd1      : std_logic;
  signal fin      : boolean := false;
  signal readcnt  : integer := 0;
  signal writecnt : integer := 0;

begin

  makerx : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      tx   => tako,
      din  => uoi,
      dout => uoo);

  readtx : u232c_in
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      rx   => tako,
      din  => uii,
      dout => uio);

  process (clk) is
    variable l    : line;
    variable data : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      -- input
      if uoo.busy = '0' and not endfile(input) then
        readline(input, l);
        hread(l, data);
        readcnt <= readcnt + 1;

        uoi.data <= unsigned(data);
        uoi.go   <= '1';
      else
        uoi.go <= '0';
      end if;

      -- output
      if uio.empty = '0' then
        rd       <= '1';
        uii.rden <= '1';
      else
        rd       <= '0';
        uii.rden <= '0';
      end if;

      rd1 <= rd;

      if rd1 = '1' then
        hwrite(l, std_logic_vector(uio.data));
        writeline(output, l);
        writecnt <= writecnt + 1;
      end if;
    end if;
  end process;

  clockgen: process
  begin
    if endfile(input) and (readcnt = writecnt) then
      wait;
    else
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end if;
  end process;

end architecture behavior;
