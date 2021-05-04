library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY freqDiv100 IS
	PORT(
		RefClk: IN STD_LOGIC;
		OutClk: BUFFER STD_LOGIC
	);
END freqDiv100;

ARCHITECTURE freqDivider of freqDiv100 IS
	SIGNAL Counter: integer range 0 to 100000 := 0;
BEGIN
	PROCESS(RefClk)
	BEGIN
		IF RISING_EDGE(RefClk) THEN
			IF Counter = 2*610 THEN -- around 10 Hz resolution
				OutClk <= NOT OutClk;
				Counter <= 0;
			ELSE
				Counter <= Counter + 1;
			END IF;
		END IF;
	END PROCESS;	
END freqDivider;
	