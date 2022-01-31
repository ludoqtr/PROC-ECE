-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Processor entity VHDL = Alu + RegisterFile + InstructionDecoder + ProgramCounter

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity Processor is
	port (
		-- INPUTS
		PROCclock		: in std_logic;
		PROCreset		: in std_logic;
		PROCinstruction: in std_logic_vector(31 downto 0);
		PROCoutputDM 	: in std_logic_vector(31 downto 0);
		-- OUTPUTS
		PROCprogcounter: out std_logic_vector(31 downto 0);
		PROCstore 		: out std_logic;
		PROCload 		: out std_logic;
		PROCfunct3 		: out std_logic_vector(2 downto 0);
		PROCaddrDM 		: out std_logic_vector(31 downto 0);
		PROCinputDM 	: out std_logic_vector(31 downto 0);
		-- 32 registers of register file
		PROCreg00	: out std_logic_vector(31 downto 0);
		PROCreg01	: out std_logic_vector(31 downto 0);
		PROCreg02	: out std_logic_vector(31 downto 0);
		PROCreg03	: out std_logic_vector(31 downto 0);
		PROCreg04	: out std_logic_vector(31 downto 0);
		PROCreg05	: out std_logic_vector(31 downto 0);
		PROCreg06	: out std_logic_vector(31 downto 0);
		PROCreg07	: out std_logic_vector(31 downto 0);
		PROCreg08	: out std_logic_vector(31 downto 0);
		PROCreg09	: out std_logic_vector(31 downto 0);
		PROCreg0A	: out std_logic_vector(31 downto 0);
		PROCreg0B	: out std_logic_vector(31 downto 0);
		PROCreg0C	: out std_logic_vector(31 downto 0);
		PROCreg0D	: out std_logic_vector(31 downto 0);
		PROCreg0E	: out std_logic_vector(31 downto 0);
		PROCreg0F	: out std_logic_vector(31 downto 0);
		PROCreg10	: out std_logic_vector(31 downto 0);
		PROCreg11	: out std_logic_vector(31 downto 0);
		PROCreg12	: out std_logic_vector(31 downto 0);
		PROCreg13	: out std_logic_vector(31 downto 0);
		PROCreg14	: out std_logic_vector(31 downto 0);
		PROCreg15	: out std_logic_vector(31 downto 0);
		PROCreg16	: out std_logic_vector(31 downto 0);
		PROCreg17	: out std_logic_vector(31 downto 0);
		PROCreg18	: out std_logic_vector(31 downto 0);
		PROCreg19	: out std_logic_vector(31 downto 0);
		PROCreg1A	: out std_logic_vector(31 downto 0);
		PROCreg1B	: out std_logic_vector(31 downto 0);
		PROCreg1C	: out std_logic_vector(31 downto 0);
		PROCreg1D	: out std_logic_vector(31 downto 0);
		PROCreg1E	: out std_logic_vector(31 downto 0);
		PROCreg1F	: out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of Processor is
	
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
			PCalusup			: in std_logic;
			PCaluinfU			: in std_logic;
			PCalusupU			: in std_logic;
			PCload : in std_logic;

			-- OUTPUTS
			PCprogcounter	: inout std_logic_vector(31 downto 0)
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
			probeRFreg00	: out std_logic_vector(31 downto 0);
			probeRFreg01	: out std_logic_vector(31 downto 0);
			probeRFreg02	: out std_logic_vector(31 downto 0);
			probeRFreg03	: out std_logic_vector(31 downto 0);
			probeRFreg04	: out std_logic_vector(31 downto 0);
			probeRFreg05	: out std_logic_vector(31 downto 0);
			probeRFreg06	: out std_logic_vector(31 downto 0);
			probeRFreg07	: out std_logic_vector(31 downto 0);
			probeRFreg08	: out std_logic_vector(31 downto 0);
			probeRFreg09	: out std_logic_vector(31 downto 0);
			probeRFreg0A	: out std_logic_vector(31 downto 0);
			probeRFreg0B	: out std_logic_vector(31 downto 0);
			probeRFreg0C	: out std_logic_vector(31 downto 0);
			probeRFreg0D	: out std_logic_vector(31 downto 0);
			probeRFreg0E	: out std_logic_vector(31 downto 0);
			probeRFreg0F	: out std_logic_vector(31 downto 0);
			probeRFreg10	: out std_logic_vector(31 downto 0);
			probeRFreg11	: out std_logic_vector(31 downto 0);
			probeRFreg12	: out std_logic_vector(31 downto 0);
			probeRFreg13	: out std_logic_vector(31 downto 0);
			probeRFreg14	: out std_logic_vector(31 downto 0);
			probeRFreg15	: out std_logic_vector(31 downto 0);
			probeRFreg16	: out std_logic_vector(31 downto 0);
			probeRFreg17	: out std_logic_vector(31 downto 0);
			probeRFreg18	: out std_logic_vector(31 downto 0);
			probeRFreg19	: out std_logic_vector(31 downto 0);
			probeRFreg1A	: out std_logic_vector(31 downto 0);
			probeRFreg1B	: out std_logic_vector(31 downto 0);
			probeRFreg1C	: out std_logic_vector(31 downto 0);
			probeRFreg1D	: out std_logic_vector(31 downto 0);
			probeRFreg1E	: out std_logic_vector(31 downto 0);
			probeRFreg1F	: out std_logic_vector(31 downto 0)
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
			ALUinf 		: out std_logic;
			ALUinfU		: out std_logic;
			ALUsupU		: out std_logic
		);
	end component;
	
	-- SIGNALS
	-- program counter
	signal SIGoffsetPC1	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC2	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC3	: std_logic_vector (31 downto 0);
	signal SIGoffsetPC	: std_logic_vector (31 downto 0);
	signal SIGoffsetsignPC: std_logic;
	signal SIGprogcounter: std_logic_vector (31 downto 0);
	-- instruction decoder
