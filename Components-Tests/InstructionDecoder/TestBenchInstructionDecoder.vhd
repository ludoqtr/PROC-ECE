-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchInstructionDecoder is
end entity;


architecture archi of TestBenchInstructionDecoder is
	component InstructionDecoder is
		port (
			-- INPUTS
			-- instruction endianness must be Big Endian !
			instruction : in std_logic_vector (31 downto 0);
			-- OUTPUTS
			opcode : out std_logic_vector (6 downto 0);
			immSel : out std_logic;
			rd : out std_logic_vector (4 downto 0);
			rs1 : out std_logic_vector (4 downto 0);
			rs2 : out std_logic_vector (4 downto 0);
			funct3 : out std_logic_vector (2 downto 0);
			funct7 : out std_logic;
			imm12I : out std_logic_vector (11 downto 0);
			imm12S : out std_logic_vector (11 downto 0);
			imm13B : out std_logic_vector (12 downto 0);
			imm32U : out std_logic_vector (31 downto 0);
			imm21J : out std_logic_vector (20 downto 0);
			Load : out std_logic;
			Store : out std_logic;
			LUI : out std_logic;
			AUIPC : out std_logic;
			JAL : out std_logic;
			JALR : out std_logic;
			Branch : out std_logic
		);
	end component;
	
signal SigInstruction : std_logic_vector (31 downto 0);
signal SigOpcode : std_logic_vector(6 downto 0);
	begin
	stimuli_import : process
	begin
		-- ADD 2 et 3
		SigInstruction <= "00000000001000011000000010110011";
		wait for 100ns;
		-- AND 
		SigInstruction <= "00000001101101010111000100110011";
		wait for 100ns;
		-- LUI
		SigInstruction <= "00000000000000000011000110110111";
		wait for 100ns;
		--Load Byte
		SigInstruction <= "00000000001100001000001000000011";
		wait for 100ns;
		--Store Byte
		SigInstruction <= "00000110000100011000001000010011";
		wait for 100ns;
	end process;

	i1 : InstructionDecoder port map(instruction => SigInstruction, opcode => SigOpcode);

end archi;
