-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Counter VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity Counter is
	port (
		CPTclock	: in std_logic;
		CPTreset	: in std_logic;
		
		CPTcounter	: out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of Counter is
	signal combCpt, regCpt : std_logic_vector(31 downto 0);
begin

	combCpt <= std_logic_vector(unsigned(regCpt)+1);
	
	regCpt <= (others =>'0') when CPTreset='1' else combCpt when rising_edge(CPTclock);
	
	CPTcounter <= regCpt;
						
	-- END
end archi;
-- END FILE