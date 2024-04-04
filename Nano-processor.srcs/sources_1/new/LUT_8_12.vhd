library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity LUT_8_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is
    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR (11 downto 0);
    
        signal Program_Rom: rom_type := (
            "100000000001",
            "100010000010", 
            "100100000011", 
            "000000010000", 
            "000000100000",
            "000010100000", 
            "010000000000", 
            "110010000010"  
        );
        
begin
    data <= Program_Rom(to_integer(unsigned(address)));

end Behavioral;
