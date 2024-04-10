library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_Counter_sim is
--  Port ( );
end Program_Counter_sim;

architecture Behavioral of Program_Counter_sim is
    component Program_Counter is
        Port ( Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (2 downto 0);
               M_Sel : out STD_LOGIC_VECTOR (2 downto 0)
             );
    end component;
    
    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC
              );
    end component;
        
    signal clk : STD_LOGIC;
    signal res : STD_LOGIC;
    signal address : STD_LOGIC_VECTOR(2 downto 0);
    signal m_sel : STD_LOGIC_VECTOR(2 downto 0);
    
begin
    UUT: Program_Counter 
        
    port map (
        Clk => clk,
        Res => res,
        Address => address,
        M_Sel => m_sel
    );

    process          
        begin
           clk <= '0';
           wait for 5 ns;
           clk <= '1';
           wait for 5 ns;
    end process;

    process
        begin
            res <= '1';
            address <= "000";
            wait for 10 ns;
            
            address <= "111";
            wait for 10 ns;
            
            res <= '0';
            wait for 10 ns;
            
            res <= '1';
            address <= "101";
            wait for 10 ns;
            
            address <= "110";
            wait for 10 ns;
            
    end process;

end Behavioral;
