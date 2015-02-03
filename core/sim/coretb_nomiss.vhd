library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.sramsim.all;
use work.alu_p.all;
use work.core_p.all;
use work.instcache_p.all;
use work.datacache_p.all;
use work.datacache_nomiss_p.all;
use work.mmu_p.all;
use work.regfile_p.all;
use work.rxtx_p.all;
use work.sram_p.all;
use work.u232c_in_p.all;
use work.u232c_out_p.all;

entity coretb_nomiss is
end entity coretb_nomiss;

architecture testbench of coretb_nomiss is

  constant wtime_a : unsigned(15 downto 0) := x"0255";
  constant wtime_b : unsigned(15 downto 0) := x"023d";

  signal clk  : std_logic;
  signal xrst : std_logic;

  signal iri     : regfile_in_t;
  signal iro     : regfile_out_t;
  signal fri     : regfile_in_t;
  signal fro     : regfile_out_t;
  signal alui    : alu_in_t;
  signal aluo    : alu_out_t;
  signal dcachei : datacache_in_t;
  signal dcacheo : datacache_out_t;
  signal icachei : instcache_in_t;
  signal icacheo : instcache_out_t;
  signal mmui    : mmu_in_t;
  signal mmuo    : mmu_out_t;
  signal srami   : sram_in_t;
  signal sramo   : sram_out_t;
  signal uii     : u232c_in_in_t;
  signal uio     : u232c_in_out_t;
  signal uoi     : u232c_out_in_t;
  signal uoo     : u232c_out_out_t;

  signal rx    : std_logic;
  signal tx    : std_logic;

  signal cnt : integer := 10;

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

  irc : regfile
    port map (
      clk  => clk,
      xrst => xrst,
      din  => iri,
      dout => iro);

  frc : regfile
    port map (
      clk  => clk,
      xrst => xrst,
      din  => fri,
      dout => fro);

  corec : core
    port map (
      clk     => clk,
      xrst    => xrst,
      iri     => iri,
      iro     => iro,
      fri     => fri,
      fro     => fro,
      icachei => icachei,
      icacheo => icacheo,
      alui    => alui,
      aluo    => aluo,
      mmui    => mmui,
      mmuo    => mmuo);

  instcachec : instcache
    port map (
      clk  => clk,
      din  => icachei,
      dout => icacheo);

  aluc : alu
    port map (
      din  => alui,
      dout => aluo);

  mmuc : mmu
    port map (
      clk    => clk,
      xrst   => xrst,
      uii    => uii,
      uio    => uio,
      uoi    => uoi,
      uoo    => uoo,
      cachei => dcachei,
      cacheo => dcacheo,
      din    => mmui,
      dout   => mmuo);

  datacachec : datacache_nomiss
    port map (
      clk   => clk,
      xrst  => xrst,
      din   => dcachei,
      dout  => dcacheo);

  u232c_inc : u232c_in
    generic map (
      wtime => wtime_b)
    port map (
      clk  => clk,
      xrst => xrst,
      rx   => rx,
      din  => uii,
      dout => uio);

  u232c_outc : u232c_out
    generic map (
      wtime => wtime_b)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => tx,
      din  => uoi,
      dout => uoo);

  clockgen: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  xrstgen : process (clk) is
  begin
    if rising_edge(clk) then
      if cnt = 0 then
        xrst <= '1';
      else
        xrst <= '0';
        cnt  <= cnt - 1;
      end if;
    end if;
  end process xrstgen;

end architecture testbench;
