library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zebius_u232c_out_p is

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
      tx   : out std_logic;

      din  : in  u232c_out_in_t;
      dout : out u232c_out_out_t);
  end component;

end zebius_u232c_out_p;



library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library work;
use work.zebius_u232c_out_p.all;


entity u232c_out is
  generic (
    report_write : boolean;
    wtime: unsigned(15 downto 0) := x"1ADB");
  port (
    clk  : in  std_logic;
    tx   : out std_logic;

    din  : in  u232c_out_in_t;
    dout : out u232c_out_out_t);
end u232c_out;


architecture blackbox of u232c_out is

  type ratch_t is record
    -- buf
    buf : unsigned(7 downto 0);
    busy : std_logic;
    -- send
    countdown : unsigned(15 downto 0);
    sendbuf : unsigned(8 downto 0);
    state : unsigned(3 downto 0);
  end record;

  signal r, rin : ratch_t := (
    buf => (others => '1'),
    busy => '0',
    countdown => (others => '0'),
    sendbuf => (others => '1'),
    state => "1111");

  file ofile : text open write_mode is "output";
begin

  cobinational: process(r, din)
    variable v: ratch_t;
    variable d: std_logic_vector(7 downto 0);
    variable l: line;
  begin
    v := r;

    if din.go = '1' and v.busy = '0' then
      if report_write then
        d := std_logic_vector(din.data);
        hwrite(l, d);
        writeline(ofile, l);
      end if;

      v.buf := din.data;
      v.busy := '1';
    end if;

    dout.busy <= v.busy;

    rin <= v;
  end process;


  statemachine: process(clk)
    variable v : ratch_t;
  begin
    if rising_edge(clk) then
      v := rin;

      case v.state is
        when "1001" =>
          if v.countdown = 0 then
            if v.busy = '1' then
              v.sendbuf := v.buf & "0";
              v.state := v.state-1;
              v.countdown := wtime;
              v.busy := '0';
            end if;
          else
            v.countdown := v.countdown-1;
          end if;

        when others=>
          if v.countdown = 0 then
            v.sendbuf := "1" & v.sendbuf(8 downto 1);
            v.countdown := wtime;

            if v.state = "0000" then
              v.state := "1001";
            else
              v.state := v.state-1;
            end if;
          else
            v.countdown := v.countdown-1;
          end if;
      end case;

      tx <= v.sendbuf(0);
      r <= v;
    end if;
  end process;

end blackbox;
