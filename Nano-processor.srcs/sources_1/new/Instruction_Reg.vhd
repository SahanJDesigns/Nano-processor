library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Reg is
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
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
end Instruction_Reg;

architecture Behavioral of Instruction_Reg is
    signal Reg_EN_Internal : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Sel_Internal : STD_LOGIC;
    signal Immediate_Val_Internal : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel_0_Internal : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel_1_Internal : STD_LOGIC_VECTOR (2 downto 0);
    signal Add_Sub_Sel_Internal : STD_LOGIC;
    signal Jmp_AD_Internal : STD_LOGIC_VECTOR (2 downto 0);
    signal Jmp_Flag_Internal : STD_LOGIC;
    
begin

    Reg_EN_Internal <= Instruction_Bus(8 downto 6);
    Load_Sel_Internal <= Instruction_Bus(11);
    Immediate_Val_Internal <= Instruction_Bus(6 downto 4);
    Reg_Sel_0_Internal <= Instruction_Bus(9 downto 7);
    Reg_Sel_1_Internal <= Instruction_Bus(6 downto 4);
    Add_Sub_Sel_Internal <= Instruction_Bus(11);
    Jmp_AD_Internal <= Reg_C_Jump;
    Jmp_Flag_Internal <= Instruction_Bus(10) and Reg_C_Jump(2);


    Reg_EN <= Reg_EN_Internal;
    Load_Sel <= Load_Sel_Internal;
    Immediate_Val <= Immediate_Val_Internal;
    Reg_Sel_0 <= Reg_Sel_0_Internal;
    Reg_Sel_1 <= Reg_Sel_1_Internal;
    Add_Sub_Sel <= Add_Sub_Sel_Internal;
    Jmp_AD <= Jmp_AD_Internal;
    Jmp_Flag <= Jmp_Flag_Internal;
    
end Behavioral;
