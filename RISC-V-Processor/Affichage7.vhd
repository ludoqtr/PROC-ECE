-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Affichage 7 segment

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Affichage7 is
	port (
		-- INPUTS
		hexadigit : in std_logic_vector(5 downto 0);
		display : out std_logic_vector(0 to 7)
	);
end entity;

-- ARCHITECTURE
architecture archi of Affichage7 is
begin
		display <=	"00000011" when hexadigit = "000000" else -- code du "0"
				"10011111" when hexadigit = "000001" else -- code du "1"
			  	"00100101" when hexadigit = "000010" else -- code du "2"
				"00001101" when hexadigit = "000011" else -- code du "3"
				"10011001" when hexadigit = "000100" else -- code du "4"
				"01001001" when hexadigit = "000101" else -- code du "5"
				"01000001" when hexadigit = "000110" else -- code du "6"
				"00011111" when hexadigit = "000111" else -- code du "7"
				"00000001" when hexadigit = "001000" else -- code du "8"
				"00001001" when hexadigit = "001001" else -- code du "9"
				"00010001" when hexadigit = "001010" else -- code du "A"
				"11000001" when hexadigit = "001011" else -- code du "B"
				"01100011" when hexadigit = "001100" else -- code du "C"
				"10000101" when hexadigit = "001101" else -- code du "D"
				"01100001" when hexadigit = "001110" else -- code du "E"
				"01110001" when hexadigit = "001111" else -- code du "F"
				"01000011" when hexadigit = "010000" else -- code du "G"
				"11010001" when hexadigit = "010001" else -- code du "H"
			  	"11011111" when hexadigit = "010010" else -- code du "I"
				"10000111" when hexadigit = "010011" else -- code du "J"
				"01010001" when hexadigit = "010100" else -- code du "K"
				"11100011" when hexadigit = "010101" else -- code du "L"
				"01010101" when hexadigit = "010110" else -- code du "M"
				"11010101" when hexadigit = "010111" else -- code du "N"
				"11000101" when hexadigit = "011000" else -- code du "O"
				"00110001" when hexadigit = "011001" else -- code du "P"
				"00011001" when hexadigit = "011010" else -- code du "Q"
				"11110101" when hexadigit = "011011" else -- code du "R"
				"01001001" when hexadigit = "011100" else -- code du "S"
				"11100001" when hexadigit = "011101" else -- code du "T"
				"11000111" when hexadigit = "011110" else -- code du "U"
				"10101011" when hexadigit = "011111" else -- code du "V"
				"10101001" when hexadigit = "100000" else -- code du "W"
				"10010001" when hexadigit = "100001" else -- code du "X"
			  	"10001001" when hexadigit = "100010" else -- code du "Y"
				"00100101" when hexadigit = "100010" else -- code du "Z"
				"11111111" when hexadigit = "100011" else -- code du " "
				"11111110" when hexadigit = "100100" else -- code du "."
				"11111101" when hexadigit = "100101" else -- code du "-"
			  	"11101111" when hexadigit = "100110" else -- code du "_"
				"00111001" when hexadigit = "100111" else -- code du "°"
				"01101101"; 				  -- OUT OF BOUNDS !
end archi;
