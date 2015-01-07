-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package u232c_in_p is

  type u232c_in_in_t is record
    rden : std_logic;
  end record;

  type u232c_in_out_t is record
    empty : std_logic;
    data : unsigned(7 downto 0);
  end record;

  component u232c_in is

    generic (
      wtime : unsigned(15 downto 0) := x"1adb");
    port (
      clk  : in  std_logic;
      rx   : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);

  end component;

end package;

-------------------------------------------------------------------------------
-- Definition
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.inputbuf_p.all;
use work.u232c_in_p.all;

entity u232c_in is

  generic (
      wtime : unsigned(15 downto 0) := x"1adb");
    port (
      clk  : in  std_logic;
      rst  : in  std_logic;
      rx   : in  std_logic;
      din  : in  u232c_in_in_t;
      dout : out u232c_in_out_t);

end entity u232c_in;

architecture behavior of u232c_in is

  type latch_t is record
    recvbuf : unsigned(7 downto 0);
    idx     : integer range 0 to 9;
  end record latch_t;

  signal r, rin : latch_t;

begin

  process (r, rx, din) is
    variable v : latch_t;
  begin

    v := rin;

    -- fixme!!

  end process;

  process (clk, rst) is
  begin
    if rst = '1' then
      null;
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;


end architecture behavior;
