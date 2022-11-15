library ieee;
use ieee.std_logic_1164.all;

package custom_types is

        subtype bits2 is std_logic_vector(1 downto 0);
        subtype bits3 is std_logic_vector(2 downto 0);
        subtype bits4 is std_logic_vector(3 downto 0);
        subtype bits5 is std_logic_vector(4 downto 0);
        subtype bits8 is std_logic_vector(7 downto 0);
        subtype bits16 is std_logic_vector(15 downto 0);
        subtype bits32 is std_logic_vector(31 downto 0);
        subtype bits64 is std_logic_vector(63 downto 0);
        subtype bits128 is std_logic_vector(127 downto 0);
        subtype bits256 is std_logic_vector(255 downto 0);

end custom_types;