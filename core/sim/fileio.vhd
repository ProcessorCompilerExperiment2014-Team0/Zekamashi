library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fileio_p is

  type fileio_in_t is record
    rden : std_logic;
    wren : std_logic;
    data : unsigned(7 downto 0);
  end record fileio_in_t;

  type fileio_out_t is record
    data : unsigned(7 downto 0);
    eof  : std_logic;
  end record fileio_out_t;

  component fileio is
    generic (
      i     : string;
      o     : string);
    port (
      clk  : in  std_logic;
      din  : in  fileio_in_t;
      dout : out fileio_out_t);
  end component fileio;

end package fileio_p;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.fileio_p.all;

entity fileio is
  generic (
    i     : string;
    o     : string);
  port (
    clk  : in  std_logic;
    din  : in  fileio_in_t;
    dout : out fileio_out_t);
end entity fileio;

architecture behavior of fileio is
  file ifile : text open read_mode is i;
  file ofile : text open write_mode is o;
begin

  process (clk) is
    variable l : line;
    variable data : std_logic_vector(7 downto 0);
  begin
    if rising_edge(clk) then
      -- input
      if din.rden = '1' and not endfile(ifile) then
        readline(ifile, l);
        hread(l, data);
        dout.data <= unsigned(data);
      end if;
      -- output
      if din.wren = '1' then
        data := std_logic_vector(din.data);
        hwrite(l, data);
        writeline(ofile, l);
      end if;

      if endfile(ifile) then
        dout.eof <= '1';
      else
        dout.eof <= '0';
      end if;
    end if;
  end process;

end architecture behavior;
