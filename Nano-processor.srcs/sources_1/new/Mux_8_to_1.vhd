library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D0,D1,D2,D3,D4,D5,D6,D7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8 is
        Port (
            I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal Switch : STD_LOGIC_VECTOR (7 downto 0);
    signal MuxOutput : STD_LOGIC_VECTOR (3 downto 0);
begin
    Decode_3_to_8_0: Decoder_3_to_8
    port map (
        I => S,
        EN => EN,
        Y => Switch
    );

    process(Switch, D0, D1, D2, D3, D4, D5, D6, D7)
    begin
        if Switch = "00000001" then
            MuxOutput <= D0;
        elsif Switch = "00000010" then
            MuxOutput <= D1;
        elsif Switch = "00000100" then
            MuxOutput <= D2;
        elsif Switch = "00001000" then
            MuxOutput <= D3;
        elsif Switch = "00010000" then
            MuxOutput <= D4;
        elsif Switch = "00100000" then
            MuxOutput <= D5;
        elsif Switch = "01000000" then
            MuxOutput <= D6;
        elsif Switch = "10000000" then
            MuxOutput <= D7;
        else
            MuxOutput <= (others => '0'); -- Default case
        end if;
    end process;

    Y <= MuxOutput;
end Behavioral;
