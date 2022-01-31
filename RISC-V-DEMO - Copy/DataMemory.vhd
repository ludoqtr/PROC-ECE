-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Data Memory VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity DataMemory is
	port (
		-- INPUTS
		DMclock		: in std_logic;
		DMstore		: in std_logic;
		DMload		: in std_logic;
		DMaddr		: in std_logic_vector(31 downto 0);
		DMin			: in std_logic_vector(31 downto 0);
		DMfunct3		: in std_logic_vector(2 downto 0);
		-- OUTPUTS
		DMout			: out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of DataMemory is
	
	component RAM00 is
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	component RAM08 is
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	component RAM16 is
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	component RAM24 is
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	-- SIGNALS RAM
	signal SIGcs			: STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	signal SIGaddrNEW		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	signal SIGinput00		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal SIGaddr00		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal SIGload00		: STD_LOGIC;
	signal SIGstore00		: STD_LOGIC;
	signal SIGoutput00	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	signal SIGinput08		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal SIGaddr08		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal SIGload08		: STD_LOGIC;
	signal SIGstore08		: STD_LOGIC;
	signal SIGoutput08	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	signal SIGinput16		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal SIGaddr16		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal SIGload16		: STD_LOGIC;
	signal SIGstore16		: STD_LOGIC;
	signal SIGoutput16	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	signal SIGinput24		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal SIGaddr24		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal SIGload24		: STD_LOGIC;
	signal SIGstore24		: STD_LOGIC;
	signal SIGoutput24	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
begin
	
	SIGcs <= "0001" WHEN (DMfunct3(1 downto 0) = "00" AND DMaddr(1 downto 0) = "00") ELSE -- B
                "0010" WHEN (DMfunct3(1 downto 0) = "00" AND DMaddr(1 downto 0) = "01") ELSE -- B
                "0100" WHEN (DMfunct3(1 downto 0) = "00" AND DMaddr(1 downto 0) = "10") ELSE -- B
                "1000" WHEN (DMfunct3(1 downto 0) = "00" AND DMaddr(1 downto 0) = "11") ELSE -- B
                "0011" WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "00") ELSE -- H
                "0110" WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "01") ELSE -- H
                "1100" WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "10") ELSE -- H
                "1001" WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "11") ELSE -- H
                "1111" WHEN (DMfunct3 = "010") ELSE                                         -- W
                "0000";

	
	SIGaddrNEW	<= std_logic_vector(shift_right(unsigned(DMaddr), 2));
	
	-- 00
	SIGinput00	<= DMin(7 downto 0)   when (SIGcs = "0001" or SIGcs = "0011" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "00")) else
						DMin(15 downto 8)  when (SIGcs = "0010" or SIGcs = "0110" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "01"))else
						DMin(23 downto 16) when (SIGcs = "0100" or SIGcs = "1100" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "10"))else
						DMin(31 downto 24) when (SIGcs = "1000" or SIGcs = "1001" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "11"))else
						(others => '0');
	SIGaddr00	<= std_logic_vector(unsigned(SIGaddrNEW) + 1) when (SIGcs = "1001") else
						SIGaddrNEW;
	SIGload00 	<= SIGcs(0) AND DMload;
	SIGstore00	<= SIGcs(0) AND DMstore;
	
	-- 08
	SIGinput08	<= DMin(15 downto 8)  when (SIGcs = "0001" or SIGcs = "0011" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "00")) else
						DMin(23 downto 16) when (SIGcs = "0010" or SIGcs = "0110" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "01"))else
						DMin(31 downto 24) when (SIGcs = "0100" or SIGcs = "1100" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "10"))else
						DMin(7 downto 0)   when (SIGcs = "1000" or SIGcs = "1001" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "11"))else
						(others => '0');
	SIGaddr08	<= std_logic_vector(unsigned(SIGaddrNEW) + 1) when (DMfunct3 = "010" AND (DMaddr(1 downto 0) = "10" or DMaddr(1 downto 0) = "11")) else
						SIGaddrNEW;
	SIGload08 	<= SIGcs(1) AND DMload;
	SIGstore08	<= SIGcs(1) AND DMstore;
	
	-- 16
	SIGinput16	<= DMin(23 downto 16) when (SIGcs = "0001" or SIGcs = "0011" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "00")) else
						DMin(31 downto 24) when (SIGcs = "0010" or SIGcs = "0110" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "01"))else
						DMin(7 downto 0)   when (SIGcs = "0100" or SIGcs = "1100" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "10"))else
						DMin(15 downto 8)  when (SIGcs = "1000" or SIGcs = "1001" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "11"))else
						(others => '0');
	SIGaddr16	<= std_logic_vector(unsigned(SIGaddrNEW) + 1) when (DMfunct3 = "010" AND (DMaddr(1 downto 0) = "11")) else
						SIGaddrNEW;
	SIGload16	<= SIGcs(2) AND DMload;
	SIGstore16	<= SIGcs(2) AND DMstore;
	
	-- 24
	SIGinput24	<= DMin(31 downto 24) when (SIGcs = "0001" or SIGcs = "0011" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "00")) else
						DMin(7 downto 0)   when (SIGcs = "0010" or SIGcs = "0110" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "01"))else
						DMin(15 downto 8)  when (SIGcs = "0100" or SIGcs = "1100" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "10"))else
						DMin(23 downto 16) when (SIGcs = "1000" or SIGcs = "1001" or (DMfunct3 = "010" AND DMaddr(1 downto 0) = "11"))else
						(others => '0');
	SIGaddr24	<= SIGaddrNEW;
	SIGload24 	<= SIGcs(3) AND DMload;
	SIGstore24	<= SIGcs(3) AND DMstore;
	
	-- BLOCK OUTPUT
	DMout(7 downto 0)  <=	SIGoutput00 	WHEN (DMaddr(1 downto 0) = "00") ELSE -- B
									SIGoutput08 	WHEN (DMaddr(1 downto 0) = "01") ELSE -- B
									SIGoutput16 	WHEN (DMaddr(1 downto 0) = "10") ELSE -- B
									SIGoutput24 	WHEN (DMaddr(1 downto 0) = "11") ELSE -- B
									(others=>'0'); -- all others
				
	DMout(15 downto 8) <=	(others=>'1')	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "00" AND SIGoutput00(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "01" AND SIGoutput08(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "10" AND SIGoutput16(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "11" AND SIGoutput24(7) = '1') ELSE -- B
									SIGoutput08		WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "00") ELSE -- H
									SIGoutput16		WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "01") ELSE -- H
									SIGoutput24 	WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "10") ELSE -- H
									SIGoutput00	 	WHEN (DMfunct3(1 downto 0) = "01" AND DMaddr(1 downto 0) = "11") ELSE -- H
									SIGoutput08 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "00") ELSE -- W
									SIGoutput16 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "01") ELSE -- W
									SIGoutput24 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "10") ELSE -- W
									SIGoutput00 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "11") ELSE -- W 
									(others=>'0'); -- others and unsigned b
									
	DMout(23 downto 16)<=	(others=>'1')	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "00" AND SIGoutput00(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "01" AND SIGoutput08(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "10" AND SIGoutput16(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "11" AND SIGoutput24(7) = '1') ELSE -- B
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "00" AND SIGoutput08(7) = '1') ELSE -- H
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "01" AND SIGoutput16(7) = '1') ELSE -- H
									(others=>'1') 	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "10" AND SIGoutput24(7) = '1') ELSE -- H
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "11" AND SIGoutput00(7) = '1') ELSE -- H
									SIGoutput16 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "00") ELSE -- W
									SIGoutput24 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "01") ELSE -- W
									SIGoutput00 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "10") ELSE -- W
									SIGoutput08 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "11") ELSE -- W			
									(others=>'0'); -- others and unsigned b and h
									
	DMout(31 downto 24)<=	(others=>'1')	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "00" AND SIGoutput00(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "01" AND SIGoutput08(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "10" AND SIGoutput16(7) = '1') ELSE -- B
									(others=>'1') 	WHEN (DMfunct3 = "000" AND DMaddr(1 downto 0) = "11" AND SIGoutput24(7) = '1') ELSE -- B
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "00" AND SIGoutput08(7) = '1') ELSE -- H
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "01" AND SIGoutput16(7) = '1') ELSE -- H
									(others=>'1') 	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "10" AND SIGoutput24(7) = '1') ELSE -- H
									(others=>'1')	WHEN (DMfunct3 = "001" AND DMaddr(1 downto 0) = "11" AND SIGoutput00(7) = '1') ELSE -- H
									SIGoutput24 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "00") ELSE -- W
									SIGoutput00 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "01") ELSE -- W
									SIGoutput08 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "10") ELSE -- W
									SIGoutput16 	WHEN (DMfunct3(1 downto 0) = "10" AND DMaddr(1 downto 0) = "11") ELSE -- W		
									(others=>'0'); -- others and unsigned b and h
									
	-- INSTANCES
	instRAM00 : RAM00
	port map(
		clock => DMclock,
		data => SIGinput00,
		rdaddress => SIGaddr00(9 downto 0),
		rden => SIGload00,
		wraddress => SIGaddr00(9 downto 0),
		wren => SIGstore00,
		q => SIGoutput00
	);
	
	instRAM08 : RAM08
	port map(
		clock => DMclock,
		data => SIGinput08,
		rdaddress => SIGaddr08(9 downto 0),
		rden => SIGload08,
		wraddress => SIGaddr08(9 downto 0),
		wren => SIGstore08,
		q => SIGoutput08
	);
	
	instRAM16 : RAM16
	port map(
		clock => DMclock,
		data => SIGinput16,
		rdaddress => SIGaddr16(9 downto 0),
		rden => SIGload16,
		wraddress => SIGaddr16(9 downto 0),
		wren => SIGstore16,
		q => SIGoutput16
	);
	
	instRAM24 : RAM24
	port map(
		clock => DMclock,
		data => SIGinput24,
		rdaddress => SIGaddr24(9 downto 0),
		rden => SIGload24,
		wraddress => SIGaddr24(9 downto 0),
		wren => SIGstore24,
		q => SIGoutput24
	);
	-- END
end archi;
-- END FILE