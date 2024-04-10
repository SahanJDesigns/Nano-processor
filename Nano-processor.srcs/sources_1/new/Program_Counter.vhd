library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
           
end Program_Counter;

architecture Behavioral of Program_Counter is
    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               EN: in STD_LOGIC;
               Q : out STD_LOGIC
               );
    end component;

begin
    D_FF_0 : D_FF
        port map (
            D => Address(0), 
            Clk => Clk, 
            Res => Res, 
            EN => '1',
            Q => M_Sel(0) 
        );
        
    D_FF_1 : D_FF
        port map (
             D => Address(1), 
             Clk => Clk, 
             Res => Res, 
             EN => '1',
             Q => M_Sel(1)
        );
        
    D_FF_2 : D_FF
        port map (
        D => Address(2), 
        Clk => Clk, 
        EN => '1',
        Res => Res, 
        Q => M_Sel(2)
        );
        

end Behavioral;
