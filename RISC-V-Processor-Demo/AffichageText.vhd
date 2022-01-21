-- ECE Paris / SECAPEM
-- Affichage Texte Soutenance

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- ENTITY
entity AffichageText is
	port (
			ATclock : in std_logic;
			ATreset : in std_logic;
			disp0, disp1, disp2, disp3, disp4, disp5 : out std_logic_vector(7 downto 0)
		);
end entity;

architecture archi of AffichageText is

component Compteur7seg is
	port (
			-- INPUTS
			CPTclock : in std_logic;
			CPTreset : in std_logic;
			-- OUTPUT
			CPTclockout : out std_logic
		);
end component;

-- SOUTENANCE PFE - 03-02-2022 - 11h15

signal SIGoutputcptAT : std_logic_vector(5 downto 0);
signal SIGclockoutCPT : std_logic;

begin

p0 : process(SIGclockoutCPT, resetAT)
begin
	if resetAT ='1' or SIGoutputcptAT > "101000" then
		SIGoutputcptAT <= (others =>'0');
	else
		if rising_edge(SIGclockoutCPT) then
			SIGoutputcptAT <= std_logic_vector(unsigned(SIGoutputcptAT)+1);
		else
			SIGoutputcptAT <= SIGoutputcptAT;
		end if;
	end if;
end process;

disp0 <=	"01001001" when SIGoutputcptAT = "000001" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000010" else -- code du "O"
		"11000111" when SIGoutputcptAT = "000011" else -- code du "U"
		"11100001" when SIGoutputcptAT = "000100" else -- code du "T"
		"01100001" when SIGoutputcptAT = "000101" else -- code du "E"
		"11010101" when SIGoutputcptAT = "000110" else -- code du "N"
		"00010001" when SIGoutputcptAT = "000111" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001000" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001001" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001010" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001011" else -- code du " "
		"00110001" when SIGoutputcptAT = "001100" else -- code du "P"
		"01110001" when SIGoutputcptAT = "001101" else -- code du "F"
		"01100001" when SIGoutputcptAT = "001110" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001111" else -- code du " "
		"11111101" when SIGoutputcptAT = "010000" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010001" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010010" else -- code du "3"
		"11111101" when SIGoutputcptAT = "010011" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010100" else -- code du "0"
		"00100101" when SIGoutputcptAT = "010101" else -- code du "2"
		"11111101" when SIGoutputcptAT = "010110" else -- code du "-"
		"00100101" when SIGoutputcptAT = "010111" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011000" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011001" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011010" else -- code du "2"
		"11111111" when SIGoutputcptAT = "011011" else -- code du " "
		"11111101" when SIGoutputcptAT = "011100" else -- code du "-"
		"11111111" when SIGoutputcptAT = "011101" else -- code du " "
		"10011111" when SIGoutputcptAT = "011110" else -- code du "1"
		"10011111" when SIGoutputcptAT = "011111" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100000" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100001" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100010" else -- code du "5"
		"11111111";

disp1 <= 	"01001001" when SIGoutputcptAT = "000010" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000011" else -- code du "O"
		"11000111" when SIGoutputcptAT = "000100" else -- code du "U"
		"11100001" when SIGoutputcptAT = "000101" else -- code du "T"
		"01100001" when SIGoutputcptAT = "000110" else -- code du "E"
		"11010101" when SIGoutputcptAT = "000111" else -- code du "N"
		"00010001" when SIGoutputcptAT = "001000" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001001" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001010" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001011" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001100" else -- code du " "
		"00110001" when SIGoutputcptAT = "001101" else -- code du "P"
		"01110001" when SIGoutputcptAT = "001110" else -- code du "F"
		"01100001" when SIGoutputcptAT = "001111" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010000" else -- code du " "
		"11111101" when SIGoutputcptAT = "010001" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010010" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010011" else -- code du "3"
		"11111101" when SIGoutputcptAT = "010100" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010101" else -- code du "0"
		"00100101" when SIGoutputcptAT = "010110" else -- code du "2"
		"11111101" when SIGoutputcptAT = "010111" else -- code du "-"
		"00100101" when SIGoutputcptAT = "011000" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011001" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011010" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011011" else -- code du "2"
		"11111111" when SIGoutputcptAT = "011100" else -- code du " "
		"11111101" when SIGoutputcptAT = "011101" else -- code du "-"
		"11111111" when SIGoutputcptAT = "011110" else -- code du " "
		"10011111" when SIGoutputcptAT = "011111" else -- code du "1"
		"10011111" when SIGoutputcptAT = "100000" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100001" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100010" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100011" else -- code du "5"
		"11111111";

