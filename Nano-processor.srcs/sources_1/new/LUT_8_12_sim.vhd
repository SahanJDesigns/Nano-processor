library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT_8_12_Sim is
--  Port ( );
end LUT_8_12_Sim;

architecture Behavioral of LUT_8_12_Sim is
    component  LUT_8_12
        Port (
                address : in STD_LOGIC_VECTOR (2 downto 0);
                data : out STD_LOGIC_VECTOR (11 downto 0)
         );
    end component;
    signal address : STD_LOGIC_VECTOR (2 downto 0);
    signal data : STD_LOGIC_VECTOR (11 downto 0);
    
begin
    UUT:LUT_8_12
    
    port map(
        address =>address,
        data=>data
    );    
    process
        begin
            address <= "000";            
            wait for 200 ns;
            
            address <= "111";            
            wait for 200 ns;
            
            address <= "101";          
            wait for 200 ns;
            
            address <= "110";            
            wait for 200 ns;
            
            address <= "011";
            
            wait;
        end process;       
end Behavioral;
