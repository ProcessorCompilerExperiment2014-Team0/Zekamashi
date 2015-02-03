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
    buf   : unsigned(8 downto 0);
    count : unsigned(15 downto 0);
    state : integer range -1 to 9;
  end record;

  constant latch_init : latch_t := (
    buf   => (others => '1'),
    count => (others => '0'),
    state => -1);

  signal r : latch_t := latch_init;

begin

  dout.busy <= '1' when r.state /= -1 else '0';

  process (clk)
  begin
    if xrst = '0' then
      r <= latch_init;
    elsif rising_edge (clk) then
      case r.state is
        when -1 =>
          if din.go = '1' then
            r.buf   <= din.data & "0";
            r.count <= wtime;
            r.state <= 9;
          end if;
        when others =>
          if r.count = 0 then
            r.buf   <= "1" & r.buf(8 downto 1);
            r.count <= wtime;
            r.state <= r.state - 1;
          else
            r.count <= r.count - 1;
          end if;
      end case;
    end if;
  end process;

  tx <= r.buf(0);

end behavior;
