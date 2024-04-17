library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor_TB is
end Nano_Processor_TB;

architecture Behavioral of Nano_Processor_TB is
    -- Component declaration for the unit under test
    component Nano_Processor
           Port ( Clk : in STD_LOGIC;
            Res : in STD_LOGIC;
            Result : out STD_LOGIC_VECTOR (3 downto 0);
            Zero_Flag: out STD_LOGIC;
            O_Flow : out STD_LOGIC

            );
    end component;
    signal Clk :STD_LOGIC;
    signal Res :STD_LOGIC;
    signal Result :STD_LOGIC_VECTOR (3 downto 0);

    signal Zero_Flag:STD_LOGIC;
    signal O_flow:STD_LOGIC;  
    

begin

 UUT: Nano_Processor port map(
    Clk => Clk,
    Res => Res,
    Result => Result,
    Zero_Flag => Zero_Flag,
    O_flow => O_flow
);


    -- Clock process
    Clk_Process: process
    begin
            Clk <= '0';
            wait for 10 ns;
            Clk<= '1';
            wait for 10 ns;
    end process Clk_Process;

    -- Reset process
    Res_Process: process
    begin
        Res <= '0'; -- Deassert reset
        wait for 800 ns;
        Res <= '1';
        wait for 100 ns;
        Res <= '0';
        wait;
        
    end process Res_Process;

end Behavioral;
