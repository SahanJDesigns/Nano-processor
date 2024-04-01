library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_Sim is
end Reg_Sim;

architecture Behavioral of Reg_Sim is

  component Reg
    Port (
      Clk : in STD_LOGIC;
      EN : in STD_LOGIC;
      Res : in STD_LOGIC;
      D : in STD_LOGIC_VECTOR(3 downto 0);
      Q : out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  signal Clk, EN, Res : STD_LOGIC;
  signal D, Q : STD_LOGIC_VECTOR(3 downto 0);

begin

  UUT: Reg
    port map (
      Clk => Clk,
      EN => EN,
      Res => Res,
      D => D,
      Q => Q
    );
--Instantiate clk    
   process
      begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
  end process;
     
  process
      begin
        EN <= '1';
        Res <= '0';
        D <= "0000";
        wait for 200 ns;
    
        D <= "1111";
        wait for 200 ns;
        
        D <= "0101";
        wait for 200 ns;
        
        Res <= '1';
        wait for 200 ns;
        wait;
  end process;

end Behavioral;