--	signal SIGopcode 		: std_logic_vector (6 downto 0);
	signal SIGimmSel 		: std_logic;
	signal SIGrdID 			: std_logic_vector (4 downto 0);
	signal SIGrdRF 			: std_logic_vector (4 downto 0);
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
	signal SIGfunct7ALU	: std_logic;
	signal SIGeqALU		: std_logic;
	signal SIGinfALU		: std_logic;
	signal SIGsupALU		: std_logic;
	signal SIGinfUALU		: std_logic;
	signal SIGsupUALU		: std_logic;
	
begin
	-- BEGIN

	-- ALL
	-- program counter
	PROCprogcounter				<=	SIGprogcounter;
	SIGoffsetsignPC				<= 	SIGimm21J(20);
	SIGoffsetPC1 				<= 	SIGimm32U when SIGauipc = '1' else
							SIGoutputALU when SIGjalr = '1' else
							(others => '0');
	SIGoffsetPC2(20 downto 0) <= 	SIGimm21J;
	SIGoffsetPC2(31 downto 21) <= 	(others => '1') when SIGoffsetsignPC = '1' else
					(others => '0');
	SIGoffsetPC3(12 downto 0)<=	SIGimm13B;
	SIGoffsetPC3(31 downto 13)<=	(others => '1') when SIGoffsetsignPC = '1' else
					(others => '0');
	SIGoffsetPC		<=	SIGoffsetPC1 when SIGauipc = '1' OR SIGjalr = '1' else
					SIGoffsetPC2 when SIGjal = '1' else
					SIGoffsetPC3 when SIGbranch = '1' else
					(others => '0');

	-- register file
	SIGrdRF		<= 	SIGrdID when (SIGbranch = '0' AND SIGstore = '0') else
				(others => '0');
	SIGinputRF 	<= 	PROCoutputDM when SIGload = '1' else
				std_logic_vector(unsigned(SIGprogcounter)+4) when (SIGjal = '1' OR SIGjalr = '1') else
				SIGimm32U when SIGlui = '1' else
								std_logic_vector(unsigned(SIGimm32U) + unsigned(SIGprogcounter)) when SIGauipc = '1' else
								SIGoutputALU 	when SIGstore = '0' else
								(others => '0');
	-- alu
	SIGfunct7ALU	<=	'0' when ((SIGfunct3ALU = "000" OR SIGfunct3ALU = "010" OR SIGfunct3ALU = "011" OR SIGfunct3ALU = "100" OR SIGfunct3ALU = "110" OR SIGfunct3ALU = "111") AND (SIGimmSel = '1' OR SIGload = '1' OR SIGstore = '1')) else
				SIGfunct7;
	SIGfunct3ALU 	<=	"000" when (SIGstore = '1' OR SIGload = '1') else
				SIGfunct3;
	SIGinput1ALU 	<= 	SIGoutput1RF;
	
	SIGinput2ALU(11 downto 0) <= 
	SIGimm12S(11 downto 0) when SIGstore = '1' else
	SIGimm12I(11 downto 0) when (SIGload = '1' OR SIGimmSel = '1' OR SIGjalr = '1') else
	SIGoutput2RF(11 downto 0);
	
	SIGinput2ALU(31 downto 12) <= 	
	(others => '0') when (SIGimmSel = '1' OR SIGload = '1' OR SIGstore = '1') AND SIGimm12I(11) = '0' else
	(others => '1') when (SIGimmSel = '1' OR SIGload = '1' OR SIGstore = '1') AND SIGimm12I(11) = '1' else
	SIGoutput2RF(31 downto 12);
	
	-- data memory
	PROCaddrDM 		<= 	SIGoutputALU;
	PROCinputDM 		<= 	SIGoutput2RF;
	PROCstore 		<= 	SIGstore;
	PROCload			<= 	SIGload;
	PROCfunct3		<=		SIGfunct3;
	
	-- INSTANCES
	instPC  : ProgramCounter
	port map(
		PCclock 			=> PROCclock,			
		PCreset 			=> PROCreset,			
		PCoffset 		=> SIGoffsetPC,--complex			
		PCoffsetsign 	=> SIGoffsetsignPC,--complex
		PCjal 			=> SIGjal,				
		PCjalr 			=> SIGjalr,			
		PCbranch 		=> SIGbranch, 		
		PCfunct3 		=> SIGfunct3,			
		PCauipc 			=> SIGauipc,			
		PCalueq 			=> SIGeqALU,			
		PCaluinf 		=> SIGinfALU,
		PCalusup		=> SIGsupALU,
		PCload 			=> SIGload, 
		PCaluinfU		=> SIGinfUALU,
		PCalusupU		=> SIGsupUALU,			
		PCprogcounter 	=> SIGprogcounter
		
	);
	
	instID  : InstructionDecoder
	port map(
		IDinstruction	=> PROCinstruction,
--		IDopcode			=> SIGopcode,
		IDimmSel			=> SIGimmSel,
		IDrd				=> SIGrdID,
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
		RFclock	=> PROCclock,
		RFreset	=> PROCreset,
		RFin		=> SIGinputRF,--complex
		RFrd		=> SIGrdRF,
		RFrs1		=> SIGrs1,
		RFrs2		=> SIGrs2,
		RFout1	=> SIGoutput1RF,--complex
		RFout2	=> SIGoutput2RF,--complex
		probeRFreg00	=> PROCreg00,
		probeRFreg01	=> PROCreg01,
		probeRFreg02	=> PROCreg02,
		probeRFreg03	=> PROCreg03,
		probeRFreg04	=> PROCreg04,
		probeRFreg05	=> PROCreg05,
		probeRFreg06	=> PROCreg06,
		probeRFreg07	=> PROCreg07,
		probeRFreg08	=> PROCreg08,
		probeRFreg09	=> PROCreg09,
		probeRFreg0A	=> PROCreg0A,
		probeRFreg0B	=> PROCreg0B,
		probeRFreg0C	=> PROCreg0C,
		probeRFreg0D	=> PROCreg0D,
		probeRFreg0E	=> PROCreg0E,
		probeRFreg0F	=> PROCreg0F,
		probeRFreg10	=> PROCreg10,
		probeRFreg11	=> PROCreg11,
		probeRFreg12	=> PROCreg12,
		probeRFreg13	=> PROCreg13,
		probeRFreg14	=> PROCreg14,
		probeRFreg15	=> PROCreg15,
		probeRFreg16	=> PROCreg16,
		probeRFreg17	=> PROCreg17,
		probeRFreg18	=> PROCreg18,
		probeRFreg19	=> PROCreg19,
		probeRFreg1A	=> PROCreg1A,
		probeRFreg1B	=> PROCreg1B,
		probeRFreg1C	=> PROCreg1C,
		probeRFreg1D	=> PROCreg1D,
		probeRFreg1E	=> PROCreg1E,
		probeRFreg1F	=> PROCreg1F 
	);
	
	instALU : Alu
	port map(
		ALUin1 		=> SIGinput1ALU,--complex
		ALUin2 		=> SIGinput2ALU,--complex
		ALUfunct7 	=> SIGfunct7ALU,--chiant
		ALUfunct3	=> SIGfunct3ALU,
		ALUout 		=> SIGoutputALU,--complex
		ALUeq 		=> SIGeqALU,
		ALUinf 		=> SIGinfALU,
		ALUsup		=> SIGsupALU,
		ALUinfU		=> SIGinfUALU,
		ALUsupU		=> SIGsupUALU
	);
	
	-- END
end archi;
-- END FILE
