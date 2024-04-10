library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3_tb is
end RCA_3_tb;

architecture behavior of RCA_3_tb is

  -- Component Declaration for RCA_3
  component RCA_3
    Port (
      A    : in  STD_LOGIC_VECTOR(2 downto 0);
      B    : in  STD_LOGIC_VECTOR(2 downto 0);
      C_in : in  STD_LOGIC;
      S    : out STD_LOGIC_VECTOR(2 downto 0);
      C_out: out STD_LOGIC
    );
  end component;

  -- Signals Declaration
  signal A_tb, B_tb       : STD_LOGIC_VECTOR(2 downto 0);
  signal C_in_tb          : STD_LOGIC;
  signal S_tb             : STD_LOGIC_VECTOR(2 downto 0);
  signal C_out_tb         : STD_LOGIC;

begin

  -- Instantiate the RCA_3 module
  UUT: RCA_3 port map (
    A     => A_tb,
    B     => B_tb,
    C_in  => C_in_tb,
    S     => S_tb,
    C_out => C_out_tb
  );

  -- Stimulus process
  stimulus_process: process
  begin
    -- Test case 1
    A_tb <= "001";
    B_tb <= "010";
    C_in_tb <= '0';
    wait for 100 ns;
    
    -- Test case 2
    A_tb <= "110";
    B_tb <= "011";
    C_in_tb <= '1';
    wait for 100 ns;
    
    -- Add more test cases as needed...

    wait;
  end process;

end behavior;
