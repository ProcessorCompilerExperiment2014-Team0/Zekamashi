-------------------------------------------------------------------------------
-- Audio Module
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Declaration
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package audio_p is

  component audio is
    port (
      en   : in  std_logic;
      addr : in  unsigned(3 downto 0);
      data : in  unsigned(7 donwto 0);
      busy : out std_logic;
      xwr  : out std_logic;
      xcs  : out std_logic;
      a    : out std_logic;
      d    : out std_logic_vector(7 downto 0));
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
  port (
    en   : in  std_logic;
    addr : in  unsigned(3 downto 0);
    data : in  unsigned(7 donwto 0);
    busy : out std_logic;
    xwr  : out std_logic;
    xcs  : out std_logic;
    a    : out std_logic;
    d    : out std_logic_vector(7 downto 0));
end entity audio;

architecture behavior of audio is

begin

  -- fixme!

end architecture behavior;
