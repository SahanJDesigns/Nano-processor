library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_Bank_Sim is
end Reg_Bank_Sim;

architecture Behavioral of Reg_Bank_Sim is
    component Reg_Bank
        Port ( Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               EN : in STD_LOGIC_VECTOR (2 downto 0);
               D : in STD_LOGIC_VECTOR (3 downto 0);
               Reg0_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg1_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg2_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg3_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg4_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg5_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg6_Data : out STD_LOGIC_VECTOR (3 downto 0);
               Reg7_Data : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Signals for testbench
    signal Clk : STD_LOGIC;
    signal Res : STD_LOGIC;
    signal EN : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal D : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Reg0_Data, Reg1_Data, Reg2_Data, Reg3_Data, Reg4_Data, Reg5_Data, Reg6_Data, Reg7_Data : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate the UUT
    UUT: Reg_Bank port map (
        Clk => Clk,
        Res => Res,
        EN => EN,
        D => D,
        Reg0_Data => Reg0_Data,
        Reg1_Data => Reg1_Data,
        Reg2_Data => Reg2_Data,
        Reg3_Data => Reg3_Data,
        Reg4_Data => Reg4_Data,
        Reg5_Data => Reg5_Data,
        Reg6_Data => Reg6_Data,
        Reg7_Data => Reg7_Data
    );

        
    -- Clock process
    process
    begin
        Clk <= '1';
        wait for 20 ns;
        Clk <= '0';
        wait for 20 ns;
    end process;

    process
    begin
 
        Res <= '0';
        EN <= "000";
        D <= "0000";
        wait for 100 ns;
        
        EN <= "001";
        D <= "0001";
        wait for 100 ns;
        
        EN <= "010";
        D <= "0010";
        wait for 100 ns;
        
        EN <= "011";
        D <= "0011";
        wait for 100 ns;
        
        EN <= "100";
        D <= "0100";
        wait for 100 ns;
        
        EN <= "101";
        D <= "0101";
        wait for 100 ns;
        
        EN <= "110";
        D <= "0110";
        wait for 100 ns;
        
        EN <= "111";
        D <= "0111";
        wait for 100 ns;
        
        EN <= "000";
        D <= "1000";
        wait for 100 ns;
        -- Reset everything
        Res <= '1';
        wait for 100 ns;
        Res <= '0';
        wait;
    end process;

end Behavioral;
