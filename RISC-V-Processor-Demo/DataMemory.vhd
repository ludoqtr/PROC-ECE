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
		DMreset		: in std_logic;
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
	type mem is array(0 to 255) of std_logic_vector(7 downto 0);
	signal SigDMmemory : mem;
	signal SigDMaddr00 : integer;
	signal SigDMaddr08 : integer;
	signal SigDMaddr16 : integer;
	signal SigDMaddr24 : integer;
begin
	-- BEGIN
	
	-- addr to integer
	p1 : process(DMaddr)
	begin
		SigDMaddr00 <= to_integer(unsigned(DMaddr));
		SigDMaddr08 <= to_integer(unsigned(DMaddr)) + 1;
		SigDMaddr16 <= to_integer(unsigned(DMaddr)) + 2;
		SigDMaddr24 <= to_integer(unsigned(DMaddr)) + 3;
	end process;
	
	-- store
	p2 : process(DMclock, DMreset, DMstore, DMfunct3)
	begin
		if(DMreset = '1') then
			SigDMmemory(0 to 255) <= (others => "00000000");
		elsif(DMreset = '0') then
			if(rising_edge(DMclock)) then
				if(DMstore = '1') then
					if(DMfunct3 = "000") then
						SigDMmemory(SigDMaddr00) <= DMin(7 downto 0);
						
					elsif(DMfunct3 = "001") then
						SigDMmemory(SigDMaddr00) <= DMin(7 downto 0);
						SigDMmemory(SigDMaddr08) <= DMin(15 downto 8);
						
					elsif(DMfunct3 = "010") then
						SigDMmemory(SigDMaddr00) <= DMin(7 downto 0);
						SigDMmemory(SigDMaddr08) <= DMin(15 downto 8);
						SigDMmemory(SigDMaddr16) <= DMin(23 downto 16);
						SigDMmemory(SigDMaddr24) <= DMin(31 downto 24);
					end if;
				end if;
			end if;
		end if;
	end process;
	
	-- load
	p3 : process(DMload, DMreset, DMfunct3)
	begin
		if(DMload = '1') then
			if(DMreset = '0') then
				if(DMfunct3 = "000") then
					DMout(7 downto 0) <= SigDMmemory(SigDMaddr00);
					if( (SigDMmemory(SigDMaddr00) AND "10000000") = "10000000" ) then
						DMout(15 downto 8) <= (others => '1');
						DMout(23 downto 16) <= (others => '1');
						DMout(31 downto 24) <= (others => '1');
					else
						DMout(15 downto 8) <= (others => '0');
						DMout(23 downto 16) <= (others => '0');
						DMout(31 downto 24) <= (others => '0');
					end if;
					
				elsif(DMfunct3 = "001") then
					DMout(7 downto 0) <= SigDMmemory(SigDMaddr00);
					DMout(15 downto 8) <= SigDMmemory(SigDMaddr08);
					if( (SigDMmemory(SigDMaddr08) AND "10000000") = "10000000" ) then
						DMout(23 downto 16) <= (others => '1');
						DMout(31 downto 24) <= (others => '1');
					else
						DMout(23 downto 16) <= (others => '0');
						DMout(31 downto 24) <= (others => '0');
					end if;
					
				elsif(DMfunct3 = "010") then
					DMout(7 downto 0) <= SigDMmemory(SigDMaddr00);
					DMout(15 downto 8) <= SigDMmemory(SigDMaddr08);
					DMout(23 downto 16) <= SigDMmemory(SigDMaddr16);
					DMout(31 downto 24) <= SigDMmemory(SigDMaddr24);
					
				elsif(DMfunct3 = "100") then
					DMout(7 downto 0) <= SigDMmemory(SigDMaddr00);
					DMout(15 downto 8) <= (others => '0');
					DMout(23 downto 16) <= (others => '0');
					DMout(31 downto 24) <= (others => '0');
					
				elsif(DMfunct3 = "101") then
					DMout(7 downto 0) <= SigDMmemory(SigDMaddr00);
					DMout(15 downto 8) <= SigDMmemory(SigDMaddr08);
					DMout(23 downto 16) <= (others => '0');
					DMout(31 downto 24) <= (others => '0');
				end if;
			end if;
		end if;
	end process;
	
	-- END
end archi;
-- END FILE

