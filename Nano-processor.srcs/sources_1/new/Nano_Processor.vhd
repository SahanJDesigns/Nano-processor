library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (3 downto 0);
           Zero_Flag: out STD_LOGIC;
           O_Flow : out STD_LOGIC
             );

end Nano_Processor;

architecture Behavioral of Nano_Processor is
    component Reg_Bank
        Port ( 
               Clk        : in STD_LOGIC;
               Res        : in STD_LOGIC;
               EN         : in STD_LOGIC_VECTOR (2 downto 0);
               D          : in STD_LOGIC_VECTOR (3 downto 0);
               Reg0_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg1_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg2_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg3_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg4_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg5_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg6_Data  : out STD_LOGIC_VECTOR (3 downto 0);
               Reg7_Data  : out STD_LOGIC_VECTOR (3 downto 0)
             );
    end component;
    
    component RCA_4
        Port (
           EN        : in  STD_LOGIC;
           A         : in  STD_LOGIC_VECTOR(3 downto 0);
           B         : in  STD_LOGIC_VECTOR(3 downto 0);
           M         : in  STD_LOGIC;
           Result         : out STD_LOGIC_VECTOR(3 downto 0);
           O_Flow     : out STD_LOGIC;
           Zero_Flag : out STD_LOGIC
      );
    end component;
    
    component Program_Counter
        Port ( Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (2 downto 0);
               M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component RCA_3
        Port (
        A    : in  STD_LOGIC_VECTOR(2 downto 0);
        B    : in  STD_LOGIC_VECTOR(2 downto 0);
        C_in : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR(2 downto 0);
        C_out: out STD_LOGIC
      );
    end component;
    
    component Program_Rom
        Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
               data : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component Mux_8_to_1
        Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
               D0,D1,D2,D3,D4,D5,D6,D7 : in STD_LOGIC_VECTOR (3 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Instruction_Decoder
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
               Reg_C_Jump: in STD_LOGIC_VECTOR (3 downto 0);
               Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
               Load_Sel : out STD_LOGIC;
               Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
               Reg_Sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
               Add_Sub_Sel : out STD_LOGIC;
               Jmp_AD: out STD_LOGIC_VECTOR (2 downto 0);
               Jmp_Flag: out STD_LOGIC
        );
    end component;
    
    component Bit_4_MUX_2_to_1
        Port (
            A    : in  STD_LOGIC_VECTOR (3 downto 0);
            B    : in  STD_LOGIC_VECTOR (3 downto 0);
            JMP  : in  STD_LOGIC;
            C_out: out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component Bit_3_MUX_2_to_1
        Port (
            A    : in  STD_LOGIC_VECTOR (2 downto 0);
            B    : in  STD_LOGIC_VECTOR (2 downto 0);
            JMP  : in  STD_LOGIC;
            C_out: out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;
    
    component Reset_Trigger
      port (
      Clk       : in  std_logic;
      reset  : in  std_logic;
      trigger   : out std_logic
    );
    end component;
    
    component Slow_Clk
      Port (
        Pause : in STD_LOGIC;
        Res:in STD_LOGIC;
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
      );
      end component;
    
    signal Slow_Clk_Out_bar : STD_LOGIC;
       
    signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0); 
    signal Register_Enable : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Select : STD_LOGIC;
    signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_Sel_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel_1 : STD_LOGIC_VECTOR (2 downto 0);
    signal Add_Sub_Sel : STD_LOGIC;
    signal Jmp_AD: STD_LOGIC_VECTOR (2 downto 0);
    signal Jmp_Flag:STD_LOGIC;
    
    signal Data_Bus : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg0_Data, Reg1_Data, Reg2_Data, Reg3_Data, Reg4_Data, Reg5_Data, Reg6_Data, Reg7_Data : STD_LOGIC_VECTOR (3 downto 0); -- Signals for Reg_Bank
    
    signal A_RCA_4, B_RCA_4 : STD_LOGIC_VECTOR (3 downto 0); -- Signals for RCA_4
    signal S_RCA_4 : STD_LOGIC_VECTOR (3 downto 0);
    
    signal Address_PC : STD_LOGIC_VECTOR (2 downto 0);
    signal M_Sel_PC : STD_LOGIC_VECTOR (2 downto 0); -- Signals for Program_Counter
    
    signal S_RCA_3 : STD_LOGIC_VECTOR (2 downto 0);
    signal C_out_RCA_3 : STD_LOGIC; -- Signals for RCA_3
      
    signal Reset_Trig : STD_LOGIC;
    signal Pause_Clk : STD_LOGIC;
    signal Slow_Clk_Out : STD_LOGIC;
    
    signal Add_Sub_EN : STD_LOGIC;
begin

    
   
    Slow_Clock_0:Slow_Clk
      Port map(
        Res => Res,
        pause => Pause_Clk,
        Clk_in => Clk,
        Clk_out => Slow_Clk_Out
      );
      
      
    Reset_Trigger_0:Reset_Trigger
        port map(
          Clk => Slow_Clk_Out,
          reset => Res,
          trigger =>Reset_Trig);
          
    Program_Rom_0:Program_Rom
        port map(
        address => M_Sel_PC,
        data => Instruction_Bus);
        
    Instruction_Decoder_0:Instruction_Decoder
        port map(
        Instruction_Bus => Instruction_Bus,
        Reg_C_Jump => A_RCA_4,
        Reg_EN => Register_Enable,
        Load_Sel => Load_Select,
        Immediate_Val => Immediate_Value,
        Reg_Sel_0 => Reg_Sel_0,
        Reg_Sel_1 => Reg_Sel_1,
        Add_Sub_Sel => Add_Sub_Sel,
        Jmp_AD => Jmp_AD,
        Jmp_Flag => Jmp_Flag
        );
    
    Reg_Bank_0: Reg_Bank
        port map(
        Clk => Slow_Clk_Out_bar,
        Res => Reset_Trig,
        EN =>Register_Enable,
        D => Data_Bus,--have to change
        Reg0_Data => Reg0_Data,
        Reg1_Data => Reg1_Data,
        Reg2_Data => Reg2_Data,
        Reg3_Data => Reg3_Data,
        Reg4_Data => Reg4_Data,
        Reg5_Data => Reg5_Data,
        Reg6_Data => Reg6_Data,
        Reg7_Data => Reg7_Data
        );
        
    RCA_4_0: RCA_4
        port map(
        EN => Add_Sub_EN,
        A => A_RCA_4,
        B => B_RCA_4,
        M => Add_Sub_Sel,
        Result => S_RCA_4,
        O_Flow => O_Flow,
        Zero_Flag => Zero_Flag
        );
        
    Program_Counter_0: Program_Counter
        port map(
        Clk => Slow_Clk_Out,
        Res => Reset_Trig,
        Address => Address_PC,
        M_Sel => M_Sel_PC
        );
        
    RCA_3_0: RCA_3
        port map(
        A => M_Sel_PC,
        B => "001",
        C_in => '0',
        S => S_RCA_3,
        C_out => C_out_RCA_3
        );
        
    Mux_8_to_12_0: Mux_8_to_1
        port map(
        S => Reg_Sel_0,
        D0 => Reg0_Data,
        D1 => Reg1_Data,
        D2 => Reg2_Data,
        D3 => Reg3_Data,
        D4 => Reg4_Data,
        D5 => Reg5_Data,
        D6 => Reg6_Data,
        D7 => Reg7_Data,
        EN => '1',
        Y => A_RCA_4
        );
    Mux_8_to_12_1: Mux_8_to_1
        port map(
         S => Reg_Sel_1,
         D0 => Reg0_Data,
         D1 => Reg1_Data,
         D2 => Reg2_Data,
         D3 => Reg3_Data,
         D4 => Reg4_Data,
         D5 => Reg5_Data,
         D6 => Reg6_Data,
         D7 => Reg7_Data,
         EN => '1',
         Y => B_RCA_4
        );
        
     Bit_4_MUX_2_to_1_0:Bit_4_MUX_2_to_1
       Port map (
           A => Immediate_Value,
           B => S_RCA_4,
           JMP => Load_Select,
           C_out => Data_Bus
       );
   
    Bit_3_MUX_2_to_1_0:Bit_3_MUX_2_to_1
       Port map(
           A =>  S_RCA_3,
           B =>  Jmp_AD,
           JMP => Jmp_Flag,
           C_out => Address_PC
       );
       
       Result <= Reg7_Data;
       Pause_Clk <= '1' when Instruction_Bus = "011101111111" else '0';
       Slow_Clk_Out_bar <= not(Slow_Clk_Out);
       Add_Sub_EN <= (not (Instruction_Bus(11)) or Instruction_Bus(10)) and Slow_Clk_Out;
end Behavioral;

