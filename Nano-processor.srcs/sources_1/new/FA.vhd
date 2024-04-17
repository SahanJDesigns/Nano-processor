
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
    component HA
    port(
    A: in std_logic;
    B: in std_logic;
    S: out std_logic;
    C: out std_logic);
    end component;
SIGNAL HA0_C, HA0_S,HA1_S,HA1_C: std_logic;     
begin
    HA_0: HA PORT MAP(
    A => A,
    B => B,
    C => HA0_C,
    S => HA0_S);
    HA_1: HA PORT MAP(
    A => HA0_S,
    B => C_in,
    C => HA1_C,
    S => HA1_S);
    
    c_out <= HA1_C OR HA0_C;
    S <= HA1_S;
end Behavioral;
