-- ECE Paris / SECAPEM
-- Compteur Affichage 7 segment

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- ENTITY
entity Compteur7seg is
	port (
			-- INPUTS
			CPTclock : in std_logic;
			CPTreset : in std_logic;
			-- OUTPUT
			CPTclockout : out std_logic
		);
end entity;

architecture archi of Compteur7seg is

signal SIGcompteur24bits : std_logic_vector(23 downto 0);

begin

	p1 : process(CPTclock, CPTreset)
	begin
		if CPTreset = '1' then 
			SIGcompteur24bits <=(others =>'0');
		else
			if rising_edge(CPTclock) then
				if SIGcompteur24bits = "111111111111111111111111" then
					SIGcompteur24bits <= (others =>'0');
					CPTclockout <= '1';
				else 
					SIGcompteur24bits <= std_logic_vector(unsigned(SIGcompteur24bits)+1);
					CPTclockout <= '0';
				end if;
			else 
				SIGcompteur24bits <= SIGcompteur24bits;
			end if;
		end if;
	end process;
end archi;
