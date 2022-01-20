-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Alu VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity Alu is
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
end entity;

-- ARCHITECTURE
architecture archi of Alu is

	signal ALUin2sig : std_logic_vector(31 downto 0);
	signal ALUin2int : integer;
	
	signal ALUsum : std_logic_vector(31 downto 0);
	signal ALUsub : std_logic_vector(31 downto 0);
	signal ALUsll : std_logic_vector(31 downto 0);
	signal ALUsrl : std_logic_vector(31 downto 0);
	signal ALUsra : std_logic_vector(31 downto 0);
	signal ALUslt : std_logic_vector(31 downto 0);
	signal ALUand : std_logic_vector(31 downto 0);
	signal ALUor  : std_logic_vector(31 downto 0);
	signal ALUxor : std_logic_vector(31 downto 0);
	
begin
	
	-- useful signals
	ALUin2sig <= std_logic_vector(ALUin2);
	ALUin2int <= to_integer(unsigned(ALUin2sig));
	
	-- sum
	ALUsum <= std_logic_vector(unsigned(ALUin1) + unsigned(ALUin2));
	-- sub
	ALUsub <= std_logic_vector(unsigned(ALUin1) + unsigned(not ALUin2) + 1);
	-- sll
	ALUsll <= std_logic_vector(shift_left(unsigned(ALUin1), ALUin2int));
	-- srl
	ALUsrl <= std_logic_vector(shift_right(unsigned(ALUin1), ALUin2int));
	-- sra
	ALUsra <= to_stdlogicvector(to_bitvector(ALUin1) sra ALUin2int);
	-- slt signed and unsigned
	ALUslt <= 	"00000000000000000000000000000001" when ((unsigned(ALUIn1) < unsigned(ALUIn2)) AND ALUfunct3 = "011")
			else "00000000000000000000000000000001" when ((signed(ALUIn1) < signed(ALUIn2)) AND ALUfunct3 = "010")
			else (others => '0');
	-- and
	ALUand <= ALUin1 AND ALUin2;
	-- or
	ALUor  <= ALUin1 OR ALUin2;
	-- xor
	ALUxor <= ALUin1 XOR ALUin2;
	
	-- outputs
	ALUout <= 	  ALUsum when (ALUfunct3(2 downto 0) = "000" and ALUfunct7 = '0')		-- ADD
				else ALUsub when (ALUfunct3(2 downto 0) = "000" and ALUfunct7 = '1')	-- SUB
				else ALUsll when (ALUfunct3(2 downto 0) = "001") 			-- SLL															
				else ALUslt when (ALUfunct3(2 downto 1) = "01") 			-- SLT
				else ALUxor when (ALUfunct3(2 downto 0) = "100")			-- XOR
				else ALUsrl when (ALUfunct3(2 downto 0) = "101" and ALUfunct7 = '0') 	-- SRL
				else ALUsra when (ALUfunct3(2 downto 0) = "101" and ALUfunct7 = '1') 	-- SRA
				else ALUor  when (ALUfunct3(2 downto 0) = "110") 			-- OR
				else ALUand when (ALUfunct3(2 downto 0) = "111") 			-- AND
				else (others =>'0');
	
	ALUSup <= '1' when (unsigned(ALUIn1) > unsigned(ALUIn2)) else '0';
	ALUInf <= '1' when (unsigned(ALUIn1) < unsigned(ALUIn2)) else '0';
	ALUEq <= '1' when (unsigned(ALUIn1) = unsigned(ALUIn2)) else '0';
	
end archi;
