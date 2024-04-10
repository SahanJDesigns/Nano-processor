library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3_sim is
--  Port ( );
end RCA_3_sim;

architecture Behavioral of RCA_3_sim is
  COMPONENT RCA_3
    Port (
      A    : in  STD_LOGIC_VECTOR(2 downto 0);
      B    : in  STD_LOGIC_VECTOR(2 downto 0);
      C_in : in  STD_LOGIC;
      S    : out STD_LOGIC_VECTOR(2 downto 0);
      C_out: out STD_LOGIC
    );
  END COMPONENT;

  SIGNAL A0, A1, A2, B0, B1, B2, C_in : std_logic;
  SIGNAL S0, S1, S2, C_out : std_logic;
  
begin
  UUT: RCA_3 PORT MAP(
    A(0) => A0,
    A(1) => A1,
    A(2) => A2,
    B(0) => B0,
    B(1) => B1,
    B(2) => B2,
    C_in => C_in,
    S(0) => S0,
    S(1) => S1,
    S(2) => S2,
    C_out => C_out
  );

  process
  begin
    A0 <= '0';
    A1 <= '1';
    A2 <= '1';
    B0 <= '0';
    B1 <= '1';
    B2 <= '1';
    C_in <= '0';

    WAIT FOR 100 ns;

    A0 <= '0';
    A1 <= '0';
    A2 <= '1';
    B0 <= '1';
    B1 <= '0';
    B2 <= '1';
    
    WAIT FOR 100 ns;

    A0 <= '0';
    A1 <= '0';
    A2 <= '0';
    B0 <= '1';
    B1 <= '1';
    B2 <= '1';
    WAIT FOR 100 ns;

    A0 <= '1';
    A1 <= '0';
    A2 <= '1';
    B0 <= '0';
    B1 <= '1';
    B2 <= '0';
    WAIT FOR 100 ns;

    A0 <= '1';
    A1 <= '1';
    A2 <= '0';
    B0 <= '1';
    B1 <= '0';
    B2 <= '0';  
    WAIT FOR 100 ns;

    A0 <= '1';
    A1 <= '1';
    A2 <= '1';
    B0 <= '0';
    B1 <= '0';
    B2 <= '0';
    WAIT FOR 100 ns;

    A0 <= '1';
    A1 <= '1';
    A2 <= '0';
    B0 <= '1';
    B1 <= '1';
    B2 <= '0';
    WAIT FOR 100 ns;

    WAIT;
  end process;

end Behavioral;
