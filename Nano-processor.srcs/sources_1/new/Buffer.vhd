library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Delay is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Delay;

architecture Behavioral of Delay is
begin
    B(0) <= A(0) and '1';
    B(1) <= A(1) and '1';
    B(2) <= A(2) and '1';
    B(3) <= A(3) and '1';
end Behavioral;
