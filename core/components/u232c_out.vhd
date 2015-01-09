-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package u232c_out_p is

  type u232c_out_in_t is record
    data : unsigned (7 downto 0);
    go   : std_logic;
  end record;

  type u232c_out_out_t is record
    busy : std_logic;
  end record;

  component u232c_out
    generic (
      report_write : boolean := false;
      wtime : unsigned(15 downto 0));
    port (
      clk  : in  std_logic;
      xrst : in  std_logic;
      tx   : out std_logic;

      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component;

end u232c_out_p;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.u232c_out_p.all;

entity u232c_out is
  generic (
    report_write : boolean;
    wtime        : unsigned(15 downto 0) := x"1ADB");
  port (
    clk  : in  std_logic;
    xrst : in  std_logic;
    tx   : out std_logic;

    din  : in  u232c_out_in_t;
    dout : out u232c_out_out_t);
end u232c_out;

architecture behavior of u232c_out is

  type latch_t is record
    buf       : unsigned(7 downto 0);
    busy      : std_logic;
    countdown : unsigned(15 downto 0);
    sendbuf   : unsigned(8 downto 0);
    state     : integer range 0 to 9;
  end record;

  constant latch_init : latch_t := (
    buf       => (others => '1'),
    busy      => '0',
    countdown => (others => '0'),
    sendbuf   => (others => '1'),
    state     => 9);

  signal r, rin : latch_t := latch_init;

begin

  process(r, din)
    variable v: latch_t;

    variable d: std_logic_vector(7 downto 0);
  begin
    v  := r;

    if din.go = '1' and r.busy = '0' then
      v.buf  := din.data;
      v.busy := '1';
    end if;

    if r.countdown = to_unsigned(0, 32) then
      case r.state is
        when 9 =>
          if r.busy = '1' then
            v.sendbuf   := r.buf & "0";
            v.state     := v.state - 1;
            v.countdown := wtime;
            v.busy      := '0';
          end if;
        when others =>
          v.sendbuf   := "1" & r.sendbuf(8 downto 1);
          v.countdown := wtime;

          if r.state = 0 then
            v.state := 9;
          else
            v.state := r.state - 1;
          end if;
      end case;
    else
      v.countdown := r.countdown - 1;
    end if;

    rin  <= v;
    tx   <= r.sendbuf(0);
    dout <= (busy => v.busy);
  end process;

  process(clk, xrst)
    variable v : latch_t;
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end behavior;
