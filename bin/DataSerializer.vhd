library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY DataSerializer IS
	PORT(
		Int1, Int2, Int3, Int4, Int5, Int6, Int7, Int8, Int9, Int10, 
		Int11, Int12, Int13, Int14, Int15, Int16, Int17, Int18, Int19: IN unsigned(7 DOWNTO 0);
		C1ol, C2ol, C3ol, C4ol, C5ol, C6ol, C7ol, C8ol, C9ol, C10ol, C11ol, C12ol, C13ol, C14ol, C15ol,
		C16ol, C17ol, C18ol, C19ol: IN unsigned (4 DOWNTO 0);
		CombinedIntensity: OUT unsigned(151 DOWNTO 0);
		CombinedColor: OUT unsigned(151 DOWNTO 0) := (others => '0')
	);	
END DataSerializer;

ARCHITECTURE Serializer OF DataSerializer IS
BEGIN
	CombinedIntensity(7 DOWNTO 0) <= Int1;
	CombinedIntensity(15 DOWNTO 8) <= Int2;
	CombinedIntensity(23 DOWNTO 16) <= Int3;
	CombinedIntensity(31 DOWNTO 24) <= Int4;
	CombinedIntensity(39 DOWNTO 32) <= Int5;
	CombinedIntensity(47 DOWNTO 40) <= Int6;
	CombinedIntensity(55 DOWNTO 48) <= Int7;
	CombinedIntensity(63 DOWNTO 56) <= Int8;
	CombinedIntensity(71 DOWNTO 64) <= Int9;
	CombinedIntensity(79 DOWNTO 72) <= Int10;
	CombinedIntensity(87 DOWNTO 80) <= Int11;
	CombinedIntensity(95 DOWNTO 88) <= Int12;
	CombinedIntensity(103 DOWNTO 96) <= Int13;
	CombinedIntensity(111 DOWNTO 104) <= Int14;
	CombinedIntensity(119 DOWNTO 112) <= Int15;
	CombinedIntensity(127 DOWNTO 120) <= Int16;
	CombinedIntensity(135 DOWNTO 128) <= Int17;
	CombinedIntensity(143 DOWNTO 136) <= Int18;
	CombinedIntensity(151 DOWNTO 144) <= Int19;
	
	CombinedColor(7-3 DOWNTO 0) <= C1ol(4 DOWNTO 0);
	CombinedColor(15-3 DOWNTO 8) <= C2ol(4 DOWNTO 0);
	CombinedColor(23-3 DOWNTO 16) <= C3ol(4 DOWNTO 0);
	CombinedColor(31-3 DOWNTO 24) <= C4ol(4 DOWNTO 0);
	CombinedColor(39-3 DOWNTO 32) <= C5ol(4 DOWNTO 0);
	CombinedColor(47-3 DOWNTO 40) <= C6ol(4 DOWNTO 0);
	CombinedColor(55-3 DOWNTO 48) <= C7ol(4 DOWNTO 0);
	CombinedColor(63-3 DOWNTO 56) <= C8ol(4 DOWNTO 0);
	CombinedColor(71-3 DOWNTO 64) <= C9ol(4 DOWNTO 0);
	CombinedColor(79-3 DOWNTO 72) <= C10ol(4 DOWNTO 0);
	CombinedColor(87-3 DOWNTO 80) <= C11ol(4 DOWNTO 0);
	CombinedColor(95-3 DOWNTO 88) <= C12ol(4 DOWNTO 0);
	CombinedColor(103-3 DOWNTO 96) <= C13ol(4 DOWNTO 0);
	CombinedColor(111-3 DOWNTO 104) <= C14ol(4 DOWNTO 0);
	CombinedColor(119-3 DOWNTO 112) <= C15ol(4 DOWNTO 0);
	CombinedColor(127-3 DOWNTO 120) <= C16ol(4 DOWNTO 0);
	CombinedColor(135-3 DOWNTO 128) <= C17ol(4 DOWNTO 0);
	CombinedColor(143-3 DOWNTO 136) <= C18ol(4 DOWNTO 0);
	CombinedColor(151-3 DOWNTO 144) <= C19ol(4 DOWNTO 0);
END Serializer;