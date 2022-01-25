--
-- Projet de fin d'études : RISC-V
-- ECE Paris / SECAPEM
-- Displays VHDL

-- LIBRARIES
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ENTITY
entity Displays is
	port (
		--INPUTS
		DISPclock : in std_logic;
		DISPreset : in std_logic;
		DISPaddr : in std_logic_vector(31 downto 0);
		DISPinput : in std_logic_vector(31 downto 0);
		--OUTPUTS
		DISPleds : out std_logic_vector(31 downto 0);
		DISPdisplay1 : out std_logic_vector(31 downto 0);
		DISPdisplay2 : out std_logic_vector(31 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture archi of Displays is
	
	signal SigDISPaddr : std_logic_vector(31 downto 0);
	signal SigDISPinput : std_logic_vector(31 downto 0);
	signal SigDISPleds : std_logic_vector(31 downto 0);
	signal SigDISPdisplay1 : std_logic_vector(31 downto 0);
	signal SigDISPdisplay2 : std_logic_vector(31 downto 0);

begin
	-- BEGIN
	
	-- display process
	p1 : process(DISPclock, DISPreset, DISPinput)
	begin
		if(DISPreset = '1') then
			SigDISPleds <= (others => '1');
			SigDISPdisplay1 <= (others => '1');
			SigDISPdisplay2 <= (others => '1');
			
		elsif(DISPreset = '0') then
			if(rising_edge(DISPclock)) then
				if(DISPaddr = x"80000002") then
					SigDISPdisplay1 <= SigDISPinput;
					
				elsif(DISPaddr = x"80000003") then
					SigDISPdisplay2 <= SigDISPinput;
					
				elsif(DISPaddr = x"80000004") then
					SigDISPleds <= SigDISPinput;

				end if;
			end if;
		end if;
	end process;
	
	
	-- END
end archi;
-- END FILE

