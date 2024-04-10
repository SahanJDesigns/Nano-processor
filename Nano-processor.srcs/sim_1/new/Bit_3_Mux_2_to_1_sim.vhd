library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_3_MUX_2_to_1_tb is
end Bit_3_MUX_2_to_1_tb;

architecture Behavioral of Bit_3_MUX_2_to_1_tb is
    signal A_tb, B_tb: STD_LOGIC_VECTOR (2 downto 0);
    signal JMP_tb: STD_LOGIC;
    signal C_out_tb: STD_LOGIC_VECTOR (2 downto 0);

    component Bit_3_MUX_2_to_1
        Port (
            A    : in  STD_LOGIC_VECTOR (2 downto 0);
            B    : in  STD_LOGIC_VECTOR (2 downto 0);
            JMP  : in  STD_LOGIC;
            C_out: out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

begin
    UUT: Bit_3_MUX_2_to_1 port map (A => A_tb, B => B_tb, JMP => JMP_tb, C_out => C_out_tb);

    -- Testbench stimulus process
    stim_proc: process
    begin
        A_tb <= "001"; -- Example input A
        B_tb <= "010"; -- Example input B
        JMP_tb <= '0'; -- Example control signal
        wait for 500 ns;
        JMP_tb <= '1'; -- Changing control signal
        wait for 500 ns;
        -- Add more stimuli as needed
        wait;
    end process;

end Behavioral;
