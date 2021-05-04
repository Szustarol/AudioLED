library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY OutputScaler IS
	PORT(
		Input: IN unsigned(72 downto 0);
		Output: OUT unsigned(79 downto 0) := (others => '0')
	);
END OutputScaler;

ARCHITECTURE Scaling OF OutputScaler IS
BEGIN
	Output(72 downto 0) <= Input;
END Scaling;