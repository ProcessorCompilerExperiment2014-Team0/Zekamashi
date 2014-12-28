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
      wtime: unsigned(15 downto 0) := x"1adb");
    port (
      clk : in std_logic;
      rx : in std_logic;
      din : in u232c_in_in_t;
      dout : out u232c_in_out_t);
  end component;
end package;
