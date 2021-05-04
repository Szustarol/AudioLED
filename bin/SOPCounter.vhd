library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY SOPCounter IS
	PORT(
		AudClk: IN STD_LOGIC;
		Count: BUFFER unsigned(15 downto 0) := (others => '0');
		SopReset: IN STD_LOGIC
	);
END SOPCounter;

ARCHITECTURE SOPCtrArch OF SOPCounter IS
BEGIN
	PROCESS(AudClk)
	BEGIN
		IF RISING_EDGE(AudClk) THEN
			IF SopReset = '1' THEN
				Count <= (others => '0');
			ELSE
				Count <= Count + 1;
			END IF;
		END IF;
	END PROCESS;
END SOPCtrArch;