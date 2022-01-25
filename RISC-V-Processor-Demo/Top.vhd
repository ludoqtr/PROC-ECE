-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Top entity VHDL = Processor + DataMemory + InstructionMemory

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity Top is
	port (
		-- INPUTS
		TOPclock		: in std_logic;		--must go through pll
		TOPreset		: in std_logic; 	--SW0
		TOPresetIM	: in std_logic; 		--SW1
		-- DEMO OUTPUTS
		TOPcounter : inout std_logic_vector(31 downto 0); --0x80000001
		TOPdisplay1 : out std_logic_vector(31 downto 0);--0x80000002
		TOPdisplay2 : out std_logic_vector(31 downto 0);--0x80000003
		TOPleds : out std_logic_vector(31 downto 0) 	--0x80000004
	);
end entity;

-- ARCHITECTURE
architecture archi of Top is
	
	-- COMPONENTS
	-- processor
	component Processor is 
		port (
			-- INPUTS
			PROCclock			: in std_logic;
			PROCreset			: in std_logic;
			PROCinstruction : in std_logic_vector(31 downto 0);
			PROCoutputDM 	: in std_logic_vector(31 downto 0);
			-- OUTPUTS
			PROCprogcounter : out std_logic_vector(31 downto 0);
			PROCstore 		: out std_logic;
			PROCload 			: out std_logic;
			PROCfunct3 		: out std_logic_vector(2 downto 0);
			PROCaddrDM 		: out std_logic_vector(31 downto 0);
			PROCinputDM 		: out std_logic_vector(31 downto 0);
			-- 32 registers of register file
			PROCreg00	: inout std_logic_vector(31 downto 0);
			PROCreg01	: inout std_logic_vector(31 downto 0);
			PROCreg02	: inout std_logic_vector(31 downto 0);
			PROCreg03	: inout std_logic_vector(31 downto 0);
			PROCreg04	: inout std_logic_vector(31 downto 0);
			PROCreg05	: inout std_logic_vector(31 downto 0);
			PROCreg06	: inout std_logic_vector(31 downto 0);
			PROCreg07	: inout std_logic_vector(31 downto 0);
			PROCreg08	: inout std_logic_vector(31 downto 0);
			PROCreg09	: inout std_logic_vector(31 downto 0);
			PROCreg0A	: inout std_logic_vector(31 downto 0);
			PROCreg0B	: inout std_logic_vector(31 downto 0);
			PROCreg0C	: inout std_logic_vector(31 downto 0);
			PROCreg0D	: inout std_logic_vector(31 downto 0);
			PROCreg0E	: inout std_logic_vector(31 downto 0);
			PROCreg0F	: inout std_logic_vector(31 downto 0);
			PROCreg10	: inout std_logic_vector(31 downto 0);
			PROCreg11	: inout std_logic_vector(31 downto 0);
			PROCreg12	: inout std_logic_vector(31 downto 0);
			PROCreg13	: inout std_logic_vector(31 downto 0);
			PROCreg14	: inout std_logic_vector(31 downto 0);
			PROCreg15	: inout std_logic_vector(31 downto 0);
			PROCreg16	: inout std_logic_vector(31 downto 0);
			PROCreg17	: inout std_logic_vector(31 downto 0);
			PROCreg18	: inout std_logic_vector(31 downto 0);
			PROCreg19	: inout std_logic_vector(31 downto 0);
			PROCreg1A	: inout std_logic_vector(31 downto 0);
			PROCreg1B	: inout std_logic_vector(31 downto 0);
			PROCreg1C	: inout std_logic_vector(31 downto 0);
			PROCreg1D	: inout std_logic_vector(31 downto 0);
			PROCreg1E	: inout std_logic_vector(31 downto 0);
			PROCreg1F	: inout std_logic_vector(31 downto 0)
		);
	end component;
	
	-- instruction memory
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
	
	--data memory
	component DataMemory is 
		port (
			-- INPUTS
			DMclock		: in std_logic;
			DMreset		: in std_logic;
			DMstore		: in std_logic;
			DMload		: in std_logic;
			DMaddr		: in std_logic_vector(31 downto 0);
			DMin			: in std_logic_vector(31 downto 0);
			DMfunct3		: in std_logic_vector(2 downto 0);
			-- OUTPUTS
			DMout			: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component Counter is
	port (
		CPTclock	: in std_logic;
		CPTreset	: in std_logic;
		CPTcounter	: inout std_logic_vector(31 downto 0)
	);
	end component;
	
	component Displays is
	port (
			--INPUTS
			DISPclock : in std_logic;
			DISPreset : in std_logic;
			DISPaddr : in std_logic_vector(31 downto 0);
			DISPinput : in std_logic_vector(31 downto 0);
			--OUTPUTS
			DISPleds : out std_logic_vector(31 downto 0);
			DISPdisplay1 : out std_logic_vector(31 downto 0);
			DISPdisplay2 : out std_logic_vector(31 downto 0)
		);
	end component;

	-- SIGNALS
	-- instruction memory
	signal SIGprogcounter: std_logic_vector (31 downto 0);
	signal SIGinstruction: std_logic_vector (31 downto 0);
	-- data memory
	signal SIGfunct3		: std_logic_vector (2 downto 0);
	signal SIGload 		: std_logic;
	signal SIGstore 		: std_logic;
	signal SIGaddrDM		: std_logic_vector (31 downto 0);
	signal SIGinputDM		: std_logic_vector (31 downto 0);
	signal SIGoutputDM	: std_logic_vector (31 downto 0);
	
begin
	-- BEGIN

	-- ALL
	
	-- INSTANCES
	instPROC : Processor
	port map(
		PROCclock		=> TOPclock,
		PROCreset		=> TOPreset,
		PROCinstruction=> SIGinstruction,
		PROCoutputDM 	=> SIGoutputDM,
		-- OUTPUTS
		PROCprogcounter=> SIGprogcounter,
		PROCstore 		=> SIGstore,
		PROCload 		=> SIGload,
		PROCfunct3 		=> SIGfunct3,
		PROCaddrDM 		=> SIGaddrDM,
		PROCinputDM 	=> SIGinputDM
	);
	
	instIM  : InstructionMemory
	port map(
		IMclock			=> TOPclock,
		IMreset			=> TOPresetIM,
		IMprogcounter	=> SIGprogcounter,
		IMout				=> SIGinstruction
	);
	
	instDM  : DataMemory
	port map(
		DMclock		=> TOPclock,
		DMreset		=> TOPreset,
		DMstore		=> SIGstore,
		DMload		=> SIGload,
		DMaddr		=> SIGaddrDM,--complex
		DMin			=> SIGinputDM,--complex
		DMfunct3		=> SIGfunct3,
		DMout			=> SIGoutputDM--complex
	);
	
	instCPT : Counter
	port map(
		CPTclock	=> TOPclock,
		CPTreset	=> TOPreset,
		CPTcounter	=> TOPcounter
	);
	
	instDISP : Displays 
	port map(
		--INPUTS
		DISPclock 	=> TOPclock,
		DISPreset 	=> TOPreset,
		DISPaddr 	=> SIGaddrDM,
		DISPinput 	=> SIGinputDM,
		--OUTPUTS
		DISPleds 	=> TOPleds,
		DISPdisplay1 	=> TOPdisplay1,
		DISPdisplay2 	=> TOPdisplay2
	);
	-- END
end archi;
-- END FILE
