-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Top entity VHDL

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
		TOPresetIM	: in std_logic;
		-- OUTPUTS
		-- 32 registers of register file
		TOPreg00	: out std_logic_vector(31 downto 0);
		TOPreg01	: out std_logic_vector(31 downto 0);
		TOPreg02	: out std_logic_vector(31 downto 0);
		TOPreg03	: out std_logic_vector(31 downto 0);
		TOPreg04	: out std_logic_vector(31 downto 0);
		TOPreg05	: out std_logic_vector(31 downto 0);
		TOPreg06	: out std_logic_vector(31 downto 0);
		TOPreg07	: out std_logic_vector(31 downto 0);
		TOPreg08	: out std_logic_vector(31 downto 0);
		TOPreg09	: out std_logic_vector(31 downto 0);
		TOPreg0A	: out std_logic_vector(31 downto 0);
		TOPreg0B	: out std_logic_vector(31 downto 0);
		TOPreg0C	: out std_logic_vector(31 downto 0);
		TOPreg0D	: out std_logic_vector(31 downto 0);
		TOPreg0E	: out std_logic_vector(31 downto 0);
		TOPreg0F	: out std_logic_vector(31 downto 0);
		TOPreg10	: out std_logic_vector(31 downto 0);
		TOPreg11	: out std_logic_vector(31 downto 0);
		TOPreg12	: out std_logic_vector(31 downto 0);
		TOPreg13	: out std_logic_vector(31 downto 0);
		TOPreg14	: out std_logic_vector(31 downto 0);
		TOPreg15	: out std_logic_vector(31 downto 0);
		TOPreg16	: out std_logic_vector(31 downto 0);
		TOPreg17	: out std_logic_vector(31 downto 0);
		TOPreg18	: out std_logic_vector(31 downto 0);
		TOPreg19	: out std_logic_vector(31 downto 0);
		TOPreg1A	: out std_logic_vector(31 downto 0);
		TOPreg1B	: out std_logic_vector(31 downto 0);
		TOPreg1C	: out std_logic_vector(31 downto 0);
		TOPreg1D	: out std_logic_vector(31 downto 0);
		TOPreg1E	: out std_logic_vector(31 downto 0);
		TOPreg1F	: out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of Top is
	
	-- COMPONENTS
	-- program counter
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
	
	-- instruction decoder
	component InstructionDecoder is 
		port (
			-- INPUTS
			-- instruction endianness must be Big Endian !
			IDinstruction 	: in std_logic_vector (31 downto 0);
			-- OUTPUTS
			IDopcode 		: out std_logic_vector (6 downto 0);
			IDimmSel 		: out std_logic;
			IDrd 				: out std_logic_vector (4 downto 0);
			IDrs1 			: out std_logic_vector (4 downto 0);
			IDrs2 			: out std_logic_vector (4 downto 0);
			IDfunct3 		: out std_logic_vector (2 downto 0);
			IDfunct7 		: out std_logic;
			IDimm12I 		: out std_logic_vector (11 downto 0);
			IDimm12S 		: out std_logic_vector (11 downto 0);
			IDimm13B 		: out std_logic_vector (12 downto 0);
			IDimm32U 		: out std_logic_vector (31 downto 0);
			IDimm21J 		: out std_logic_vector (20 downto 0);
			IDload 			: out std_logic;
			IDstore 			: out std_logic;
			IDlui 			: out std_logic;
			IDauipc 			: out std_logic;
			IDjal 			: out std_logic;
			IDjalr 			: out std_logic;
			IDbranch 		: out std_logic
		);
	end component;
	
	--register file
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
			RFreg00	: out std_logic_vector(31 downto 0);
			RFreg01	: out std_logic_vector(31 downto 0);
			RFreg02	: out std_logic_vector(31 downto 0);
			RFreg03	: out std_logic_vector(31 downto 0);
			RFreg04	: out std_logic_vector(31 downto 0);
			RFreg05	: out std_logic_vector(31 downto 0);
			RFreg06	: out std_logic_vector(31 downto 0);
			RFreg07	: out std_logic_vector(31 downto 0);
			RFreg08	: out std_logic_vector(31 downto 0);
			RFreg09	: out std_logic_vector(31 downto 0);
			RFreg0A	: out std_logic_vector(31 downto 0);
			RFreg0B	: out std_logic_vector(31 downto 0);
			RFreg0C	: out std_logic_vector(31 downto 0);
			RFreg0D	: out std_logic_vector(31 downto 0);
			RFreg0E	: out std_logic_vector(31 downto 0);
			RFreg0F	: out std_logic_vector(31 downto 0);
			RFreg10	: out std_logic_vector(31 downto 0);
			RFreg11	: out std_logic_vector(31 downto 0);
			RFreg12	: out std_logic_vector(31 downto 0);
			RFreg13	: out std_logic_vector(31 downto 0);
			RFreg14	: out std_logic_vector(31 downto 0);
			RFreg15	: out std_logic_vector(31 downto 0);
			RFreg16	: out std_logic_vector(31 downto 0);
			RFreg17	: out std_logic_vector(31 downto 0);
			RFreg18	: out std_logic_vector(31 downto 0);
			RFreg19	: out std_logic_vector(31 downto 0);
			RFreg1A	: out std_logic_vector(31 downto 0);
			RFreg1B	: out std_logic_vector(31 downto 0);
			RFreg1C	: out std_logic_vector(31 downto 0);
			RFreg1D	: out std_logic_vector(31 downto 0);
			RFreg1E	: out std_logic_vector(31 downto 0);
			RFreg1F	: out std_logic_vector(31 downto 0)
		);
	end component;
	
	--alu
	component Alu is 
		port (
			-- INPUTS
			ALUin1 		: in std_logic_vector (31 downto 0);
			ALUin2 		: in std_logic_vector (31 downto 0);
			ALUfunct7 	: in std_logic;
			ALUfunct3 	: in std_logic_vector (2 downto 0);
			-- OUTPUTS
			ALUout 		: out std_logic_vector (31 downto 0);
			ALUsup 		: out std_logic;
			ALUeq 		: out std_logic;
			ALUinf 		: out std_logic
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
	-- program counter
	signal SIGprogcounter: std_logic_vector (31 downto 0);
	signal SIGoffsetPC1	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC2	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC3	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC	: std_logic_vector (31 downto 0);
	signal SIGoffsetsignPC: std_logic;
	-- instruction memory
	signal SIGinstruction: std_logic_vector (31 downto 0);
	-- instruction decoder
	signal SIGopcode 		: std_logic_vector (6 downto 0);
	signal SIGimmSel 		: std_logic;
	signal SIGrd 			: std_logic_vector (4 downto 0);
	signal SIGrs1 			: std_logic_vector (4 downto 0);
	signal SIGrs2 			: std_logic_vector (4 downto 0);
	signal SIGfunct3		: std_logic_vector (2 downto 0);
	signal SIGfunct7 		: std_logic;
	signal SIGimm12I 		: std_logic_vector (11 downto 0);
	signal SIGimm12S 		: std_logic_vector (11 downto 0);
	signal SIGimm13B 		: std_logic_vector (12 downto 0);
	signal SIGimm32U 		: std_logic_vector (31 downto 0);
	signal SIGimm21J 		: std_logic_vector (20 downto 0);
	signal SIGload 		: std_logic;
	signal SIGstore 		: std_logic;
	signal SIGlui 			: std_logic;
	signal SIGauipc 		: std_logic;
	signal SIGjal 			: std_logic;
	signal SIGjalr 		: std_logic;
	signal SIGbranch 		: std_logic;
	-- register file
	signal SIGinputRF		: std_logic_vector (31 downto 0);
	signal SIGoutput1RF	: std_logic_vector (31 downto 0);
	signal SIGoutput2RF	: std_logic_vector (31 downto 0);
	-- alu
	signal SIGinput1ALU	: std_logic_vector (31 downto 0);
	signal SIGinput2ALU	: std_logic_vector (31 downto 0);
	signal SIGoutputALU	: std_logic_vector (31 downto 0);
	signal SIGfunct3ALU	: std_logic_vector (2 downto 0);
	signal SIGeqALU		: std_logic;
	signal SIGinfALU		: std_logic;
	signal SIGsupALU		: std_logic;
	-- data memory
	signal SIGaddrDM		: std_logic_vector (31 downto 0);
	signal SIGinputDM		: std_logic_vector (31 downto 0);
	signal SIGoutputDM	: std_logic_vector (31 downto 0);
	
begin
	-- BEGIN

	-- ALL
	-- program counter
	SIGoffsetsignPC				<= 	SIGimm21J(20);
	SIGoffsetPC1 					<= 	SIGimm32U when SIGauipc = '1' else
												SIGoutputALU when SIGjalr = '1' else
												(others => '0');
	SIGoffsetPC2(20 downto 0) 	<= 	SIGimm21J;
	SIGoffsetPC2(31 downto 21) 	<= (others => '1') when SIGoffsetsignPC = '1' else
												(others => '0');
	SIGoffsetPC3(12 downto 0)	<=		SIGimm13B;
	SIGoffsetPC3(31 downto 13)	<=		(others => '1') when SIGoffsetsignPC = '1' else
												(others => '0');
	SIGoffsetPC						<=		SIGoffsetPC1 when SIGauipc = '1' OR SIGjalr = '1' else
												SIGoffsetPC2 when SIGjal = '1' else
												SIGoffsetPC3 when SIGbranch = '1' else
												(others => '0');
	-- register file
	SIGinputRF 		<= 	SIGoutputDM 	when SIGload = '1' else
								SIGprogcounter when (SIGjal = '1' OR SIGjalr = '1') else
								SIGimm32U 		when SIGlui = '1' else
								std_logic_vector(unsigned(SIGimm32U) + unsigned(SIGprogcounter)) when SIGauipc = '1' else
								SIGoutputALU 	when SIGstore = '0' else
								(others => '0');
	-- alu
	SIGfunct3ALU 	<=		"000" when (SIGstore = '1' OR SIGload = '1') else
								SIGfunct3;
	SIGinput1ALU 	<= 	SIGoutput1RF;
	SIGinput2ALU(11 downto 0) 	<= 	SIGimm12S(11 downto 0) when SIGstore = '1' else
												SIGimm12I(11 downto 0) when (SIGload = '1' OR SIGimmSel = '1' OR SIGjalr = '1') else
												SIGoutput2RF(11 downto 0);
	SIGinput2ALU(31 downto 12) <= 	(others => '0') when (SIGimmSel = '1' OR SIGload = '1' OR SIGstore = '1') AND SIGimm12I(11) = '0' else
												(others => '1') when (SIGimmSel = '1' OR SIGload = '1' OR SIGstore = '1') AND SIGimm12I(11) = '1' else
												SIGoutput2RF(31 downto 12);
	-- data memory
	SIGaddrDM 		<= 	SIGoutputALU;
	SIGinputDM 		<= 	SIGoutput2RF;
	
	-- INSTANCES
	instPC  : ProgramCounter
	port map(
		PCclock 			=> TOPclock,			
		PCreset 			=> TOPreset,			
		PCoffset 		=> SIGoffsetPC,--complex			
		PCoffsetsign 	=> SIGoffsetsignPC,--complex
		PCjal 			=> SIGjal,				
		PCjalr 			=> SIGjalr,			
		PCbranch 		=> SIGbranch, 		
		PCfunct3 		=> SIGfunct3,			
		PCauipc 			=> SIGauipc,			
		PCalueq 			=> SIGeqALU,			
		PCaluinf 		=> SIGinfALU,			
		PCprogcounter 	=> SIGprogcounter
	);
	
	instIM  : InstructionMemory
	port map(
		IMclock			=> TOPclock,
		IMreset			=> TOPresetIM,
		IMprogcounter	=> SIGprogcounter,
		IMout				=> SIGinstruction
	);
	
	instID  : InstructionDecoder
	port map(
		IDinstruction	=> SIGinstruction,
		IDopcode			=> SIGopcode,
		IDimmSel			=> SIGimmSel,
		IDrd				=> SIGrd,
		IDrs1				=> SIGrs1,
		IDrs2				=> SIGrs2,
		IDfunct3			=> SIGfunct3,
		IDfunct7 		=> SIGfunct7,
		IDimm12I			=> SIGimm12I,
		IDimm12S			=> SIGimm12S,
		IDimm13B			=> SIGimm13B,
		IDimm32U			=> SIGimm32U,
		IDimm21J			=> SIGimm21J,
		IDload 			=> SIGload,
		IDstore 			=> SIGstore,
		IDlui 			=> SIGlui,
		IDauipc 			=> SIGauipc,
		IDjal 			=> SIGjal,
		IDjalr 			=> SIGjalr,
		IDbranch 		=> SIGbranch
	);

	instRF  : RegisterFile 
	port map(
		RFclock	=> TOPclock,
		RFreset	=> TOPreset,
		RFin		=> SIGinputRF,--complex
		RFrd		=> SIGrd,
		RFrs1		=> SIGrs1,
		RFrs2		=> SIGrs2,
		RFout1	=> SIGoutput1RF,--complex
		RFout2	=> SIGoutput2RF,--complex
		RFreg00	=> TOPreg00,
		RFreg01	=> TOPreg01,
		RFreg02	=> TOPreg02,
		RFreg03	=> TOPreg03,
		RFreg04	=> TOPreg04,
		RFreg05	=> TOPreg05,
		RFreg06	=> TOPreg06,
		RFreg07	=> TOPreg07,
		RFreg08	=> TOPreg08,
		RFreg09	=> TOPreg09,
		RFreg0A	=> TOPreg0A,
		RFreg0B	=> TOPreg0B,
		RFreg0C	=> TOPreg0C,
		RFreg0D	=> TOPreg0D,
		RFreg0E	=> TOPreg0E,
		RFreg0F	=> TOPreg0F,
		RFreg10	=> TOPreg10,
		RFreg11	=> TOPreg11,
		RFreg12	=> TOPreg12,
		RFreg13	=> TOPreg13,
		RFreg14	=> TOPreg14,
		RFreg15	=> TOPreg15,
		RFreg16	=> TOPreg16,
		RFreg17	=> TOPreg17,
		RFreg18	=> TOPreg18,
		RFreg19	=> TOPreg19,
		RFreg1A	=> TOPreg1A,
		RFreg1B	=> TOPreg1B,
		RFreg1C	=> TOPreg1C,
		RFreg1D	=> TOPreg1D,
		RFreg1E	=> TOPreg1E,
		RFreg1F	=> TOPreg1F 
	);
	
	instALU : Alu
	port map(
		ALUin1 		=> SIGinput1ALU,--complex
		ALUin2 		=> SIGinput2ALU,--complex
		ALUfunct7 	=> SIGfunct7,
		ALUfunct3	=> SIGfunct3ALU,
		ALUout 		=> SIGoutputALU,--complex
		ALUsup 		=> SIGsupALU,
		ALUeq 		=> SIGeqALU,
		ALUinf 		=> SIGinfALU
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