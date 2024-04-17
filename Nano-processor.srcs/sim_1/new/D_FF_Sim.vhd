library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_Sim is
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

  component D_FF
    Port (
      D    : in  STD_LOGIC;
      EN   : in  STD_LOGIC;
      Res  : in  STD_LOGIC;
      Clk  : in  STD_LOGIC;
      Q    : out STD_LOGIC
    );
  end component;

  signal D, EN, Res, Clk, Q : STD_LOGIC;

begin

  -- Instantiate the D_FF entity
  UUT: D_FF
    port map (
      D    => D,
      EN   => EN,
      Res  => Res,
      Clk  => Clk,
      Q    => Q
    );
    
    --Instantiate clk    
    process
        begin
            Clk <= '0';
            wait for 10 ns;
            Clk <= '1';
            wait for 10 ns;
        end process;
 
    --test with diffent input
    process
      begin
      
        D <= '1';
        EN <= '1';
        Res <= '0';
        wait for 100 ns;
        
        Res <= '1';
        wait for 100 ns;
        
        Res <= '0';
        D <= '1';
        wait for 100 ns;
        
        EN <= '0';
        D <= '0';
        wait for 100 ns;
        
        D <= '1';
        Res <= '1';
        wait;
        
  end process;

end Behavioral;
