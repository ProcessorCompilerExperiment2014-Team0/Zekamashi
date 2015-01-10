library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.u232c_out_p.all;

entity saysomething is

  port (
    mclk1 : in  std_logic;
    xrst  : in  std_logic;
    rs_rx    : in  std_logic;
    rs_tx    : out std_logic);

end entity saysomething;

architecture behavior of saysomething is

  constant wtime : unsigned(15 downto 0) := x"1adb";
  type hgoe is array (0 to 19) of unsigned(7 downto 0);
  constant str : hgoe := (
    x"67", x"6F", x"6F", x"64", x"20", x"6D", x"6F", x"72", x"6E", x"69", x"6E", x"67", x"2C", x"20", x"67", x"75", x"79", x"73", x"21", x"20");
  signal idx : integer range 0 to 19 := 0;
  signal cnt : integer range 0 to 127 := 127;

  signal clk, iclk, dclk, iclkfd, clkfd: std_logic;
  signal rst: std_logic := '0';

  signal ui : u232c_out_in_t;
  signal uo : u232c_out_out_t;

begin  

  ib: ibufg
    port map (
      i => mclk1,
      o => iclk);

  dcm : dcm_base
    generic map (
      clk_feedback          => "1X",
      duty_cycle_correction => true)
    port map (
      rst      => rst,
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

  bg: bufg port map (
    i => iclkfd,
    o => clkfd);

  ss: bufg port map (
    i => iclkfd,
    o => clk);

  output : u232c_out
    generic map (
      wtime => wtime)
    port map (
      clk  => clk,
      xrst => xrst,
      tx   => rs_tx,
      din  => ui,
      dout => uo);

  process (clk, xrst) is
  begin
    if xrst = '0' then
      cnt <= 127;
      idx <= 0;
    elsif rising_edge(clk) then
      if uo.busy = '0' and cnt /= 0 then
        ui.data <= str(idx);
        ui.go   <= '1';
        if idx = 19 then
          idx <= 0;
          cnt <= cnt - 1;
        else
          idx <= idx + 1;
        end if;
      else
        ui.go <= '0';
      end if;
    end if;
  end process;

end architecture behavior;
