library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.u232c_out_p.all;

entity u232c_out_test is

  port (
    mclk1 : in  std_logic;
    xrst  : in  std_logic;

    rs_rx : in  std_logic;
    rs_tx : out std_logic);


end entity u232c_out_test;

architecture rtl of u232c_out_test is

  constant wtime : unsigned(15 downto 0) := x"023D";

  signal clk, clk1, iclk, dclk, iclkfd, clkfd: std_logic;

  signal uoi     : u232c_out_in_t;
  signal uoo     : u232c_out_out_t;

begin

  ib: ibufg
    port map (
      i => mclk1,
      o => iclk);

  dcm : dcm_base
    port map (
      rst      => not xrst,
      clkin    => iclk,
      clkfb    => clkfd,
      clk0     => iclkfd,
      clk90    => open,
      clk180   => open,
      clk270   => open,
      clk2x    => open,
      clk2x180 => open,
      clkdv    => open,
      clkfx    => open,
      clkfx180 => open);

  ss: bufg port map (
    i => iclkfd,
    o => clk1);

  clkfd <= clk1;
  clk   <= clk1;

  u232c_out : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => rs_tx,
      din  => uoi,
      dout => uoo);

  uoi <= (data => x"61",
          go   => '1');

end architecture rtl;
