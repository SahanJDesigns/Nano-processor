library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_3_MUX_2_to_1 is
    Port (
        A    : in  STD_LOGIC_VECTOR (2 downto 0);
        B    : in  STD_LOGIC_VECTOR (2 downto 0);
        JMP  : in  STD_LOGIC;
        C_out: out STD_LOGIC_VECTOR (2 downto 0)
    );
end Bit_3_MUX_2_to_1;

architecture Behavioral of Bit_3_MUX_2_to_1 is

begin
    process(JMP, A, B)
    begin
        if JMP = '0' then
            C_out <= A;
        else
            C_out <= B;
        end if;
    end process;
    
end Behavioral;
