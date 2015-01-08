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

entity loopbacktb is
end entity loopbacktb;

architecture testbench of loopbacktb is

  constant wtime : unsigned(15 downto 0) := x"1c06";
  signal clk     : std_logic;
  signal rst : std_logic := '0';
  signal rx, tx  : std_logic;
  signal cnt     : unsigned(15 downto 0) := (others => '0');
  signal uii     : u232c_in_in_t;
  signal uio     : u232c_in_out_t;
  signal uoi     : u232c_out_in_t;
  signal uoo     : u232c_out_out_t;

  signal rd : std_logic;

begin

  makerx : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      tx   => rx,
      din  => uoi,
      dout => uoo);

  readtx : u232c_in
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      rst  => rst,
      rx   => tx,
      din  => uii,
      dout => uio);

  doloopback: loopback
    generic map (
      wtime => x"1adb")
    port map(
      clk => clk,
      rst => rst,
      rx  => rx,
      tx  => tx);

  process (clk) is
    variable l    : line;
    variable data : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      -- input
      if cnt = 0 then
        assert uoo.busy = '0' report "makerx is busy" severity error;
        readline(input, l);
        hread(l, data);

        uoi.data <= unsigned(data);
        uoi.go   <= '1';
        cnt      <= wtime;
      else
        uoi.go <= '0';
        cnt    <= cnt - 1;
      end if;

      -- output
      if uio.empty = '0' then
        rd       <= '1';
        uii.rden <= '1';
      else
        rd       <= '0';
        uii.rden <= '0';
      end if;

      if rd = '1' then
        hwrite(l, std_logic_vector(uio.data));
        writeline(output, l);
      end if;
    end if;
  end process;

  clockgen: process
  begin
    if endfile(input) then
      wait;
    else
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end if;
  end process;

end architecture testbench;