disp2 <= 	"01001001" when SIGoutputcptAT = "000011" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000100" else -- code du "O"
		"11000111" when SIGoutputcptAT = "000101" else -- code du "U"
		"11100001" when SIGoutputcptAT = "000110" else -- code du "T"
		"01100001" when SIGoutputcptAT = "000111" else -- code du "E"
		"11010101" when SIGoutputcptAT = "001000" else -- code du "N"
		"00010001" when SIGoutputcptAT = "001001" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001010" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001011" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001100" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001101" else -- code du " "
		"00110001" when SIGoutputcptAT = "001110" else -- code du "P"
		"01110001" when SIGoutputcptAT = "001111" else -- code du "F"
		"01100001" when SIGoutputcptAT = "010000" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010001" else -- code du " "
		"11111101" when SIGoutputcptAT = "010010" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010011" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010100" else -- code du "3"
		"11111101" when SIGoutputcptAT = "010101" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010110" else -- code du "0"
		"00100101" when SIGoutputcptAT = "010111" else -- code du "2"
		"11111101" when SIGoutputcptAT = "011000" else -- code du "-"
		"00100101" when SIGoutputcptAT = "011001" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011010" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011011" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011100" else -- code du "2"
		"11111111" when SIGoutputcptAT = "011101" else -- code du " "
		"11111101" when SIGoutputcptAT = "011110" else -- code du "-"
		"11111111" when SIGoutputcptAT = "011111" else -- code du " "
		"10011111" when SIGoutputcptAT = "100000" else -- code du "1"
		"10011111" when SIGoutputcptAT = "100001" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100010" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100011" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100100" else -- code du "5"
		"11111111";

disp3 <= 	"01001001" when SIGoutputcptAT = "000100" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000101" else -- code du "O"
		"11000111" when SIGoutputcptAT = "000110" else -- code du "U"
		"11100001" when SIGoutputcptAT = "000111" else -- code du "T"
		"01100001" when SIGoutputcptAT = "001000" else -- code du "E"
		"11010101" when SIGoutputcptAT = "001001" else -- code du "N"
		"00010001" when SIGoutputcptAT = "001010" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001011" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001100" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001101" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001110" else -- code du " "
		"00110001" when SIGoutputcptAT = "001111" else -- code du "P"
		"01110001" when SIGoutputcptAT = "010000" else -- code du "F"
		"01100001" when SIGoutputcptAT = "010001" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010010" else -- code du " "
		"11111101" when SIGoutputcptAT = "010011" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010100" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010101" else -- code du "3"
		"11111101" when SIGoutputcptAT = "010110" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010111" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011000" else -- code du "2"
		"11111101" when SIGoutputcptAT = "011001" else -- code du "-"
		"00100101" when SIGoutputcptAT = "011010" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011011" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011100" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011101" else -- code du "2"
		"11111111" when SIGoutputcptAT = "011110" else -- code du " "
		"11111101" when SIGoutputcptAT = "011111" else -- code du "-"
		"11111111" when SIGoutputcptAT = "100000" else -- code du " "
		"10011111" when SIGoutputcptAT = "100001" else -- code du "1"
		"10011111" when SIGoutputcptAT = "100010" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100011" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100100" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100101" else -- code du "5"
		"11111111";

