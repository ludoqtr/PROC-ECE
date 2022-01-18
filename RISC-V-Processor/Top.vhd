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
		TOPclock		: in std_logic;
		TOPreset		: in std_logic;
		TOPresetIM	: in std_logic
	);
end entity;

-- ARCHITECTURE
architecture archi of Top is
	
	-- COMPONENTS
	-- processor
	component Processor is 
		port (
			-- INPUTS
			TOPclock			: in std_logic;
			TOPreset			: in std_logic;
			TOPinstruction : in std_logic_vector(31 downto 0);
			TOPoutputDM 	: in std_logic_vector(31 downto 0);
			-- OUTPUTS
			TOPprogcounter : out std_logic_vector(31 downto 0);
			TOPstore 		: out std_logic;
			TOPload 			: out std_logic;
			TOPfunct3 		: out std_logic_vector(2 downto 0);
			TOPaddrDM 		: out std_logic_vector(31 downto 0);
			TOPinputDM 		: out std_logic_vector(31 downto 0);
			-- 32 registers of register file
			TOPreg00	: inout std_logic_vector(31 downto 0);
			TOPreg01	: inout std_logic_vector(31 downto 0);
			TOPreg02	: inout std_logic_vector(31 downto 0);
			TOPreg03	: inout std_logic_vector(31 downto 0);
			TOPreg04	: inout std_logic_vector(31 downto 0);
			TOPreg05	: inout std_logic_vector(31 downto 0);
			TOPreg06	: inout std_logic_vector(31 downto 0);
			TOPreg07	: inout std_logic_vector(31 downto 0);
			TOPreg08	: inout std_logic_vector(31 downto 0);
			TOPreg09	: inout std_logic_vector(31 downto 0);
			TOPreg0A	: inout std_logic_vector(31 downto 0);
			TOPreg0B	: inout std_logic_vector(31 downto 0);
			TOPreg0C	: inout std_logic_vector(31 downto 0);
			TOPreg0D	: inout std_logic_vector(31 downto 0);
			TOPreg0E	: inout std_logic_vector(31 downto 0);
			TOPreg0F	: inout std_logic_vector(31 downto 0);
			TOPreg10	: inout std_logic_vector(31 downto 0);
			TOPreg11	: inout std_logic_vector(31 downto 0);
			TOPreg12	: inout std_logic_vector(31 downto 0);
			TOPreg13	: inout std_logic_vector(31 downto 0);
			TOPreg14	: inout std_logic_vector(31 downto 0);
			TOPreg15	: inout std_logic_vector(31 downto 0);
			TOPreg16	: inout std_logic_vector(31 downto 0);
			TOPreg17	: inout std_logic_vector(31 downto 0);
			TOPreg18	: inout std_logic_vector(31 downto 0);
			TOPreg19	: inout std_logic_vector(31 downto 0);
			TOPreg1A	: inout std_logic_vector(31 downto 0);
			TOPreg1B	: inout std_logic_vector(31 downto 0);
			TOPreg1C	: inout std_logic_vector(31 downto 0);
			TOPreg1D	: inout std_logic_vector(31 downto 0);
			TOPreg1E	: inout std_logic_vector(31 downto 0);
			TOPreg1F	: inout std_logic_vector(31 downto 0)
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
		TOPclock			=> TOPclock,
		TOPreset			=> TOPreset,
		TOPinstruction => SIGinstruction,
		TOPoutputDM 	=> SIGoutputDM,
		-- OUTPUTS
		TOPprogcounter => SIGprogcounter,
		TOPstore 		=> SIGstore,
		TOPload 			=> SIGload,
		TOPfunct3 		=> SIGfunct3,
		TOPaddrDM 		=> SIGaddrDM,
		TOPinputDM 		=> SIGinputDM
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
	
	-- END
end archi;
-- END FILE