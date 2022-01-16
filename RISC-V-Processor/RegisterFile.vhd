-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Register File VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity RegisterFile is
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
		RFreg00	: inout std_logic_vector(31 downto 0);
		RFreg01	: inout std_logic_vector(31 downto 0);
		RFreg02	: inout std_logic_vector(31 downto 0);
		RFreg03	: inout std_logic_vector(31 downto 0);
		RFreg04	: inout std_logic_vector(31 downto 0);
		RFreg05	: inout std_logic_vector(31 downto 0);
		RFreg06	: inout std_logic_vector(31 downto 0);
		RFreg07	: inout std_logic_vector(31 downto 0);
		RFreg08	: inout std_logic_vector(31 downto 0);
		RFreg09	: inout std_logic_vector(31 downto 0);
		RFreg0A	: inout std_logic_vector(31 downto 0);
		RFreg0B	: inout std_logic_vector(31 downto 0);
		RFreg0C	: inout std_logic_vector(31 downto 0);
		RFreg0D	: inout std_logic_vector(31 downto 0);
		RFreg0E	: inout std_logic_vector(31 downto 0);
		RFreg0F	: inout std_logic_vector(31 downto 0);
		RFreg10	: inout std_logic_vector(31 downto 0);
		RFreg11	: inout std_logic_vector(31 downto 0);
		RFreg12	: inout std_logic_vector(31 downto 0);
		RFreg13	: inout std_logic_vector(31 downto 0);
		RFreg14	: inout std_logic_vector(31 downto 0);
		RFreg15	: inout std_logic_vector(31 downto 0);
		RFreg16	: inout std_logic_vector(31 downto 0);
		RFreg17	: inout std_logic_vector(31 downto 0);
		RFreg18	: inout std_logic_vector(31 downto 0);
		RFreg19	: inout std_logic_vector(31 downto 0);
		RFreg1A	: inout std_logic_vector(31 downto 0);
		RFreg1B	: inout std_logic_vector(31 downto 0);
		RFreg1C	: inout std_logic_vector(31 downto 0);
		RFreg1D	: inout std_logic_vector(31 downto 0);
		RFreg1E	: inout std_logic_vector(31 downto 0);
		RFreg1F	: inout std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of RegisterFile is
