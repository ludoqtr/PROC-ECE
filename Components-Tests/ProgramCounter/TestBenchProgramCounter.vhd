-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- TestBench ProgramCOunter VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchProgramCounter is
end entity;


architecture archi of TestBenchProgramCounter is
	component ProgramCounter is
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
		--PCalusup			: in std_logic;
		-- OUTPUTS
		PCprogcounter	: inout std_logic_vector(31 downto 0)
	);
	end component;

	Signal SigPCclock : std_logic;
	signal SigPCreset : std_logic;
	signal SigPCoffset : std_logic_vector(31 downto 0);
	signal SigPCoffsetsign : std_logic;
	signal SigPCjal : std_logic;
	signal SigPCjalr : std_logic;
	signal SigPCbranch : std_logic;
	signal SigPCfunct3 : std_logic_vector(2 downto 0);
	signal SigPCauipc : std_logic;
	signal SigPCalueq : std_logic;
	signal SigPCaluinf : std_logic;
	signal SigPCprogcounter : std_logic_vector(31 downto 0);

	begin
	
	
	clock : process
	begin
		SigPCclock <= '0';
		wait for 100ns;
		SigPCclock <= '1';
		wait for 100ns;
	end process;
	
	reset : process
	begin
		SigPCreset <= '1';
		wait for 200ns;
		SigPCreset <= '0';
		wait;
	end process;
	
	stimuli_import : process
	begin
		-- Initialisation des variables
		SigPCoffset 		<= "00000000000000000000000000000000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '0';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '0';
		SigPCfunct3 		<= "000";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '0';
		wait for 2000ns;
		
		SigPCoffset 		<= "00000000000000000000000000100000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '1';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '0';
		SigPCfunct3 		<= "000";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '0';
		wait for 200ns;
		
		SigPCoffset 		<= "00000000000000000000000000000100";
		SigPCoffsetsign 	<= '1';
		SigPCjal 			<= '1';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '0';
		SigPCfunct3 		<= "000";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '0';
		wait for 200ns;
		
		SigPCoffset 		<= "00000000000000000000000001000000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '0';
		SigPCjalr 			<= '1';
		SigPCbranch 		<= '0';
		SigPCfunct3 		<= "000";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '1';
		SigPCaluinf 		<= '0';
		wait for 200ns;
		
		SigPCoffset 		<= "00000000000000000000000010000000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '0';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '1';
		SigPCfunct3 		<= "001";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '0';
		wait for 200ns;
		
		SigPCoffset 		<= "00000000000000000000000100000000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '0';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '1';
		SigPCfunct3 		<= "100";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '1';
		wait for 200ns;
		
		SigPCoffset 		<= "00000000000000000000001000000000";
		SigPCoffsetsign 	<= '0';
		SigPCjal 			<= '0';
		SigPCjalr 			<= '0';
		SigPCbranch 		<= '1';
		SigPCfunct3 		<= "101";
		SigPCauipc 			<= '0';
		SigPCalueq 			<= '0';
		SigPCaluinf 		<= '0';
		wait for 200ns;
		
	end process;
		
	i1 : ProgramCounter port map(PCclock => SigPCclock, PCreset => SigPCreset, PCoffset => SigPCoffset, PCoffsetsign => SigPCoffsetsign, PCjal => SigPCjal, 
							PCjalr => SigPCjalr, PCbranch => SigPCbranch, PCfunct3 => SigPCfunct3, PCauipc => SigPCauipc, PCalueq => SigPCalueq, 
							PCaluinf => SigPCaluinf, PCprogcounter => SigPCprogcounter);
end archi;
