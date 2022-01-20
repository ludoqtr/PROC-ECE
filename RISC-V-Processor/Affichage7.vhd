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
		hexadigit : in std_logic_vector(3 downto 0);
		display : out std_logic_vector(0 to 7)
	);
end entity;

-- ARCHITECTURE
architecture archi of Affichage7 is
begin
		display <= "00000011" when hexadigit = "0000" else -- code du "0"
					  "10011111" when hexadigit = "0001" else -- code du "1"
					  "00100101" when hexadigit = "0010" else -- code du "2"
					  "00001101" when hexadigit = "0011" else -- code du "3"
					  "10011001" when hexadigit = "0100" else -- code du "4"
					  "01001001" when hexadigit = "0101" else -- code du "5"
					  "01000001" when hexadigit = "0110" else -- code du "6"
					  "00011111" when hexadigit = "0111" else -- code du "7"
					  "00000001" when hexadigit = "1000" else -- code du "8"
					  "00001001" when hexadigit = "1001" else -- code du "9"
					  "00010001" when hexadigit = "1010" else -- code du "A"
					  "11000001" when hexadigit = "1011" else -- code du "B"
					  "01100011" when hexadigit = "1100" else -- code du "C"
					  "10000101" when hexadigit = "1101" else -- code du "D"
					  "01100001" when hexadigit = "1110" else -- code du "E"
					  "01110001";										-- code du "F"		
end archi;