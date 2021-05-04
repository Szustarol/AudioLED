library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY SignalLen IS
	PORT(
		InReal: IN signed(35 DOWNTO 0);
		InImag: IN signed(35 DOWNTO 0);
		OutRes: OUT unsigned(72 DOWNTO 0)
	);
END SignalLen;

ARCHITECTURE Proccessing OF SignalLen IS 
	SIGNAL ABS1 : signed(72 DOWNTO 0);
	SIGNAL ABS2 : signed(72 DOWNTO 0);
	SIGNAL SQ1 : unsigned(72 DOWNTO 0);
	SIGNAL SQ2 : unsigned(72 DOWNTO 0);
BEGIN
	ABS1 <= resize(InReal*InReal, 73);
	ABS2 <= resize(InImag*InImag, 73);
	
	SQ1 <= unsigned(ABS1);
	SQ2 <= unsigned(ABS2);
	OutRes <= SQ1+SQ2;
END;