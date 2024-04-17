library ieee;
use ieee.std_logic_1164.all;

entity Reset_Trigger is
  port (
    Clk       : in  std_logic;   -- Clock input
    reset  : in  std_logic;   -- Reset input from the board
    trigger   : out std_logic    -- Reset trigger output
  );
end entity Reset_Trigger;

architecture Behavioral of Reset_Trigger is
  signal reset_triggered : boolean := false;  -- Flag to indicate if reset is triggered

begin

  process(Clk)
  begin
    if rising_edge(Clk) then
      -- Check if the reset input is asserted and if reset is not already triggered
      if reset = '1' or not reset_triggered then
        -- Set the trigger signal
        trigger <= '1';
        -- Set the flag to indicate reset is triggered
        reset_triggered <= true;
      else
        -- Reset the trigger signal
        trigger <= '0';
      end if;
    end if;
  end process;

end architecture Behavioral;
