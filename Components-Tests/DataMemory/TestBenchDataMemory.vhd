-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchDataMemory is
end entity;


architecture archi of TestBenchDataMemory is
	component DataMemory is
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
		DMout			: out std_logic_vector(31 downto 0);
		-- FOR DEBUG
		DMdebug 		: out std_logic_vector(31 downto 0)
		);
	end component;
	
signal Sigclock : std_logic;
signal Sigreset : std_logic;
signal Sigstore : std_logic;
signal Sigload : std_logic;
signal Sigaddr : std_logic_vector(31 downto 0);
signal Sigin : std_logic_vector(31 downto 0);
signal Sigfunct3 : std_logic_vector(2 downto 0);

signal Sigout : std_logic_vector(31 downto 0);

	begin

-- process clk
	pck : process
	begin
		Sigclock <= '0';
		wait for 50ns;
		-- AND 
		Sigclock <= '1';
		wait for 50ns;
	end process;
	
-- process reset
	preset : process
	begin
		Sigreset <= '1';
		wait for 100ns;
		-- AND 
		Sigreset <= '0';
		wait;
	end process;
	
	
	stimuli_import : process
	begin
	
		-- store byte
	   Sigin <= "10000100100000111000001010000001";
	  Sigaddr<= "00000000000000000000000000000000";
		Sigstore <= '1';
		Sigload <= '0';
		Sigfunct3 <="000";
		wait for 100ns;
		
		-- load byte signed
	   Sigaddr  <= "00000000000000000000000000000000";
		Sigload <= '1';
		Sigstore <= '0';
		Sigfunct3 <="000";
		wait for 100ns;
		
		-- load byte unsigned
	   Sigaddr  <= "00000000000000000000000000000000";
		Sigload <= '1';
		Sigstore <= '0';
		Sigfunct3 <="100";
		wait for 100ns;
		
		-- store halfword
	   Sigin <= "10000100100000111000001010000001";
	  Sigaddr<= "00000000000000000000000000000100";
		Sigstore <= '1';
		Sigload <= '0';
		Sigfunct3 <="001";
		wait for 100ns;
		
		-- load halfword signed
	   Sigaddr  <= "00000000000000000000000000000100";
		Sigload <= '1';
		Sigstore <= '0';
		Sigfunct3 <="001";
		wait for 100ns;
		
		-- load halfword unsigned
	   Sigaddr  <= "00000000000000000000000000000100";
		Sigload <= '1';
		Sigstore <= '0';
		Sigfunct3 <="101";
		wait for 100ns;
		
		-- store word
	   Sigin <= "10000100100000111000001010000001";
	  Sigaddr<= "00000000000000000000000000001000";
		Sigstore <= '1';
		Sigload <= '0';
		Sigfunct3 <="010";
		wait for 100ns;
		
		-- load word
	   Sigaddr  <= "00000000000000000000000000001000";
		Sigload <= '1';
		Sigstore <= '0';
		Sigfunct3 <="010";
		wait for 100ns;
		
	
	end process;

	i1 : DataMemory port map(DMclock => Sigclock, Dmreset => Sigreset, DMstore => Sigstore, 
			DMload => Sigload, DMin => Sigin, DMfunct3 => Sigfunct3, DMaddr => Sigaddr, DMout => Sigout
	);

end archi;
