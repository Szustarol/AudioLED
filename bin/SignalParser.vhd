library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY SignalParser IS
	PORT(
		InHarmonic: IN unsigned(36 DOWNTO 0) := (others => '0');
		Intensity: OUT unsigned(7 DOWNTO 0);
		ColorCounter: BUFFER unsigned (4 DOWNTO 0) := (others => '0')
	);	
END SignalParser;

ARCHITECTURE SignalArch OF SignalParser IS 
BEGIN
	PROCESS(InHarmonic)
		VARIABLE ScaledIntensity: unsigned (7 DOWNTO 0) := (others => '0');
		VARIABLE HarmonicBuffer: unsigned (36 DOWNTO 0) := (others => '0');
	BEGIN
	
		IF InHarmonic > x"21000000" THEN
			HarmonicBuffer := InHarmonic - x"21000000";
		ELSE
			HarmonicBuffer := (others => '0');
		END IF;
	
		IF HarmonicBuffer(36 DOWNTO 8) > 0 THEN
			ScaledIntensity := (others => '1');
		ELSE
			ScaledIntensity := HarmonicBuffer(7 DOWNTO 0);
		END IF;
			
		
		IF ScaledIntensity > 150 THEN
			IF ColorCounter < 16 THEN
				ColorCounter <= ColorCounter + 1;
			END IF;
		ELSE
			IF ColorCounter > 0 THEN
				ColorCounter <= ColorCounter - 1;
			END IF;
		END IF;
	
		Intensity <= ScaledIntensity;
	END PROCESS;
END SignalArch;