begin
	--BEGIN
	-- output 1
	RFout1 	<= RFreg00 WHEN RFrs1 = "00000"
	else RFreg01 WHEN RFrs1 = "00001"
	else RFreg02 WHEN RFrs1 = "00010"
	else RFreg03 WHEN RFrs1 = "00011"
	else RFreg04 WHEN RFrs1 = "00100"
	else RFreg05 WHEN RFrs1 = "00101"
	else RFreg06 WHEN RFrs1 = "00110"
	else RFreg07 WHEN RFrs1 = "00111"
	else RFreg08 WHEN RFrs1 = "01000"
	else RFreg09 WHEN RFrs1 = "01001"
	else RFreg0A WHEN RFrs1 = "01010"
	else RFreg0B WHEN RFrs1 = "01011"
	else RFreg0C WHEN RFrs1 = "01100"
	else RFreg0D WHEN RFrs1 = "01101"
	else RFreg0E WHEN RFrs1 = "01110"
	else RFreg0F WHEN RFrs1 = "01111"
	else RFreg10 WHEN RFrs1 = "10000"
	else RFreg11 WHEN RFrs1 = "10001"
	else RFreg12 WHEN RFrs1 = "10010"
	else RFreg13 WHEN RFrs1 = "10011"
	else RFreg14 WHEN RFrs1 = "10100"
	else RFreg15 WHEN RFrs1 = "10101"
	else RFreg16 WHEN RFrs1 = "10110"
	else RFreg17 WHEN RFrs1 = "10111"
	else RFreg18 WHEN RFrs1 = "11000"
	else RFreg19 WHEN RFrs1 = "11001"
	else RFreg1A WHEN RFrs1 = "11010"
	else RFreg1B WHEN RFrs1 = "11011"
	else RFreg1C WHEN RFrs1 = "11100"
	else RFreg1D WHEN RFrs1 = "11101"
	else RFreg1E WHEN RFrs1 = "11110"
	else RFreg1F WHEN RFrs1 = "11111"
	else (others => '0');
	-- output 1
	RFout2 	<= RFreg00 WHEN RFrs2 = "00000"
	else RFreg01 WHEN RFrs2 = "00001"
	else RFreg02 WHEN RFrs2 = "00010"
	else RFreg03 WHEN RFrs2 = "00011"
	else RFreg04 WHEN RFrs2 = "00100"
	else RFreg05 WHEN RFrs2 = "00101"
	else RFreg06 WHEN RFrs2 = "00110"
	else RFreg07 WHEN RFrs2 = "00111"
	else RFreg08 WHEN RFrs2 = "01000"
	else RFreg09 WHEN RFrs2 = "01001"
	else RFreg0A WHEN RFrs2 = "01010"
	else RFreg0B WHEN RFrs2 = "01011"
	else RFreg0C WHEN RFrs2 = "01100"
	else RFreg0D WHEN RFrs2 = "01101"
	else RFreg0E WHEN RFrs2 = "01110"
	else RFreg0F WHEN RFrs2 = "01111"
	else RFreg10 WHEN RFrs2 = "10000"
	else RFreg11 WHEN RFrs2 = "10001"
	else RFreg12 WHEN RFrs2 = "10010"
	else RFreg13 WHEN RFrs2 = "10011"
	else RFreg14 WHEN RFrs2 = "10100"
	else RFreg15 WHEN RFrs2 = "10101"
	else RFreg16 WHEN RFrs2 = "10110"
	else RFreg17 WHEN RFrs2 = "10111"
	else RFreg18 WHEN RFrs2 = "11000"
	else RFreg19 WHEN RFrs2 = "11001"
	else RFreg1A WHEN RFrs2 = "11010"
	else RFreg1B WHEN RFrs2 = "11011"
	else RFreg1C WHEN RFrs2 = "11100"
	else RFreg1D WHEN RFrs2 = "11101"
	else RFreg1E WHEN RFrs2 = "11110"
	else RFreg1F WHEN RFrs2 = "11111"
	else (others => '0');
	-- registers update on clock event and with rd
	RFreg00	<= (others => '0');
	RFreg01	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00001")
	else RFreg01;
	RFreg02	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00010") 
	else RFreg02;
	RFreg03	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00011") 
	else RFreg03;
	RFreg04	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00100") 
	else RFreg04;
	RFreg05	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00101") 
	else RFreg05;
	RFreg06	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00110") 
	else RFreg06;
	RFreg07	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "00111") 
	else RFreg07;
	RFreg08	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01000") 
	else RFreg08;
	RFreg09	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01001") 
	else RFreg09;
	RFreg0A	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01010") 
	else RFreg0A;
	RFreg0B	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01011") 
	else RFreg0B;
	RFreg0C	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01100") 
	else RFreg0C;
	RFreg0D	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01101") 
	else RFreg0D;
	RFreg0E	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01110") 
	else RFreg0E;
	RFreg0F	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "01111") 
	else RFreg0F;
	RFreg10	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10000") 
	else RFreg10;
	RFreg11	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10001") 
	else RFreg11;
	RFreg12	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10010") 
	else RFreg12;
	RFreg13	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10011") 
	else RFreg13;
	RFreg14	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10100") 
	else RFreg14;
	RFreg15	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10101") 
	else RFreg15;
	RFreg16	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10110") 
	else RFreg16;
	RFreg17	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "10111") 
	else RFreg17;
	RFreg18	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11000") 
	else RFreg18;
	RFreg19	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11001") 
	else RFreg19;
	RFreg1A	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11010") 
	else RFreg1A;
	RFreg1B	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11011") 
	else RFreg1B;
	RFreg1C	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11100") 
	else RFreg1C;
	RFreg1D	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11101") 
	else RFreg1D;
	RFreg1E	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11110") 
	else RFreg1E;
	RFreg1F	<= (others => '0') WHEN (RFreset = '1')
	else RFin WHEN (RFclock'event AND RFclock = '1' AND RFrd = "11111") 
	else RFreg1F;
	-- END
end archi;
-- END FILE