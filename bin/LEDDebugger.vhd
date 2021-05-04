library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY LEDDebugger IS
	PORT(
		Set: IN STD_LOGIC;
		Count: IN unsigned(15 DOWNTO 0);
		AudClk: IN STD_LOGIC;
		LEDOut: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END LEDDebugger;


ARCHITECTURE Detector OF LEDDebugger IS
BEGIN
	PROCESS(AudClk)
	BEGIN
		CASE TO_INTEGER(Count) IS
			WHEN 2 to 2 => 
				LEDOut(0) <= Set;
			WHEN 3 to 3 => 
				LEDOut(1) <= Set;	
			WHEN 4 to 4 => 
				LEDOut(2) <= Set;
			WHEN 5 => 
				LEDOut(3) <= Set;
			WHEN 6 => 
				LEDOut(4) <= Set;
			WHEN 7 => 
				LEDOut(5) <= Set;	
			WHEN 8 to 8 => 
				LEDOut(6) <= Set;
			WHEN 9 => 
				LEDOut(7) <= Set;
			WHEN 10 => 
				LEDOut(8) <= Set;
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;
END Detector;

