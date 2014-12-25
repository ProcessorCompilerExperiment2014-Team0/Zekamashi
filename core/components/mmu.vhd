-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package zkms_mmu_p is

  type zkms_mmu_in_t is record
    addr : unsigned(20 downto 0);
    data : unsigned(31 downto 0);
    en   : std_logic;
    we   : std_logic;
  end record zkms_mmu_in_t;

  type zkms_mmu_out_t is record
    data : unsigned(31 downto 0);
    miss : std_logic;
  end record zkms_mmu_out_t;

  type zkms_mmu_io_in_t is record
    sin  : zkms_u232c_in_out_t;
    sout : zkms_u232c_out_out_t;
  end record zkms_mmu_io_in_t;

  type zkms_mmu_io_out_t is record
    sin  : zkms_u232c_in_in_t;
    sout : zkms_u232c_out_in_t;
  end record zkms_mmu_io_out_t;

  component zkms_mmu is
    port (
      clk    : in    std_logic;
      rst    : in    std_logic;
      zd     : inout std_logic_vector(31 downto 0);
      zdp    : inout std_logic_vector(3 downto 0);
      za     : out   std_logic_vector(19 downto 0);
      xe1    : out   std_logic;
      e2a    : out   std_logic;
      xe3    : out   std_logic;
      xzbe   : out   std_logic_vector(3 downto 0);
      xga    : out   std_logic;
      xwa    : out   std_logic;
      xzcke  : out   std_logic;
      zclkma : out   std_logic_vector(1 downto 0);
      adva   : out   std_logic;
      xft    : out   std_logic;
      xlbo   : out   std_logic;
      zza    : out   std_logic;
      sin    : in    zkms_mmu_io_in_t;
      sout   : out   zkms_mmu_io_out_t;

      din  : in  zkms_mmu_in_t;
      dout : out zkms_mmu_out_t);
  end component zkms_mmu;

end package zkms_mmu_p;

-------------------------------------------------------------------------------

-- Definition
-------------------------------------------------------------------------------

entity zkms_mmu is
  port (
    clk    : in    std_logic;
    rst    : in    std_logic;
    zd     : inout std_logic_vector(31 downto 0);
    zdp    : inout std_logic_vector(3 downto 0);
    za     : out   std_logic_vector(19 downto 0);
    xe1    : out   std_logic;
    e2a    : out   std_logic;
    xe3    : out   std_logic;
    xzbe   : out   std_logic_vector(3 downto 0);
    xga    : out   std_logic;
    xwa    : out   std_logic;
    xzcke  : out   std_logic;
    zclkma : out   std_logic_vector(1 downto 0);
    adva   : out   std_logic;
    xft    : out   std_logic;
    xlbo   : out   std_logic;
    zza    : out   std_logic;
    sin    : in    zkms_mmu_io_in_t;
    sout   : out   zkms_mmu_io_out_t;

    din  : in  zkms_mmu_in_t;
    dout : out zkms_mmu_out_t);
end entity zkms_mmu;

architecture behavior of zkms_mmu is

  type src_t is (SRC_DATA, SRC_SIN, SRC_NOPE);

  type latch_t is record
    src : src_t;
  end record latch_t;

  signal r, rin : latch_t;

begin

  process (din, r) is
    variable v  : latch_t;
    variable dv : zkms_mmu_out_t;
    variable sv : zkms_mmu_io_out_t;
  begin
    v := r;
    dv := (data => (others => '-'),
           miss => '0');
    sv := (sin  => (rden => '0'),
           sout => (data => (others => '-'),
                    go   => '0'));

    ---------------------------------------------------------------------------

    if din.en = '1' then
      if din.we = '1' then
        case din.addr is
          when x"10000" | x"10001" | x"10002"=>
            assert false report "cannot write to this address" severity error;
          when x"10003" =>
            sv.sout.data := din.data;
            sv.sout.go   := '1';
            v.src        := SRC_NOPE;
          when others => null;
        end case;
      else
        case din.addr is
          when x"10000" =>
            v.data := (0      => not sin.sin.empty,
                       others => '0');
            v.src := SRC_DATA;
          when x"10001" =>
            sv.sin.rden := '1';
            v.src := SRC_SIN;
          when x"10002" =>
            v.data := (0      => sin.sout.busy,
                       others => '0');
            v.src := SRC_DATA;
          when x"10003" =>
            assert false report "cannot read from this address" severity error;
          when others => null;
        end case;
      end if;
    end if;

    ---------------------------------------------------------------------------

    case r.src is
      when SRC_DATA =>
        dout.data <= r.data;
        dout.miss <= '0';
      when SRC_SIN =>
        dout.data <= sin.sin.data;
        dout.miss <= '0';
      when SRC_NOPE =>
        dout.data <= (others => '-');
        dout.miss <= '0';
      when others => null;
    end case;

    ---------------------------------------------------------------------------

    rin  <= v;
    dout <= dv;
    sout <= sv;
  end process;

  process (clk, rst) is
  begin
    if rst = '1' then
      r <= (src <= SRC_NOPE);
    elsif rising_edge(clk) then
      r <= rin;
    end if;
  end process;

end architecture zkms_mmu;
