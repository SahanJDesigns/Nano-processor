library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8_Sim is
end Decoder_3_to_8_Sim;

architecture Behavioral of Decoder_3_to_8_Sim is
    component Decoder_3_to_8
        Port (
            I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal I_signal : STD_LOGIC_VECTOR (2 downto 0);
    signal EN_signal : STD_LOGIC;
    signal Y_signal : STD_LOGIC_VECTOR (7 downto 0);

begin

    UUT: Decoder_3_to_8 port map (
        I => I_signal,
        EN => EN_signal,
        Y => Y_signal
    );

    process
    begin

        I_signal <= "000";
        EN_signal <= '0';
        wait for 100 ns;
        
        EN_signal <= '1';
        I_signal <= "000";
        wait for 100 ns;
        
        I_signal <= "001";
        wait for 100 ns;
        
        I_signal <= "010";
        wait for 100 ns;
        
        I_signal <= "011";
        wait for 100 ns;
        
        I_signal <= "100";
        wait for 100 ns;
        
        I_signal <= "101";
        wait for 100 ns;
        
        I_signal <= "110";
        wait for 100 ns;
        
        I_signal <= "111";   
        wait;
    end process;

end Behavioral;