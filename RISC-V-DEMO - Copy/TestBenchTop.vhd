-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity TestBenchTop is
end entity;


architecture VHDL of TestBenchTop is
	component Top is
		port (
		-- INPUTS
		TOPclock		: in std_logic;		--must go through pll
		TOPreset		: in std_logic; 	--SW0
		TOPresetIM	: in std_logic; 		--SW1
		TOPsimen		: in std_logic; 		--SW2
		-- DEMO OUTPUTS
--		TOPcounter : out std_logic_vector(31 downto 0); --0x80000000
		TOPdisplay1 : out std_logic_vector(31 downto 0);--0x80000004
		TOPdisplay2 : out std_logic_vector(31 downto 0);--0x80000008
		TOPleds : out std_logic_vector(31 downto 0) 	--0x8000000c
	);
	end component;

signal SigTOPclock : std_logic;
signal SigTOPreset : std_logic;
signal SigTOPresetIM : std_logic;
signal SigTOPsimen : std_logic;
signal SigTOPcounter : std_logic_vector (31 downto 0);
signal SigTOPdisplay1 : std_logic_vector (31 downto 0);
signal SigTOPdisplay2 : std_logic_vector (31 downto 0);
signal SigTOPleds: std_logic_vector (31 downto 0);

	begin
	clk : process
	begin
		SigTOPclock <= '1';
		wait for 100ns;
		SigTOPclock <= '0';
		wait for 100ns;
	end process;
	
	R1 : process
	begin
		SigTOPreset <= '1';
		wait for 10ns;
		SigTOPreset <= '0';
		wait;
	end process;
	
	R2 : process
	begin
		SigTOPresetIM <= '0';
		wait;
	end process;
	
	R3 : process
	begin
		SigTOPsimen <= '1';
		wait;
	end process;

		
		
		-- TestDisplay
	

	i1 : Top port map(TOPclock => SigTOPclock, TOPreset => SigTOPreset, TOPresetIM => SigTOPresetIM, TOPsimen => SigTOPsimen, 
							TOPdisplay1 => SigTOPdisplay1, TOPdisplay2 => SigTOPdisplay2, TOPleds => SigTOPleds);

end VHDL;