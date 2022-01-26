-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Program Counter VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity ProgramCounter is
	port (
		-- INPUTS
		PCclock			: in std_logic;
		PCreset			: in std_logic;
		PCoffset			: in std_logic_vector(31 downto 0);
		PCoffsetsign	: in std_logic;
		PCjal				: in std_logic;
		PCjalr			: in std_logic;
		PCbranch 		: in std_logic;
		PCfunct3			: in std_logic_vector(2 downto 0);
		PCauipc			: in std_logic;
		PCalueq			: in std_logic;
		PCaluinf			: in std_logic;
		PCalusup			: in std_logic;
		PCaluinfU			: in std_logic;
		PCalusupU			: in std_logic;
		-- OUTPUTS
		PCprogcounter	: inout std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of ProgramCounter is

	signal SigBranchCond : std_logic;
	signal SigMux1Sel 	: std_logic;
	signal SigMux2Sel 	: std_logic;
	signal SigMux3Sel 	: std_logic;
	signal SigMux1Out 	: std_logic_vector(31 downto 0);
	signal SigMux2Out 	: std_logic_vector(31 downto 0);
	signal SigMux3Out 	: std_logic_vector(31 downto 0);
	signal SigOffSum 		: std_logic_vector(31 downto 0);
	signal SigOffSub 		: std_logic_vector(31 downto 0);
	
begin
	-- BEGIN
	
	-- branch cond
	SigBranchCond <= 		  		PCalueq 		when PCfunct3 = "000" 
							else not PCalueq 	when PCfunct3 = "001"
							else '0' 		when PCfunct3 = "010"
							else '0' 		when PCfunct3 = "011"
							else PCaluinf 		when PCfunct3 = "100"
							else PCalusup 		when PCfunct3 = "101"
							else PCaluinfU 		when PCfunct3 = "110"
							else PCalusupU 		when PCfunct3 = "111"
							else '0';
							
	-- mux 1
	SigMux1Sel <= 	(SigBranchCond AND PCbranch) OR PCjal OR PCjalr OR PCauipc; --mux3
	SigMux1Out <= 	"00000000000000000000000000000100" when SigMux1Sel = '0'
			else PCoffset;
	
	-- adder
	SigOffSum <= 	std_logic_vector(unsigned(PCprogcounter) + unsigned(SigMux1Out));
	--SigOffSub <= 	std_logic_vector(unsigned(PCprogcounter) - unsigned(SigMux1Out));
	
	-- mux 2
	SigMux2Sel <= 	SigMux1Sel AND PCoffsetsign;
	SigMux2Out <= 	PCoffset when PCjalr = '1' else
			SigOffSum when (SigMux2Sel = '0' AND PCjalr = '0') OR PCjal = '1' OR PCbranch = '1' else
			SigOffSub;
						
	p1 : process(PCreset, PCclock)
	begin
		if(PCreset = '1') then
			PCprogcounter <= (others => '0');
		else
			if(rising_edge(PCclock)) then
				PCprogcounter <= SigMux2Out;
			end if;
		end if;
	end process;
						
	-- END
end archi;
-- END FILE

