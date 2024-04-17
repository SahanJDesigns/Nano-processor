library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
  Port (
    EN        : in  STD_LOGIC;
    A         : in  STD_LOGIC_VECTOR(3 downto 0);
    B         : in  STD_LOGIC_VECTOR(3 downto 0);
    M         : in  STD_LOGIC;
    Result    : out STD_LOGIC_VECTOR(3 downto 0);
    O_Flow    : out STD_LOGIC;
    Zero_Flag : out STD_LOGIC
  );
end RCA_4;

architecture Behavioral of RCA_4 is
  component FA
    port (
      A    : in  STD_LOGIC;
      B    : in  STD_LOGIC;
      C_in : in  STD_LOGIC;
      S    : out STD_LOGIC;
      C_out: out STD_LOGIC
    );
  end component;

  SIGNAL C0,C1,C2,C3 : STD_LOGIC;
  SIGNAL XB0,XB1,XB2,XB3,Xout : STD_LOGIC;
  SIGNAL S  : STD_LOGIC_VECTOR(3 downto 0);
begin

  FA_0 : FA port map (
    A     => A(0),
    B     => XB0,
    C_in  => M,
    S     => S(0),
    C_Out => C0
  );

  FA_1 : FA port map (
    A     => A(1),
    B     => XB1,
    C_in  => C0,
    S     => S(1),
    C_Out => C1
  );

  FA_2 : FA port map (
    A     => A(2),
    B     => XB2,
    C_in  => C1,
    S     => S(2),
    C_Out => C2
  );

  FA_3 : FA port map (
    A     => A(3),
    B     => XB3,
    C_in  => C2,
    S     => S(3),
    C_Out => C3
  );
  

  Xb0<= B(0) XOR M;
  Xb1<= B(1) XOR M;
  Xb2<= B(2) XOR M;
  Xb3<= B(3) XOR M;
  
  Result(0) <= S(0) and EN;
  Result(1) <= S(1) and EN;
  Result(2) <= S(2) and EN;
  Result(3) <= S(3) and EN;
  
  O_Flow <= (C3 Xor C2) and EN;
  Zero_Flag <= not(A(0) or A(1) or A(2) or A(3) or B(0) or B(1) or B(2) or B(3)) and EN;
  
end Behavioral;
