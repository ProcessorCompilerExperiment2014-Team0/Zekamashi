-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package audiotest_p is

  component audiotest is
    generic (
      midi_wtime : unsigned(15 downto 0);
      midi_file  : string);
    port (
      clk       : in  std_logic;
      xrst      : in  std_logic;
      midi_rx   : out std_logic;
      audio_xrs : in  std_logic;
      audio_a   : in  std_logic;
      audio_xcs : in  std_logic;
      audio_xwr : in  std_logic;
      audio_d   : in  std_logic_vector(7 downto 0));
  end component audiotest;

end package audiotest_p;

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
use work.audiotest_p.all;

entity audiotest is
  generic (
    midi_wtime : unsigned(15 downto 0);
    midi_file  : string);
  port (
    clk       : in  std_logic;
    xrst      : in  std_logic;
    midi_rx   : out std_logic;
    audio_xrs : in  std_logic;
    audio_a   : in  std_logic;
    audio_xcs : in  std_logic;
    audio_xwr : in  std_logic;
    audio_d   : in  std_logic_vector(7 downto 0));
end entity audiotest;

architecture simulation of audiotest is
  file ifile : text open read_mode is midi_file;

  signal mkrxidx  : integer range -1 to 8 := -1;
  signal mkrxdata : std_logic_vector(7 downto 0);
  signal mkrxcnt  : unsigned(15 downto 0) := midi_wtime;

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
              null;
            else
              readline(ifile, l);
              hread(l, d);
              midi_rx  <= '0';
              mkrxdata <= d;
              mkrxidx  <= 0;
            end if;
          when 8 =>
            midi_rx <= '1';
            mkrxidx <= -1;
          when others =>
            midi_rx <= mkrxdata(mkrxidx);
            mkrxidx <= mkrxidx + 1;
        end case;

        mkrxcnt <= midi_wtime;
      else
        mkrxcnt <= mkrxcnt - 1;
      end if;
    end if;
  end process makerx;

end architecture simulation;
