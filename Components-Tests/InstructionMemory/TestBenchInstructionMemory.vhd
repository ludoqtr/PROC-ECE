-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchInstructionMemory is
end entity;

architecture archi of TestBenchInstructionMemory is
	component InstructionMemory is
		port (
		-- INPUTS
		IMclock			: in std_logic;
		IMreset			: in std_logic;
		IMprogcounter	: in std_logic_vector(31 downto 0);
		-- OUTPUTS
		IMout				: out std_logic_vector(31 downto 0)
		);
	end component;

	signal SigIMclock : std_logic;
	signal SigIMreset : std_logic;
	signal SigIMprogcounter : std_logic_vector (31 downto 0);
	signal SigIMout : std_logic_vector (31 downto 0);

	begin
	
	process_clock : process
	begin
	
		SigIMclock <= '0';
		wait for 100ns;
		SigIMclock <= '1';
		wait for 100ns;
	
	end process;
	
	--process_reset : process
	--begin
	
		--SigIMreset<= '1';
		--wait for 100ns;
		--SigIMreset<= '0';
		--wait;
	
	--end process;
	
	process_IM : process
	begin
	
		SigIMreset<= '0';
		
		SigIMprogcounter <= x"00000000";
		wait for 200ns;
		SigIMprogcounter <= x"00000004";
		wait for 200ns;
		SigIMprogcounter <= x"00000008";
		wait for 200ns;
		SigIMprogcounter <= x"0000000C";
		wait for 200ns;
		SigIMprogcounter <= x"0000003C";
		wait for 200ns;
		SigIMprogcounter <= x"00000040";
		wait for 200ns;
		
	end process;

	i1 : InstructionMemory port map(IMclock => SigIMclock, IMreset => SigIMreset, IMprogcounter => SigIMprogcounter, IMout => SigIMout);

end archi;
