-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchRegisterFile is
end entity;


architecture VHDL of TestBenchRegisterFile is
	component RegisterFile is
		port (
			-- INPUTS
		RFclock	: in std_logic;
		RFreset	: in std_logic;
		RFin		: in std_logic_vector(31 downto 0);
		RFrd		: in std_logic_vector(4 downto 0);
		RFrs1		: in std_logic_vector(4 downto 0);
		RFrs2		: in std_logic_vector(4 downto 0);
		-- OUTPUTS
		RFout1	: out std_logic_vector(31 downto 0);
		RFout2	: out std_logic_vector(31 downto 0);
		-- 32 registers of register file
		RFreg00	: inout std_logic_vector(31 downto 0);
		RFreg01	: inout std_logic_vector(31 downto 0);
		RFreg02	: inout std_logic_vector(31 downto 0);
		RFreg03	: inout std_logic_vector(31 downto 0);
		RFreg04	: inout std_logic_vector(31 downto 0);
		RFreg05	: inout std_logic_vector(31 downto 0);
		RFreg06	: inout std_logic_vector(31 downto 0);
		RFreg07	: inout std_logic_vector(31 downto 0);
		RFreg08	: inout std_logic_vector(31 downto 0);
		RFreg09	: inout std_logic_vector(31 downto 0);
		RFreg0A	: inout std_logic_vector(31 downto 0);
		RFreg0B	: inout std_logic_vector(31 downto 0);
		RFreg0C	: inout std_logic_vector(31 downto 0);
		RFreg0D	: inout std_logic_vector(31 downto 0);
		RFreg0E	: inout std_logic_vector(31 downto 0);
		RFreg0F	: inout std_logic_vector(31 downto 0);
		RFreg10	: inout std_logic_vector(31 downto 0);
		RFreg11	: inout std_logic_vector(31 downto 0);
		RFreg12	: inout std_logic_vector(31 downto 0);
		RFreg13	: inout std_logic_vector(31 downto 0);
		RFreg14	: inout std_logic_vector(31 downto 0);
		RFreg15	: inout std_logic_vector(31 downto 0);
		RFreg16	: inout std_logic_vector(31 downto 0);
		RFreg17	: inout std_logic_vector(31 downto 0);
		RFreg18	: inout std_logic_vector(31 downto 0);
		RFreg19	: inout std_logic_vector(31 downto 0);
		RFreg1A	: inout std_logic_vector(31 downto 0);
		RFreg1B	: inout std_logic_vector(31 downto 0);
		RFreg1C	: inout std_logic_vector(31 downto 0);
		RFreg1D	: inout std_logic_vector(31 downto 0);
		RFreg1E	: inout std_logic_vector(31 downto 0);
		RFreg1F	: inout std_logic_vector(31 downto 0)
		);
	end component;
	
signal SigRFin 	: std_logic_vector (31 downto 0);
signal SigRFrd		: std_logic_vector (4  downto 0);
signal SigRFclock	: std_logic;
signal SigRFreset	: std_logic;
signal SigRFrs1	: std_logic_vector (4  downto 0);
Signal SigRFrs2	: std_logic_vector (4  downto 0);
signal SigRFout1	: std_logic_vector (31 downto 0);
signal SigRFout2	: std_logic_vector (31 downto 0);
signal RFreg02    : std_logic_vector (31 downto 0);

	begin
	
	ClockProc : process 
	begin
	
	SigRFclock <= '0';
	wait for 100ns;
	SigRFclock <= '1';
	wait for 100ns;
	

	end process;
	
	
	ResetProc : process 
	begin
	
	SigRFreset <= '1';
	wait for 100ns;
	SigRFreset <= '0';
	wait for 100ns;
	
	end process;

			
	stimuli_import : process 
	begin
	
		-- 
		SigRFin <= "00000000000000000000000000000010";
		RFreg02 <= "11111111111111111111111111111111";
		SigRFrd <= "00010";
		SigRFrs1 <= "00010";
		SigRFrs2 <= "00001";
		wait for 100ns;
		-- 
		SigRFin <= "00000000000000000000000000001110";
		RFreg02 <= "11111111111111111111111111100000";
		SigRFrd <= "00011";
		SigRFrs1 <= "00010";
		SigRFrs2 <= "00001";
		wait for 100ns;
		-- 
		SigRFin <= "00000000000000000000000000001111";
		RFreg02 <= "11111111111111111111110000000000";
		SigRFrd <= "00100";
		SigRFrs1 <= "00010";
		SigRFrs2 <= "00001";
		wait for 100ns;

	end process;

	i1 : RegisterFile port map(RFclock => SigRFclock, RFreset => SigRFreset, 
	RFin => SigRFin, RFrd => SigRFrd, RFrs1 => SigRFrs1, RFrs2 => SigRFrs2, RFout1 => SigRFout1, RFout2 => SigRFout2); -- 

end VHDL;