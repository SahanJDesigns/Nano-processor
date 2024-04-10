library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA_sim is
--  Port ( );
end HA_sim;

architecture Behavioral of HA_sim is
    COMPONENT HA
        PORT(A,B:IN STD_LOGIC;
            C,S:OUT STD_LOGIC);
        END COMPONENT;
    
    SIGNAL A,B : std_logic;
    SIGNAL C,S : std_logic;
    
begin
    UUT:HA PORT MAP(
        A => A,
        B => B,
        C => C,
        S => S
    );
    
    process
        begin
            A <= '0';
            B <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '0';
            B <= '1';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '1';
            
            WAIT;
    end process;
end Behavioral;
