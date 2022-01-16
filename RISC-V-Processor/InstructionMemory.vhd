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
	type mem is array(0 to 255) of std_logic_vector(7 downto 0);
	signal SigIMmemory : mem :=(
		x"01",x"02",x"03",x"04",-- 0x00: 
		x"11",x"12",x"13",x"14",-- 0x04: 
		x"21",x"22",x"23",x"24",-- 0x08: 
		x"31",x"32",x"33",x"34",-- 0x0C: 
		x"41",x"42",x"43",x"44",-- 0x10: 
		x"51",x"52",x"53",x"54",-- 0x14: 
		x"61",x"62",x"63",x"64",-- 0x18: 
		x"71",x"72",x"73",x"74",-- 0x1C: 
		x"81",x"82",x"83",x"84",-- 0x20: 
		x"91",x"92",x"93",x"94",-- 0x24: 
		x"A1",x"A2",x"A3",x"A4",-- 0x28: 
		x"B1",x"B2",x"B3",x"B4",-- 0x2C: 
		x"C1",x"C2",x"C3",x"C4",-- 0x30: 
		x"D1",x"D2",x"D3",x"D4",-- 0x34: 
		x"E1",x"E2",x"E3",x"E4",-- 0x38: 
		x"F1",x"F2",x"F3",x"F4",-- 0x3C: 
		x"00",x"00",x"00",x"00",-- 0x40:
		x"00",x"00",x"00",x"00",-- 0x44: 
		x"00",x"00",x"00",x"00",-- 0x48: 
		x"00",x"00",x"00",x"00",-- 0x4C: 
		x"00",x"00",x"00",x"00",-- 0x50: 
		x"00",x"00",x"00",x"00",-- 0x54: 
		x"00",x"00",x"00",x"00",-- 0x58: 
		x"00",x"00",x"00",x"00",-- 0x5C: 
		x"00",x"00",x"00",x"00",-- 0x60:
		x"00",x"00",x"00",x"00",-- 0x64:
		x"00",x"00",x"00",x"00",-- 0x68:
		x"00",x"00",x"00",x"00",-- 0x6C:
		x"00",x"00",x"00",x"00",-- 0x70:
		x"00",x"00",x"00",x"00",-- 0x74:
		x"00",x"00",x"00",x"00",-- 0x78:
		x"00",x"00",x"00",x"00",-- 0x7C:
		x"00",x"00",x"00",x"00",-- 0x80:
		x"00",x"00",x"00",x"00",-- 0x84:
		x"00",x"00",x"00",x"00",-- 0x88:
		x"00",x"00",x"00",x"00",-- 0x8C:
		x"00",x"00",x"00",x"00",-- 0x90:
		x"00",x"00",x"00",x"00",-- 0x94:
		x"00",x"00",x"00",x"00",-- 0x98:
		x"00",x"00",x"00",x"00",-- 0x9C:
		x"00",x"00",x"00",x"00",-- 0xA0:
		x"00",x"00",x"00",x"00",-- 0xA4:
		x"00",x"00",x"00",x"00",-- 0xA8:
		x"00",x"00",x"00",x"00",-- 0xAC:
		x"00",x"00",x"00",x"00",-- 0xB0:
		x"00",x"00",x"00",x"00",-- 0xB4:
		x"00",x"00",x"00",x"00",-- 0xB8:
		x"00",x"00",x"00",x"00",-- 0xBC:
		x"00",x"00",x"00",x"00",-- 0xC0:
		x"00",x"00",x"00",x"00",-- 0xC4:
		x"00",x"00",x"00",x"00",-- 0xC8:
		x"00",x"00",x"00",x"00",-- 0xCC:
		x"00",x"00",x"00",x"00",-- 0xD0:
		x"00",x"00",x"00",x"00",-- 0xD4:
		x"00",x"00",x"00",x"00",-- 0xD8:
		x"00",x"00",x"00",x"00",-- 0xDC:
		x"00",x"00",x"00",x"00",-- 0xE0:
		x"00",x"00",x"00",x"00",-- 0xE4:
		x"00",x"00",x"00",x"00",-- 0xE8:
		x"00",x"00",x"00",x"00",-- 0xEC:
		x"00",x"00",x"00",x"00",-- 0xF0:
		x"00",x"00",x"00",x"00",-- 0xF4:
		x"00",x"00",x"00",x"00",-- 0xF8:
		x"00",x"00",x"00",x"00" -- 0xFC:
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

