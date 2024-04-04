library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( PC_out : in STD_LOGIC_VECTOR (2 downto 0);
           d : in STD_LOGIC;
           Address_in : in STD_LOGIC_VECTOR (2 downto 0);
           J_Flag : in STD_LOGIC;
           Address_out : out STD_LOGIC_VECTOR (2 downto 0));
end ALU;

architecture Behavioral of ALU is
    component RCA_3 is
        Port (
            A    : in  STD_LOGIC_VECTOR(2 downto 0);
            B    : in  STD_LOGIC_VECTOR(2 downto 0);
            C_in : in  STD_LOGIC;
            S    : out STD_LOGIC_VECTOR(2 downto 0);
            C_out: out STD_LOGIC
        );
    end component;

begin


end Behavioral;
