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
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;

      a    : out std_logic;
      xcs  : out std_logic;
      xwr  : out std_logic;
      d    : out std_logic_vector(7 downto 0);

      din  : in  audio_in_t;
      dout : out audio_out_t);
  end component audio;

end package audio_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.audio_p.all;

entity audio is
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    din  : in  audio_in_t;
    dout : out audio_out_t;
    xwr  : out std_logic;
    xcs  : out std_logic;
    a    : out std_logic;
    d    : out std_logic_vector(7 downto 0));
end entity audio;

architecture behavior of audio is

  type latch_t is record
    addr : unsigned(3 downto 0);
    data : unsigned(7 downto 0);
    cnt  : integer range 0 to 12;
  end record latch_t;

  constant latch_init : latch_t := (
    addr => (others => '-'),
    data => (others => '-'),
    cnt  => 0);

  signal r, rin : latch_t := latch_init;

begin

  process (r, en, addr, data) is
    variable v  : latch_t;
    variable dv : audio_out_t;
  begin
    v     := r;
    v.cnt := r.cnt + 1;;

    case r.cnt is
      when 0 =>
        if en = 1 then
          v.cnt  := 1;
          v.addr := din.addr;
          v.data := din.data;
        end if;

        a   <= '1';
        xcs <= '1';
        xwr <= '1';
        d   <= (others => '-');
      when 1 =>
        a   <= '0';
        xcs <= '1';
        xwr <= '1';
        d   <= (others => '-');
      when 2 =>
        a   <= '0';
        xcs <= '0';
        xwr <= '0';
        d   <= "0000" & r.addr;
      when 3 =>
        a   <= '0';
        xcs <= '0';
        xwr <= '0';
        d   <= "0000" & r.addr;
      when 4 =>
        a   <= '0';
        xcs <= '0';
        xwr <= '0';
        d   <= "0000" & r.addr;
      when 5 =>
        a   <= '0';
        xcs <= '1';
        xwr <= '0';
        d   <= "0000" & r.addr;
      when 6 =>
        a   <= '1';
        xcs <= '1';
        xwr <= '1';
        d   <= (others => '-');
      when 7 =>
        a   <= '1';
        xcs <= '1';
        xwr <= '1';
        d   <= (others => '-');
      when 8 =>
        a   <= '1';
        xcs <= '1';
        xwr <= '1';
        d   <= (others => '-');
      when 9 =>
        a   <= '1';
        xcs <= '0';
        xwr <= '0';
        d   <= r.data;
      when 10 =>
        a   <= '1';
        xcs <= '0';
        xwr <= '0';
        d   <= r.data;
      when 11 =>
        a   <= '1';
        xcs <= '0';
        xwr <= '0';
        d   <= r.data;
      when 12 =>
        v.cnt := 0;

        a   <= '1';
        xcs <= '1';
        xwr <= '0';
        d   <= r.data;
    end case;

    if r.cnt = 0 then
      dout.busy <= '0';
    else
      dout.busy <= '1';
    end if;
    rin <= v;
  end process;

  process (clk, xrst) is
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture behavior;
