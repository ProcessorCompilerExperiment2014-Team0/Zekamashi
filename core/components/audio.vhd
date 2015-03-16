-------------------------------------------------------------------------------
-- Audio Module
--  Warning: This module would work only under 66.6MHz
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package audio_p is

  type audio_in_t is record
    en   : std_logic;
    addr : unsigned(3 downto 0);
    data : unsigned(7 downto 0);
  end record audio_in_t;

  type audio_out_t is record
    busy : std_logic;
  end record audio_out_t;

  component audio is
    generic (
      report_write : boolean;
      report_file  : string;
      interval     : integer);
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;

      xrs : out std_logic;
      a   : out std_logic;
      xcs : out std_logic;
      xwr : out std_logic;
      d   : out std_logic_vector(7 downto 0);

      din  : in  audio_in_t;
      dout : out audio_out_t);
  end component audio;

end package audio_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.audio_p.all;

entity audio is
  generic (
      report_write : boolean;
      report_file  : string;
      interval     : integer := 3);
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    xrs  : out std_logic;
    a    : out std_logic;
    xcs  : out std_logic;
    xwr  : out std_logic;
    d    : out std_logic_vector(7 downto 0);
    din  : in  audio_in_t;
    dout : out audio_out_t);
end entity audio;

architecture behavior of audio is

  file ofile : text open write_mode is "report_file";

  constant n_step   : integer                   := 7;
  constant tim_a    : unsigned(0 to n_step - 1) := "1000111";
  constant tim_xcs  : unsigned(0 to n_step - 1) := "1001001";
  constant tim_xwr  : unsigned(0 to n_step - 1) := "1001001";
  constant tim_addr : unsigned(0 to n_step - 1) := "0010000";
  constant tim_data : unsigned(0 to n_step - 1) := "0000010";

  type latch_t is record
    addr : unsigned(3 downto 0);
    data : unsigned(7 downto 0);
    idx  : integer range 0 to n_step - 1;
    cnt  : integer range 0 to interval - 1;
  end record latch_t;

  constant latch_init : latch_t := (
    addr => (others => '-'),
    data => (others => '-'),
    idx  => 0,
    cnt  => 0);

  signal r, rin : latch_t := latch_init;

begin

  process (r, din) is
    variable v  : latch_t;
    variable dv : audio_out_t;
  begin
    v     := r;

    if r.cnt /= 0 then
      v.cnt := r.cnt - 1;
    else
      case r.idx is
        when 0 =>
          if din.en = '1' then
            v.idx  := 1;
            v.addr := din.addr;
            v.data := din.data;
            v.cnt  := interval - 1;
          end if;
        when n_step - 1 =>
          v.idx := 0;
          v.cnt := interval - 1;
        when others =>
          v.idx := r.idx + 1;
          v.cnt := interval - 1;
      end case;
    end if;

    a   <= tim_a(r.idx);
    xcs <= tim_xcs(r.idx);
    xwr <= tim_xwr(r.idx);
    if tim_addr(r.idx) = '1' then
      d <= std_logic_vector("0000" & r.addr);
    elsif tim_data(r.idx) = '1' then
      d <= std_logic_vector(r.data);
    else
      d <= x"00";
    end if;

    if r.idx = 0 then
      dout.busy <= '0';
    else
      dout.busy <= '1';
    end if;
    rin <= v;
  end process;

  process (clk, xrst) is
    variable l : line;
  begin
    if report_write and r.idx = 1 and r.cnt = interval - 1 then
      write(l, string'("addr:x"));
      hwrite(l, std_logic_vector("0000" & r.addr));
      write(l, string'(", data:x"));
      hwrite(l, std_logic_vector(r.data));
      writeline(ofile, l);
    end if;

    if xrst = '0' then
      r   <= latch_init;
      xrs <= '0';
    elsif rising_edge(clk) then
      r   <= rin;
      xrs <= '1';
    end if;
  end process;

end architecture behavior;
