library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Slow_Clk is
  Port (
    Pause : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC
  );
end Slow_Clk;

architecture Behavioral of Slow_Clk is
  signal count : integer := 1;
  signal clk_status : std_logic := '0';
begin
  process (Clk_in)
  begin
    if rising_edge(Clk_in) then
        if (pause = '0' or Res ='1') then
          count <= count + 1;
          if count = 1 then
            clk_status <= not clk_status;
            Clk_out <= clk_status;
            count <= 1;
          end if;
        end if;
    end if;
  end process;
end Behavioral;