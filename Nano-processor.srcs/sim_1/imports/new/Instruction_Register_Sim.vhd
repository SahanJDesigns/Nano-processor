library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_TB is
end Instruction_Decoder_TB;

architecture TB of Instruction_Decoder_TB is
    component Instruction_Decoder is
        Port ( 
            Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
            Reg_C_Jump: in STD_LOGIC_VECTOR (2 downto 0);
            Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
            Load_Sel : out STD_LOGIC;
            Immediate_Val : out STD_LOGIC_VECTOR (2 downto 0);
            Reg_Sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
            Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
            Add_Sub_Sel : out STD_LOGIC;
            Jmp_AD: out STD_LOGIC_VECTOR (2 downto 0);
            Jmp_Flag: out STD_LOGIC
        );
    end component;

    signal Instruction_Bus_TB : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal Reg_C_Jump_TB: STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Reg_EN_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Sel_TB : STD_LOGIC;
    signal Immediate_Val_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel_0_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel_1_TB : STD_LOGIC_VECTOR (2 downto 0);
    signal Add_Sub_Sel_TB : STD_LOGIC;
    signal Jmp_AD_TB: STD_LOGIC_VECTOR (2 downto 0);
    signal Jmp_Flag_TB: STD_LOGIC;
begin
    UUT: Instruction_Decoder 
    port map ( 
        Instruction_Bus => Instruction_Bus_TB,
        Reg_C_Jump => Reg_C_Jump_TB,
        Reg_EN => Reg_EN_TB,
        Load_Sel => Load_Sel_TB,
        Immediate_Val => Immediate_Val_TB,
        Reg_Sel_0 => Reg_Sel_0_TB,
        Reg_Sel_1 => Reg_Sel_1_TB,
        Add_Sub_Sel => Add_Sub_Sel_TB,
        Jmp_AD => Jmp_AD_TB,
        Jmp_Flag => Jmp_Flag_TB
    );

    stimulus_process: process
    begin
        -- Provide stimulus here
        -- For example, you can change inputs over time
        Instruction_Bus_TB <= "010101010101";
        Reg_C_Jump_TB <= "111";
        wait for 500 ns;
        Instruction_Bus_TB <= "110011001100";
        Reg_C_Jump_TB <= "000";
        wait for 500 ns;
        -- Add more stimuli as needed
        -- Ensure to add sufficient wait times between stimuli
        wait;
    end process stimulus_process;
end TB;
