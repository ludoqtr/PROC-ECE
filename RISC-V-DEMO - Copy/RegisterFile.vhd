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
end entity;

-- ARCHITECTURE
architecture archi of RegisterFile is

		signal RFreg00	:  std_logic_vector(31 downto 0);
		signal RFreg01	:  std_logic_vector(31 downto 0);
		signal RFreg02	:  std_logic_vector(31 downto 0);
		signal RFreg03	:  std_logic_vector(31 downto 0);
		signal RFreg04	:  std_logic_vector(31 downto 0);
		signal RFreg05	:  std_logic_vector(31 downto 0);
		signal RFreg06	:  std_logic_vector(31 downto 0);
		signal RFreg07	:  std_logic_vector(31 downto 0);
		signal RFreg08	:  std_logic_vector(31 downto 0);
		signal RFreg09	:  std_logic_vector(31 downto 0);
		signal RFreg0A	:  std_logic_vector(31 downto 0);
		signal RFreg0B	:  std_logic_vector(31 downto 0);
		signal RFreg0C	:  std_logic_vector(31 downto 0);
		signal RFreg0D	:  std_logic_vector(31 downto 0);
		signal RFreg0E	:  std_logic_vector(31 downto 0);
		signal RFreg0F	:  std_logic_vector(31 downto 0);
		signal RFreg10	:  std_logic_vector(31 downto 0);
		signal RFreg11	:  std_logic_vector(31 downto 0);
		signal RFreg12	:  std_logic_vector(31 downto 0);
		signal RFreg13	:  std_logic_vector(31 downto 0);
		signal RFreg14	:  std_logic_vector(31 downto 0);
		signal RFreg15	:  std_logic_vector(31 downto 0);
		signal RFreg16	:  std_logic_vector(31 downto 0);
		signal RFreg17	:  std_logic_vector(31 downto 0);
		signal RFreg18	:  std_logic_vector(31 downto 0);
		signal RFreg19	:  std_logic_vector(31 downto 0);
		signal RFreg1A	:  std_logic_vector(31 downto 0);
		signal RFreg1B	:  std_logic_vector(31 downto 0);
		signal RFreg1C	:  std_logic_vector(31 downto 0);
		signal RFreg1D	:  std_logic_vector(31 downto 0);
		signal RFreg1E	:  std_logic_vector(31 downto 0);
		signal RFreg1F	:  std_logic_vector(31 downto 0);


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
	
		probeRFreg00	<= RFreg00;
		probeRFreg01	<= RFreg01;
		probeRFreg02	<= RFreg02;
		probeRFreg03	<= RFreg03;
		probeRFreg04	<= RFreg04;
		probeRFreg05	<= RFreg05;
		probeRFreg06	<= RFreg06;
		probeRFreg07	<= RFreg07;
		probeRFreg08	<= RFreg08;
		probeRFreg09	<= RFreg09;
		probeRFreg0A	<= RFreg0A;
		probeRFreg0B	<= RFreg0B;
		probeRFreg0C	<= RFreg0C;
		probeRFreg0D	<= RFreg0D;
		probeRFreg0E	<= RFreg0E;
		probeRFreg0F	<= RFreg0F;
		probeRFreg10	<= RFreg10;
		probeRFreg11	<= RFreg11;
		probeRFreg12	<= RFreg12;
		probeRFreg13	<= RFreg13;
		probeRFreg14	<= RFreg14;
		probeRFreg15	<= RFreg15;
		probeRFreg16	<= RFreg16;
		probeRFreg17	<= RFreg17;
		probeRFreg18	<= RFreg18;
		probeRFreg19	<= RFreg19;
		probeRFreg1A	<= RFreg1A;
		probeRFreg1B	<= RFreg1B;
		probeRFreg1C	<= RFreg1C;
		probeRFreg1D	<= RFreg1D;
		probeRFreg1E	<= RFreg1E;
		probeRFreg1F	<= RFreg1F;
	-- END
end archi;
-- END FILE