-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchAlu is
end entity;


architecture archi of TestBenchAlu is
	component Alu is
		port (
			-- INPUTS
		ALUin1 : in std_logic_vector (31 downto 0);
		ALUin2 : in std_logic_vector (31 downto 0);
		ALUfunct7 : in std_logic;
		ALUfunct3 : in std_logic_vector (2 downto 0);
		
		-- OUTPUTS
		ALUout : out std_logic_vector (31 downto 0);
		ALUsup : out std_logic;
		ALUeq : out std_logic;
		ALUinf : out std_logic;
		ALUcout : out std_logic
		);
	end component;

		signal SigALUIn1 : std_logic_vector (31 downto 0);
		signal SigALUIn2 : std_logic_vector (31 downto 0);
		signal SigFunct7 : std_logic;
		signal SigFunct3 : std_logic_vector (2 downto 0);
		signal SigALUOut : std_logic_vector (31 downto 0);
		signal SigALUSup : std_logic;
		signal SigALUEq : std_logic;
		signal SigALUInf : std_logic;
		signal SigCout : std_logic;

	begin
	stimuli_import : process
	begin
		-- ADD
		SigALUIn1 <= "00000000000000000000000000000100";
		SigALUIn2 <= "00000000000000000000000000000010";
		SigFunct7 <= '0';
		SigFunct3 <= "000";
		wait for 100ns;
		
		-- SOUSTRACTION
		SigALUIn1 <= "00000000000000000000000000001000";
		SigALUIn2 <= "00000000000000000000000000000100";
		SigFunct7 <= '1';
		SigFunct3 <= "000";
		wait for 100ns;
		SigALUIn1 <= "00000000000000000000000000000100";
		SigALUIn2 <= "00000000000000000000000000001000";
		SigFunct7 <= '1';
		SigFunct3 <= "000";
		wait for 100ns;
		
		-- SLL
		SigALUIn1 <= "00000000000000000000000000000011";
		SigALUIn2 <= "00000000000000000000000000000010";
		SigFunct3 <= "001";
		wait for 100ns;
		
		-- SRL
		SigALUIn1 <= "00000000000000000000000000110000";
		SigALUIn2 <= "00000000000000000000000000000001";
		SigFunct7 <= '0';
		SigFunct3 <= "101";
		wait for 100ns;
		
		-- SRA
		SigALUIn1 <= "00000000000000000000000000110000";
		SigALUIn2 <= "00000000000000000000000000000011";
		SigFunct7 <= '1';
		SigFunct3 <= "101";
		wait for 100ns;
		SigALUIn1 <= "11111111111111111111111111110000";
		SigALUIn2 <= "00000000000000000000000000000011";
		SigFunct7 <= '1';
		SigFunct3 <= "101";
		wait for 100ns;
		
		-- SLTU
		SigALUIn1 <= "00000000000000000000000000000100";
		SigALUIn2 <= "00000000000000000000000000000010";
		SigFunct7 <= '0';
		SigFunct3 <= "011";
		wait for 100ns;
		SigALUIn1 <= "00000000000000000000000000000010";
		SigALUIn2 <= "00000000000000000000000000000100";
		SigFunct7 <= '0';
		SigFunct3 <= "011";
		wait for 100ns;
		
		-- SLT
		SigALUIn1 <= "00000000000000000000000000000001";
		SigALUIn2 <= "11111111111111111111111111111111";
		SigFunct7 <= '0';
		SigFunct3 <= "010";
		wait for 100ns;
		SigALUIn1 <= "11111111111111111111111111111111";
		SigALUIn2 <= "00000000000000000000000000000001";
		SigFunct7 <= '0';
		SigFunct3 <= "010";
		wait for 100ns;
		
		-- AND gate
		SigALUIn1 <= "00000000000000000000000000000110";
		SigALUIn2 <= "00000000000000000000000000000101";
		SigFunct7 <= '0';
		SigFunct3 <= "111";
		wait for 100ns;
		
		-- OR gate
		SigALUIn1 <= "00000000000000000000000000000010";
		SigALUIn2 <= "00000000000000000000000000000101";
		SigFunct7 <= '0';
		SigFunct3 <= "110";
		wait for 100ns;
		
		-- XOR gate
		SigALUIn1 <= "00000000000000000000000000000100";
		SigALUIn2 <= "00000000000000000000000000000111";
		SigFunct7 <= '0';
		SigFunct3 <= "100";
		wait for 100ns;
	end process;

	i1 : Alu port map(ALUin1 => SigALUIn1, ALUin2 => SigALUIn2, ALUfunct7 => SigFunct7, ALUfunct3 => SigFunct3, 
							ALUout => SigALUOut, ALUsup => SigALUSup, ALUeq => SigALUEq, ALUinf => SigALUInf, ALUcout => SigCout);

end archi;
