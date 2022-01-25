--
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
		
		CPTcounter	: inout std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of Counter is
	
begin
	-- BEGIN		
	p1 : process(CPTreset, CPTclock)
	begin
		if(CPTreset = '1') then
			CPTcounter <= (others => '0');
		else
			if(rising_edge(CPTclock)) then
				CPTcounter <= std_logic_vector(unsigned(CPTcounter)+1);
			end if;
		end if;
	end process;
						
	-- END
end archi;
-- END FILE

