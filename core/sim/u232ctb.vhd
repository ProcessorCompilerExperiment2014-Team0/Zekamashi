library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.fileio_p.all;

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

  type latch_t is record
    rd       : boolean;
    wr       : boolean;
    readcnt  : integer;
    writecnt : integer;
  end record latch_t;

  signal r, rin : latch_t := (rd       => false,
                              wr       => false,
                              readcnt  => 0,
                              writecnt => 0);

  file infile  : text open read_mode is "input.dat";
  file outfile : text open write_mode is "output.dat";

  signal fi : fileio_in_t := (wren => '0',
                              rden => '0',
                              data => (others => '0'));
  signal fo : fileio_out_t;

begin

  io : fileio
    generic map (
      i => "input.dat",
      o => "output.dat")
    port map (
      clk  => clk,
      din  => fi,
      dout => fo);

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

  process (r, uoo, uio, fo) is
    variable v    : latch_t;
    variable l    : line;
    variable data : std_logic_vector(7 downto 0);
  begin
    v := r;

    -- input
    if uoo.busy = '0' and fo.eof = '0' then
      fi.rden   <= '1';
      v.readcnt := r.readcnt + 1;
      v.rd      := true;
    else
      fi.rden <= '0';
      v.rd    := false;
    end if;

    if r.rd then
      uoi.data <= fo.data;
      uoi.go   <= '1';
    else
      uoi.go <= '0';
    end if;

    -- output
    if uio.empty = '0' then
      v.wr     := true;
      uii.rden <= '1';
    else
      v.wr     := false;
      uii.rden <= '0';
    end if;

    if r.wr then
      fi.data    <= uio.data;
      fi.wren    <= '1';
      v.writecnt := r.writecnt + 1;
    else
      fi.wren <= '0';
    end if;

    rin <= v;
  end process;

  process (clk) is
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;

  clockgen: process
  begin
    if fo.eof = '1' and r.readcnt = r.writecnt then
      wait;
    else
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end if;
  end process;

end architecture behavior;
