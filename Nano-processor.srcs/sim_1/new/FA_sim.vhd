library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_sim is
--  Port ( );
end FA_sim;

architecture Behavioral of FA_sim is
    COMPONENT FA
        PORT(A,B,C_in:IN STD_LOGIC;
            C_out,S:OUT STD_LOGIC);
        END COMPONENT;
        
        SIGNAL A,B,C_in : std_logic;
        SIGNAL C_out,S: std_logic;
        
begin
    UUT:FA PORT MAP(
        A => A,
        B => B,
        C_in => C_in,
        C_out => C_out,
        S => S
    );
    
    process
        begin
            A <= '0';
            B <= '0';
            C_in <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '0';
            B <= '0';
            C_in <= '1';
            
            WAIT FOR 100 ns;
            
            A <= '0';
            B <= '1';
            C_in <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '0';
            B <= '1';
            C_in <= '1';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '0';
            C_in <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '0';
            C_in <= '1';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '1';
            C_in <= '0';
            
            WAIT FOR 100 ns;
            
            A <= '1';
            B <= '1';
            C_in <= '1';
            
            WAIT;
    end process;
end Behavioral;
