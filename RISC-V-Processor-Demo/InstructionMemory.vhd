-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Instruction Memory VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity InstructionMemory is
	port (
		-- INPUTS
		IMclock			: in std_logic;
		IMreset			: in std_logic;
		IMprogcounter	: in std_logic_vector(31 downto 0);
		-- OUTPUTS
		IMout				: out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of InstructionMemory is
	type mem is array(0 to 1867) of std_logic_vector(7 downto 0);
	signal SigIMmemory : mem :=(
		 x"37", x"11", x"00", x"00",--00
		 x"ef", x"00", x"c0", x"00",
		 x"73", x"00", x"10", x"00",
		 x"6f", x"00", x"00", x"00",
		 x"13", x"01", x"01", x"ff",
		 x"23", x"26", x"11", x"00",
		 x"23", x"24", x"81", x"00",
		 x"13", x"04", x"01", x"01",
		 x"93", x"05", x"40", x"1f",
		 x"13", x"05", x"80", x"70",
		 x"ef", x"00", x"40", x"27",
		 x"13", x"00", x"00", x"00",
		 x"83", x"20", x"c1", x"00",
		 x"03", x"24", x"81", x"00",
		 x"13", x"01", x"01", x"01",
		 x"67", x"80", x"00", x"00",
		 x"13", x"01", x"01", x"fe",--10
		 x"23", x"2e", x"81", x"00",
		 x"13", x"04", x"01", x"02",
		 x"93", x"07", x"05", x"00",
		 x"a3", x"07", x"f4", x"fe",
		 x"83", x"47", x"f4", x"fe",
		 x"93", x"87", x"07", x"fe",
		 x"13", x"07", x"f0", x"03",
		 x"63", x"6c", x"f7", x"14",
		 x"13", x"97", x"27", x"00",
		 x"93", x"07", x"80", x"60",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"a7", x"07", x"00",
		 x"67", x"80", x"07", x"00",
		 x"93", x"07", x"30", x"00",
		 x"6f", x"00", x"00", x"14",
		 x"93", x"07", x"f0", x"09",--20
		 x"6f", x"00", x"80", x"13",
		 x"93", x"07", x"50", x"02",
		 x"6f", x"00", x"00", x"13",
		 x"93", x"07", x"d0", x"00",
		 x"6f", x"00", x"80", x"12",
		 x"93", x"07", x"90", x"09",
		 x"6f", x"00", x"00", x"12",
		 x"93", x"07", x"90", x"04",
		 x"6f", x"00", x"80", x"11",
		 x"93", x"07", x"10", x"04",
		 x"6f", x"00", x"00", x"11",
		 x"93", x"07", x"f0", x"01",
		 x"6f", x"00", x"80", x"10",
		 x"93", x"07", x"10", x"00",
		 x"6f", x"00", x"00", x"10",
		 x"93", x"07", x"90", x"00",
		 x"6f", x"00", x"80", x"0f",
		 x"93", x"07", x"10", x"01",
		 x"6f", x"00", x"00", x"0f",
		 x"93", x"07", x"10", x"0c",
		 x"6f", x"00", x"80", x"0e",
		 x"93", x"07", x"30", x"06",
		 x"6f", x"00", x"00", x"0e",
		 x"93", x"07", x"50", x"08",
		 x"6f", x"00", x"80", x"0d",
		 x"93", x"07", x"10", x"06",
		 x"6f", x"00", x"00", x"0d",
		 x"93", x"07", x"10", x"07",
		 x"6f", x"00", x"80", x"0c",
		 x"93", x"07", x"30", x"04",
		 x"6f", x"00", x"00", x"0c",
		 x"93", x"07", x"10", x"0d",
		 x"6f", x"00", x"80", x"0b",
		 x"93", x"07", x"f0", x"0d",
		 x"6f", x"00", x"00", x"0b",
		 x"93", x"07", x"70", x"08",
		 x"6f", x"00", x"80", x"0a",
		 x"93", x"07", x"10", x"05",
		 x"6f", x"00", x"00", x"0a",
		 x"93", x"07", x"30", x"0e",
		 x"6f", x"00", x"80", x"09",
		 x"93", x"07", x"50", x"05",
		 x"6f", x"00", x"00", x"09",
		 x"93", x"07", x"50", x"0d",
		 x"6f", x"00", x"80", x"08",
		 x"93", x"07", x"50", x"0c",
		 x"6f", x"00", x"00", x"08",
		 x"93", x"07", x"10", x"03",
		 x"6f", x"00", x"80", x"07",
		 x"93", x"07", x"90", x"01",
		 x"6f", x"00", x"00", x"07",
		 x"93", x"07", x"50", x"0f",
		 x"6f", x"00", x"80", x"06",
		 x"93", x"07", x"90", x"04",
		 x"6f", x"00", x"00", x"06",
		 x"93", x"07", x"10", x"0e",
		 x"6f", x"00", x"80", x"05",
		 x"93", x"07", x"30", x"0c",
		 x"6f", x"00", x"00", x"05",
		 x"93", x"07", x"d0", x"0a",
		 x"6f", x"00", x"80", x"04",
		 x"93", x"07", x"90", x"0a",
		 x"6f", x"00", x"00", x"04",
		 x"93", x"07", x"10", x"09",
		 x"6f", x"00", x"80", x"03",
		 x"93", x"07", x"90", x"08",
		 x"6f", x"00", x"00", x"03",
		 x"93", x"07", x"50", x"02",
		 x"6f", x"00", x"80", x"02",
		 x"93", x"07", x"f0", x"0f",
		 x"6f", x"00", x"00", x"02",
		 x"93", x"07", x"e0", x"0f",
		 x"6f", x"00", x"80", x"01",
		 x"93", x"07", x"d0", x"0f",
		 x"6f", x"00", x"00", x"01",
		 x"93", x"07", x"f0", x"0e",
		 x"6f", x"00", x"80", x"00",
		 x"93", x"07", x"f0", x"07",
		 x"13", x"85", x"07", x"00",
		 x"03", x"24", x"c1", x"01",
		 x"13", x"01", x"01", x"02",
		 x"67", x"80", x"00", x"00",
		 x"13", x"01", x"01", x"fe",
		 x"23", x"2e", x"81", x"00",
		 x"13", x"04", x"01", x"02",
		 x"b7", x"07", x"00", x"80",
		 x"93", x"87", x"17", x"00",
		 x"83", x"a7", x"07", x"00",
		 x"23", x"26", x"f4", x"fe",
		 x"83", x"27", x"c4", x"fe",
		 x"13", x"85", x"07", x"00",
		 x"03", x"24", x"c1", x"01",
		 x"13", x"01", x"01", x"02",
		 x"67", x"80", x"00", x"00",
		 x"13", x"01", x"01", x"fd",
		 x"23", x"26", x"81", x"02",
		 x"13", x"04", x"01", x"03",
		 x"23", x"2e", x"a4", x"fc",
		 x"03", x"27", x"c4", x"fd",
		 x"93", x"07", x"07", x"00",
		 x"93", x"97", x"17", x"00",
		 x"b3", x"87", x"e7", x"00",
		 x"93", x"96", x"67", x"00",
		 x"b3", x"87", x"d7", x"00",
		 x"93", x"97", x"27", x"00",
		 x"b3", x"87", x"e7", x"00",
		 x"93", x"97", x"27", x"00",
		 x"b3", x"87", x"e7", x"00",
		 x"93", x"97", x"47", x"00",
		 x"23", x"26", x"f4", x"fe",
		 x"83", x"27", x"c4", x"fe",
		 x"13", x"85", x"07", x"00",
		 x"03", x"24", x"c1", x"02",
		 x"13", x"01", x"01", x"03",
		 x"67", x"80", x"00", x"00",
		 x"13", x"01", x"01", x"fd",
		 x"23", x"26", x"81", x"02",
		 x"13", x"04", x"01", x"03",
		 x"23", x"2e", x"a4", x"fc",
		 x"23", x"26", x"04", x"fe",
		 x"6f", x"00", x"00", x"01",
		 x"83", x"27", x"c4", x"fe",
		 x"93", x"87", x"17", x"00",
		 x"23", x"26", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fd",
		 x"83", x"27", x"c4", x"fe",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"e3", x"92", x"07", x"fe",
		 x"83", x"27", x"c4", x"fe",
		 x"13", x"85", x"07", x"00",
		 x"03", x"24", x"c1", x"02",
		 x"13", x"01", x"01", x"03",
		 x"67", x"80", x"00", x"00",
		 x"13", x"01", x"01", x"fc",
		 x"23", x"2e", x"11", x"02",
		 x"23", x"2c", x"81", x"02",
		 x"23", x"2a", x"91", x"02",
		 x"13", x"04", x"01", x"04",
		 x"23", x"26", x"a4", x"fc",
		 x"23", x"24", x"b4", x"fc",
		 x"83", x"27", x"84", x"fc",
		 x"13", x"85", x"07", x"00",
		 x"ef", x"f0", x"df", x"f3",
		 x"23", x"2e", x"a4", x"fc",
		 x"b7", x"07", x"00", x"80",
		 x"93", x"87", x"27", x"00",
		 x"13", x"07", x"f0", x"ff",
		 x"23", x"a0", x"e7", x"00",
		 x"b7", x"07", x"00", x"80",
		 x"93", x"87", x"37", x"00",
		 x"13", x"07", x"f0", x"ff",
		 x"23", x"a0", x"e7", x"00",
		 x"03", x"25", x"c4", x"fc",
		 x"ef", x"f0", x"5f", x"f6",
		 x"23", x"2c", x"a4", x"fc",
		 x"23", x"24", x"04", x"fe",
		 x"6f", x"00", x"c0", x"03",
		 x"03", x"27", x"c4", x"fc",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c6", x"07", x"00",
		 x"03", x"27", x"c4", x"fc",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"04", x"f7", x"00",
		 x"13", x"85", x"06", x"00",
		 x"ef", x"f0", x"5f", x"d2",
		 x"93", x"07", x"05", x"00",
		 x"23", x"80", x"f4", x"00",
		 x"83", x"27", x"84", x"fe",
		 x"93", x"87", x"17", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"84", x"fe",
		 x"83", x"27", x"84", x"fd",
		 x"e3", x"60", x"f7", x"fc",
		 x"23", x"26", x"04", x"fe",
		 x"6f", x"00", x"80", x"29",
		 x"ef", x"f0", x"5f", x"e8",
		 x"13", x"07", x"05", x"00",
		 x"83", x"27", x"c4", x"fd",
		 x"b3", x"87", x"e7", x"00",
		 x"23", x"2a", x"f4", x"fc",
		 x"13", x"00", x"00", x"00",
		 x"ef", x"f0", x"df", x"e6",
		 x"13", x"07", x"05", x"00",
		 x"83", x"27", x"44", x"fd",
		 x"e3", x"6a", x"f7", x"fe",
		 x"93", x"07", x"60", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"0e", x"f7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"f4", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"93", x"97", x"87", x"00",
		 x"23", x"20", x"f4", x"fe",
		 x"6f", x"00", x"00", x"01",
		 x"b7", x"07", x"01", x"00",
		 x"93", x"87", x"07", x"f0",
		 x"23", x"20", x"f4", x"fe",
		 x"93", x"07", x"50", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"02", x"f7", x"04",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"f8", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",--100 256
		 x"83", x"c7", x"07", x"00",
		 x"13", x"87", x"07", x"00",
		 x"83", x"27", x"04", x"fe",
		 x"b3", x"e7", x"e7", x"00",
		 x"23", x"20", x"f4", x"fe",
		 x"6f", x"00", x"00", x"01",
		 x"83", x"27", x"04", x"fe",
		 x"93", x"e7", x"f7", x"0f",
		 x"23", x"20", x"f4", x"fe",
		 x"93", x"07", x"40", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"0e", x"f7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"f4", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"93", x"97", x"87", x"01",
		 x"23", x"22", x"f4", x"fe",
		 x"6f", x"00", x"c0", x"00",
		 x"b7", x"07", x"00", x"ff",
		 x"23", x"22", x"f4", x"fe",
		 x"93", x"07", x"30", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"04", x"f7", x"04",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"fa", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"93", x"97", x"07", x"01",
		 x"13", x"87", x"07", x"00",
		 x"83", x"27", x"44", x"fe",
		 x"b3", x"e7", x"e7", x"00",
		 x"23", x"22", x"f4", x"fe",
		 x"6f", x"00", x"40", x"01",
		 x"03", x"27", x"44", x"fe",
		 x"b7", x"07", x"ff", x"00",
		 x"b3", x"67", x"f7", x"00",
		 x"23", x"22", x"f4", x"fe",
		 x"93", x"07", x"20", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"04", x"f7", x"04",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"fa", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"93", x"97", x"87", x"00",
		 x"13", x"87", x"07", x"00",
		 x"83", x"27", x"44", x"fe",
		 x"b3", x"e7", x"e7", x"00",
		 x"23", x"22", x"f4", x"fe",
		 x"6f", x"00", x"80", x"01",
		 x"03", x"27", x"44", x"fe",
		 x"b7", x"07", x"01", x"00",
		 x"93", x"87", x"07", x"f0",
		 x"b3", x"67", x"f7", x"00",
		 x"23", x"22", x"f4", x"fe",
		 x"93", x"07", x"10", x"00",
		 x"23", x"24", x"f4", x"fe",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"63", x"02", x"f7", x"04",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"84", x"fd",
		 x"63", x"f8", x"e7", x"02",
		 x"03", x"27", x"c4", x"fe",
		 x"83", x"27", x"84", x"fe",
		 x"b3", x"07", x"f7", x"40",
		 x"03", x"27", x"c4", x"fc",
		 x"b3", x"07", x"f7", x"00",
		 x"83", x"c7", x"07", x"00",
		 x"13", x"87", x"07", x"00",
		 x"83", x"27", x"44", x"fe",
		 x"b3", x"e7", x"e7", x"00",
		 x"23", x"22", x"f4", x"fe",
		 x"6f", x"00", x"00", x"01",
		 x"83", x"27", x"44", x"fe",
		 x"93", x"e7", x"f7", x"0f",
		 x"23", x"22", x"f4", x"fe",
		 x"b7", x"07", x"00", x"80",
		 x"93", x"87", x"27", x"00",
		 x"03", x"27", x"44", x"fe",
		 x"23", x"a0", x"e7", x"00",
		 x"b7", x"07", x"00", x"80",
		 x"93", x"87", x"37", x"00",
		 x"03", x"27", x"04", x"fe",
		 x"23", x"a0", x"e7", x"00",
		 x"83", x"27", x"c4", x"fe",
		 x"93", x"87", x"17", x"00",
		 x"23", x"26", x"f4", x"fe",
		 x"83", x"27", x"84", x"fd",
		 x"93", x"87", x"67", x"00",
		 x"03", x"27", x"c4", x"fe",
		 x"e3", x"60", x"f7", x"d6",
		 x"13", x"00", x"00", x"00",
		 x"13", x"00", x"00", x"00",
		 x"83", x"20", x"c1", x"03",
		 x"03", x"24", x"81", x"03",
		 x"83", x"24", x"41", x"03",
		 x"13", x"01", x"01", x"04",
		 x"67", x"80", x"00", x"00",
		 x"98", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"a8", x"01", x"00", x"00",
		 x"a0", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"78", x"00", x"00", x"00",
		 x"80", x"00", x"00", x"00",
		 x"88", x"00", x"00", x"00",
		 x"90", x"00", x"00", x"00",
		 x"98", x"00", x"00", x"00",
		 x"a0", x"00", x"00", x"00",
		 x"a8", x"00", x"00", x"00",
		 x"b0", x"00", x"00", x"00",
		 x"b8", x"00", x"00", x"00",
		 x"c0", x"00", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"c8", x"00", x"00", x"00",
		 x"d0", x"00", x"00", x"00",
		 x"d8", x"00", x"00", x"00",
		 x"e0", x"00", x"00", x"00",
		 x"e8", x"00", x"00", x"00",
		 x"f0", x"00", x"00", x"00",
		 x"f8", x"00", x"00", x"00",
		 x"00", x"01", x"00", x"00",
		 x"08", x"01", x"00", x"00",
		 x"10", x"01", x"00", x"00",
		 x"18", x"01", x"00", x"00",
		 x"20", x"01", x"00", x"00",
		 x"28", x"01", x"00", x"00",
		 x"30", x"01", x"00", x"00",
		 x"38", x"01", x"00", x"00",
		 x"40", x"01", x"00", x"00",
		 x"48", x"01", x"00", x"00",
		 x"50", x"01", x"00", x"00",
		 x"58", x"01", x"00", x"00",
		 x"60", x"01", x"00", x"00",
		 x"68", x"01", x"00", x"00",
		 x"70", x"01", x"00", x"00",
		 x"78", x"01", x"00", x"00",
		 x"80", x"01", x"00", x"00",
		 x"88", x"01", x"00", x"00",
		 x"90", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b8", x"01", x"00", x"00",
		 x"b0", x"01", x"00", x"00",
		 x"50", x"52", x"4f", x"43",
		 x"2d", x"45", x"43", x"45",
		 x"20", x"2d", x"20", x"4c",
		 x"55", x"44", x"4f", x"56",
		 x"49", x"43", x"20", x"2d",
		 x"20", x"50", x"41", x"55",
		 x"4c", x"20", x"2d", x"20",
		 x"4a", x"55", x"4c", x"49",
		 x"45", x"54", x"54", x"45",
		 x"20", x"2d", x"20", x"51",
		 x"55", x"45", x"4e", x"54",
		 x"49", x"4e", x"20", x"2d",
		 x"20", x"59", x"4f", x"55",
		 x"53", x"53", x"4f", x"55",
		 x"50", x"48", x"20", x"2d",
		 x"20", x"50", x"49", x"45",
		 x"52", x"52", x"45", x"00"
   );
	
	signal SigIMprogcounter00 : integer;
	signal SigIMprogcounter08 : integer;
	signal SigIMprogcounter16 : integer;
	signal SigIMprogcounter24 : integer;
	
begin
	-- BEGIN
	
	-- program counter to integer
	p1 : process(IMprogcounter)
	begin
		SigIMprogcounter00 <= to_integer(unsigned(IMprogcounter));
		SigIMprogcounter08 <= to_integer(unsigned(IMprogcounter)) + 1;
		SigIMprogcounter16 <= to_integer(unsigned(IMprogcounter)) + 2;
		SigIMprogcounter24 <= to_integer(unsigned(IMprogcounter)) + 3;
	end process;
	
	-- instruction out
	p2 : process(IMreset, IMclock)
	begin
		if(IMreset = '1') then
			SigIMmemory(0 to 255) <= (others => "00000000");
		elsif(IMreset = '0') then
			if(rising_edge(IMclock)) then
				IMout(7 downto 0) <= SigIMmemory(SigIMprogcounter00);
				IMout(15 downto 8) <= SigIMmemory(SigIMprogcounter08);
				IMout(23 downto 16) <= SigIMmemory(SigIMprogcounter16);
				IMout(31 downto 24) <= SigIMmemory(SigIMprogcounter24);
			end if;
		end if;
	end process;
	
	-- END
end archi;
-- END FILE

