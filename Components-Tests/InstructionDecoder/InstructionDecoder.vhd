-- Ludovic Quiterio - Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity InstructionDecoder is
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
end entity;

-- ARCHITECTURE
architecture archi of InstructionDecoder is
begin
	--BEGIN
	-- opcode
	opcode(6 downto 0) 	<= instruction(6 downto 0);
	-- immediate operation selector
	immSel 			<= NOT instruction(5);
	-- register destination
	rd(4 downto 0) 		<= instruction(11 downto 7);
	-- register source 1
	rs1(4 downto 0) 	<= instruction(19 downto 15);
	-- register source 2
	rs2(4 downto 0) 	<= instruction(24 downto 20);
	-- funct 3
	funct3(2 downto 0) 	<= instruction(14 downto 12);
	-- funct7 bit 6
	funct7 			<= instruction(30);
	-- immediate value for I-type
	imm12I(11 downto 0) 	<= instruction(31 downto 20);
	-- immediate value for S-type
	imm12S(11 downto 5) 	<= instruction(31 downto 25);
	imm12S(4 downto 0) 	<= instruction(11 downto 7);
	-- immediate value for B-type
	imm13B(12) 		<= instruction(31);
	imm13B(11) 		<= instruction(7);
	imm13B(10 downto 5) 	<= instruction(30 downto 25);
	imm13B(4 downto 1) 	<= instruction(11 downto 8);
	imm13B(0) 		<= '0';
	-- immediate value for U-type
	imm32U(31 downto 12) <= instruction(31 downto 12);
	imm32U(11 downto 0) 	<= "000000000000";
	-- immediate value for J-type
	imm21J(20) 		<= instruction(31);
	imm21J(19 downto 12) 	<= instruction(19 downto 12);
	imm21J(11) 		<= instruction(20);
	imm21J(10 downto 1) 	<= instruction(30 downto 21);
	imm21J(0) 	<= '0';
	-- Load instruction ?
	Load 	<= '1' when  instruction(6 downto 0) = "0000011" else '0';
	-- Store instruction ?
	Store 	<= '1' when instruction(6 downto 0) = "0100011" else '0';
	-- LUI instruction ?
	LUI 	<= '1' when instruction(6 downto 0) = "0110111" else '0';
	-- AUIPC instruction ?
	AUIPC 	<= '1' when instruction(6 downto 0) = "0010111" else '0';
	-- JAL instruction ?
	JAL 	<= '1' when instruction(6 downto 0) = "1101111" else '0';
	-- JALR instruction ?
	JALR 	<= '1' when instruction(6 downto 0) = "1100111" else '0';
	-- Branch instruction ?
	Branch 	<= '1' when instruction(6 downto 0) = "1100011" else '0';
	-- END
end archi;
-- END FILE
