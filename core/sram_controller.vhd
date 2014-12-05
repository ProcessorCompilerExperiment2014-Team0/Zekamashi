library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zebius_type_p.all;

package zebius_sram_controller_p is

  subtype sram_data_t is unsigned(35 downto 0);
  subtype sram_addr_t is unsigned(21 downto 0);

  type sram_controller_in_t is record
    data : sram_data_t;
    addr : sram_addr_t;
    dir  : iodir_t;
  end record;

  type sram_controller_out_t is record
    data : sram_data_t;
  end record;

  component sram_controller is
    port (
      clk   : in  std_logic;

      zd    : inout std_logic_vector(31 downto 0);
      zdp   : inout std_logic_vector(3  downto 0);
      za    : out   std_logic_vector(19 downto 0);
      xe1   : out std_logic;
      e2a   : out std_logic;
      xe3   : out std_logic;
      xzbe  : out std_logic_vector(3 downto 0);
      xga   : out std_logic;
      xwa   : out std_logic;
      xzcke : out std_logic;
      zclkma: out std_logic_vector(1 downto 0);
      adva  : out std_logic;
      xft   : out std_logic;
      xlbo  : out std_logic;
      zza   : out std_logic;

      din   : in  sram_controller_in_t;
      dout  : out sram_controller_out_t);
  end component;

end zebius_sram_controller_p;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zebius_type_p.all;
use work.blockram_p.all;
use work.zebius_sram_controller_p.all;



entity sram_controller is
    port (
      clk   : in  std_logic;

      zd    : inout std_logic_vector(31 downto 0);
      zdp   : inout std_logic_vector(3  downto 0);
      za    : out   std_logic_vector(19 downto 0);
      xe1   : out std_logic;
      e2a   : out std_logic;
      xe3   : out std_logic;
      xzbe  : out std_logic_vector(3 downto 0);
      xga   : out std_logic;
      xwa   : out std_logic := '1';
      xzcke : out std_logic;
      zclkma: out std_logic_vector(1 downto 0);
      adva  : out std_logic;
      xft   : out std_logic;
      xlbo  : out std_logic;
      zza   : out std_logic;

      din   : in sram_controller_in_t;
      dout  : out sram_controller_out_t);
end sram_controller;


architecture implementation of sram_controller is

  signal bin : blockram_in_t := (
    en => '1',
    we => '0',
    addr => (others => '-'),
    data => (others => '-'));
  signal bout : blockram_out_t;

  type src_mem_t is (BRAM, SRAM);

  type ratch_t is record
    data1: sram_data_t;
    src1, src2: src_mem_t;
    dir1, dir2: iodir_t;
    word_align1, word_align2: boolean;
  end record;

  signal r : ratch_t := (
    data1 => (others => 'X'),
    src1 => BRAM,
    src2 => BRAM,
    dir1 => DIR_READ,
    dir2 => DIR_READ,
    word_align1 => false,
    word_align2 => false);


  function is_blockram_addr (addr : sram_addr_t)
    return boolean is
  begin
    return to_integer(shift_right(addr, 10)) = 0;
  end function;

begin

  bram1 : blockram port map (
    clk => clk,
    din => bin,
    dout => bout);

  bin.en <= '1';
  bin.we <= '0';
  bin.data <= (others => 'X');

  xe1   <= '0';
  e2a   <= '1';
  xe3   <= '0';
  xzbe   <= (others => '0');
  xga   <= '0';
  xzcke <= '0';
  zclkma(0) <= clk;
  zclkma(1) <= clk;
  adva  <= '0';
  xft   <= '0';
  zza   <= '0';
  xlbo  <= '1';

  process (clk)
    variable v: ratch_t;
    variable d: sram_data_t;
  begin
    if rising_edge(clk) then
      v := r;

      -- stage 1: decode input
      if din.addr(1) = '1' then
        v.word_align1 := true;
      else
        v.word_align1 := false;
      end if;

      if is_blockram_addr(din.addr) then
        assert din.dir = DIR_READ report "bram is read-only" severity warning;

        v.src1 := BRAM;
        v.dir1 := DIR_READ;
        bin.addr <= din.addr(9 downto 2);

        xwa <= '1';
      else

        v.src1 := SRAM;
        za <= std_logic_vector(din.addr(21 downto 2));

        case din.dir is
          when DIR_READ =>
            v.dir1 := DIR_READ;
            xwa <= '1';

          when DIR_WRITE =>
            v.dir1 := DIR_WRITE;
            v.data1 := din.data;
            xwa <= '0';
        end case;

      end if;

      -- stage 2: put data
      case r.src1 is
        when BRAM =>
          null;

        when SRAM =>

          case r.dir1 is
            when DIR_READ =>
              zd <= (others => 'Z');
              zdp <= (others => 'Z');

            when DIR_WRITE =>
              zd <= std_logic_vector(r.data1(31 downto 0));
              zdp <= std_logic_vector(r.data1(35 downto 32));
          end case;
      end case;

      -- stage 3: output read value

      case r.src1 is
        when BRAM =>
          d := "0000" & bout.data;

        when SRAM =>

          if r.dir2 = DIR_READ then
            d := unsigned(zdp & zd);
          end if;
      end case;

      if r.dir2 = DIR_READ then
        if r.word_align2 then
          dout.data <= x"00000" & d(31 downto 16);
        else
          dout.data <= d;
        end if;
      end if;


      v.src2 := r.src1;
      v.dir2 := r.dir1;
      v.word_align2 := r.word_align1;

      r <= v;
    end if;
  end process;

end implementation;
