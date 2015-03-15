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
      interval : integer);
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
  generic (
    interval : integer := 3);
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

  constant n_step   : integer                   := 7;
  constant tim_a    : unsigned(0 to n_step - 1) := "1000111";
  constant tim_cs   : unsigned(0 to n_step - 1) := "1001001";
  constant tim_wr   : unsigned(0 to n_step - 1) := "1001001";
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
      v.cnt := interval - 1;
      v.idx := r.idx + 1;;

      case r.cnt is
        when 0 =>
          if din.en = '1' then
            v.idx  := 1;
            v.addr := din.addr;
            v.data := din.data;
          end if;
        when n_step - 1 =>
          v.idx := 0;
        when others =>
          v.idx := r.idx + 1;
      end case;
    end if;

    a   <= tim_a(r.idx);
    xcs <= tim_xcs(r.idx);
    xwr <= tim_xwr(r.idx);
    if tim_addr(r.idx) = '1' then
      d <= "0000" & r.addr;
    elsif tim_data(r.idx) = '1' then
      d <= r.data;
    else
      d <= x"00";
    end if;

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
