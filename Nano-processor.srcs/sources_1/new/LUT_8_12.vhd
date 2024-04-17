library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR (11 downto 0);
    
        signal Program_Rom: rom_type := (
            "100000000000", --used to omit the first command because, in rare cases, it might not run 
            "100000000001", --MOV R0,01
            "100010000010", --MOV R1,02
            "100100000011", --MOV R2,03
            "000000010000", --ADD R0,R1
            "000000100000", --ADD R0,R2
            "001110000000", --ADD R7,R0 (Display R0)
            "011101111111"  --END           
        );
        
--        signal Program_Rom: rom_type := (
--                    "100000000000", --used to omit the first command because, in rare cases, it might not run 
--                    "100000000001", --MOV R0,01
--                    "100010001000", --MOV R1,02
--                    "010000010000", --SUB R0,R1,
--                    "001110000000", --ADD R7,R0 (Display R0)   
--                    "010010000000", --SUB R1,R0
--                    "001110000000", --ADD R7,R1 (Display R1)
--                    "011101111111" --END
--                );
                
--       signal Program_Rom: rom_type := (
--                            "100000000000", --used to omit the first command because, in rare cases, it might not run 
--                            "100000000001", --MOV R0,01
--                            "100010000010", --MOV R1,02
--                            "001110000000", --ADD R7,R0 (Display R7)
--                            "001110010000", --ADD R7,R1 (Display R7)
--                            "111100000011", --JZR R6,03
--                            "011101111111", --END     
--                            "001110000000"    
--                        );
        
begin
    data <= Program_Rom(to_integer(unsigned(address)));

end Behavioral;