disp4 <= 	"01001001" when SIGoutputcptAT = "000101" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000110" else -- code du "O"
		"11000111" when SIGoutputcptAT = "000111" else -- code du "U"
		"11100001" when SIGoutputcptAT = "001000" else -- code du "T"
		"01100001" when SIGoutputcptAT = "001001" else -- code du "E"
		"11010101" when SIGoutputcptAT = "001010" else -- code du "N"
		"00010001" when SIGoutputcptAT = "001011" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001100" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001101" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001110" else -- code du "E"
		"11111111" when SIGoutputcptAT = "001111" else -- code du " "
		"00110001" when SIGoutputcptAT = "010000" else -- code du "P"
		"01110001" when SIGoutputcptAT = "010001" else -- code du "F"
		"01100001" when SIGoutputcptAT = "010010" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010011" else -- code du " "
		"11111101" when SIGoutputcptAT = "010100" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010101" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010110" else -- code du "3"
		"11111101" when SIGoutputcptAT = "010111" else -- code du "-"
		"00000011" when SIGoutputcptAT = "011000" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011001" else -- code du "2"
		"11111101" when SIGoutputcptAT = "011010" else -- code du "-"
		"00100101" when SIGoutputcptAT = "011011" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011100" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011101" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011110" else -- code du "2"
		"11111111" when SIGoutputcptAT = "011111" else -- code du " "
		"11111101" when SIGoutputcptAT = "100000" else -- code du "-"
		"11111111" when SIGoutputcptAT = "100001" else -- code du " "
		"10011111" when SIGoutputcptAT = "100010" else -- code du "1"
		"10011111" when SIGoutputcptAT = "100011" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100100" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100101" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100110" else -- code du "5"
		"11111111";

disp5 <= 	"01001001" when SIGoutputcptAT = "000110" else -- code du "S"
		"11000101" when SIGoutputcptAT = "000111" else -- code du "O"
		"11000111" when SIGoutputcptAT = "001000" else -- code du "U"
		"11100001" when SIGoutputcptAT = "001001" else -- code du "T"
		"01100001" when SIGoutputcptAT = "001010" else -- code du "E"
		"11010101" when SIGoutputcptAT = "001011" else -- code du "N"
		"00010001" when SIGoutputcptAT = "001100" else -- code du "A"
		"11010101" when SIGoutputcptAT = "001101" else -- code du "N"
		"01100011" when SIGoutputcptAT = "001110" else -- code du "C"
		"01100001" when SIGoutputcptAT = "001111" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010000" else -- code du " "
		"00110001" when SIGoutputcptAT = "010001" else -- code du "P"
		"01110001" when SIGoutputcptAT = "010010" else -- code du "F"
		"01100001" when SIGoutputcptAT = "010011" else -- code du "E"
		"11111111" when SIGoutputcptAT = "010100" else -- code du " "
		"11111101" when SIGoutputcptAT = "010101" else -- code du "-"
		"00000011" when SIGoutputcptAT = "010110" else -- code du "0"
		"00001101" when SIGoutputcptAT = "010111" else -- code du "3"
		"11111101" when SIGoutputcptAT = "011000" else -- code du "-"
		"00000011" when SIGoutputcptAT = "011001" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011010" else -- code du "2"
		"11111101" when SIGoutputcptAT = "011011" else -- code du "-"
		"00100101" when SIGoutputcptAT = "011100" else -- code du "2"
		"00000011" when SIGoutputcptAT = "011101" else -- code du "0"
		"00100101" when SIGoutputcptAT = "011110" else -- code du "2"
		"00100101" when SIGoutputcptAT = "011111" else -- code du "2"
		"11111111" when SIGoutputcptAT = "100000" else -- code du " "
		"11111101" when SIGoutputcptAT = "100001" else -- code du "-"
		"11111111" when SIGoutputcptAT = "100010" else -- code du " "
		"10011111" when SIGoutputcptAT = "100011" else -- code du "1"
		"10011111" when SIGoutputcptAT = "100100" else -- code du "1"
		"11010001" when SIGoutputcptAT = "100101" else -- code du "H"
		"10011111" when SIGoutputcptAT = "100110" else -- code du "1"
		"01001001" when SIGoutputcptAT = "100111" else -- code du "5"
		"11111111";
					
i1 : Compteur7seg 
port map(
	CPTclock => ATclock, 
	CPTreset => ATreset, 
	CPTclockout => SIGnewclkAT
);

end archi;
