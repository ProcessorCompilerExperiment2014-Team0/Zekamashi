-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package rxtx_p is

  component rxtx is
    generic (
      send_wtime : unsigned(15 downto 0);
      recv_wtime : unsigned(15 downto 0);
      i          : string;
      o          : string);
    port (
      clk : in  std_logic;
      rx  : out std_logic;
      tx  : in  std_logic;
      eof : out boolean);
  end component rxtx;

end package rxtx_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.u232c_in_p.all;
use work.u232c_out_p.all;
use work.rxtx_p.all;

entity rxtx is
  generic (
    send_wtime : unsigned(15 downto 0);
    recv_wtime : unsigned(15 downto 0);
    i : string;
    o : string);
  port (
    clk : in  std_logic;
    rx  : out std_logic := '1';
    tx  : in  std_logic;
    eof : out boolean);
end entity rxtx;

architecture simulation of rxtx is
  file ifile : text open read_mode is i;
  file ofile : text open write_mode is o;

  signal mkrxidx  : integer range -1 to 8 := -1;
  signal mkrxdata : std_logic_vector(7 downto 0);
  signal mkrxcnt  : unsigned(15 downto 0) := send_wtime;

  signal rdtxidx  : integer range -1 to 8 := -1;
  signal rdtxdata : std_logic_vector(7 downto 0);
  signal rdtxcnt  : unsigned(15 downto 0) := shift_right(recv_wtime, 1);

begin

  makerx : process (clk) is
    variable l : line;
    variable d : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      if mkrxcnt = 0 then
        case mkrxidx is
          when -1 =>
            if endfile(ifile) then
              eof <= true;
            else
              readline(ifile, l);
              hread(l, d);
              rx       <= '0';
              eof      <= false;
              mkrxdata <= d;
              mkrxidx  <= 0;
            end if;
          when 8 =>
            rx      <= '1';
            mkrxidx <= -1;
          when others =>
            rx      <= mkrxdata(mkrxidx);
            mkrxidx <= mkrxidx + 1;
        end case;

        mkrxcnt <= send_wtime;
      else
        mkrxcnt <= mkrxcnt - 1;
      end if;
    end if;
  end process makerx;

  readtx: process (clk) is
    variable l : line;
  begin
    if rising_edge(clk) then
      case rdtxidx is
        when -1 =>
          if tx = '0' then
            if rdtxcnt = 0 then
              rdtxidx <= 0;
              rdtxcnt <= recv_wtime;
            else
              rdtxcnt <= rdtxcnt - 1;
            end if;
          end if;

        when 8 =>
          if rdtxcnt = 0 then
            hwrite(l, rdtxdata);
            writeline(ofile, l);
            rdtxcnt <= shift_right(recv_wtime, 1);
            rdtxidx <= -1;
          else
            rdtxcnt <= rdtxcnt - 1;
          end if;

        when others =>
          if rdtxcnt = 0 then
            rdtxdata(rdtxidx) <= tx;
            rdtxcnt           <= recv_wtime;
            rdtxidx           <= rdtxidx + 1;
          else
            rdtxcnt <= rdtxcnt - 1;
          end if;
      end case;
    end if;
  end process readtx;

end architecture simulation;
