library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- y = 0.05324948*x + 99.14046

ENTITY HarmonicDetector IS
	PORT(
		InAmpl: IN unsigned(39 DOWNTO 0);
		Count: IN unsigned(15 DOWNTO 0);
		AudClk: IN STD_LOGIC;
		Harmonic1Out: OUT unsigned(36 DOWNTO 0);
		Harmonic2Out: OUT unsigned(36 DOWNTO 0);
		Harmonic3Out: OUT unsigned(36 DOWNTO 0);
		Harmonic4Out: OUT unsigned(36 DOWNTO 0);
		Harmonic5Out: OUT unsigned(36 DOWNTO 0);
		Harmonic6Out: OUT unsigned(36 DOWNTO 0);
		Harmonic7Out: OUT unsigned(36 DOWNTO 0);
		Harmonic8Out: OUT unsigned(36 DOWNTO 0);
		Harmonic9Out: OUT unsigned(36 DOWNTO 0);
		Harmonic10Out: OUT unsigned(36 DOWNTO 0);
		Harmonic11Out: OUT unsigned(36 DOWNTO 0);
		Harmonic12Out: OUT unsigned(36 DOWNTO 0);
		Harmonic13Out: OUT unsigned(36 DOWNTO 0);
		Harmonic14Out: OUT unsigned(36 DOWNTO 0);
		Harmonic15Out: OUT unsigned(36 DOWNTO 0);
		Harmonic16Out: OUT unsigned(36 DOWNTO 0);
		Harmonic17Out: OUT unsigned(36 DOWNTO 0);
		Harmonic18Out: OUT unsigned(36 DOWNTO 0);
		Harmonic19Out: OUT unsigned(36 DOWNTO 0)
	);
END HarmonicDetector;

ARCHITECTURE HarmonicCounter OF HarmonicDetector IS
	SIGNAL InUnSig: unsigned(36 DOWNTO 0) := (others => '0');
	CONSTANT HARMONIC1FROM : integer := 1;
	CONSTANT HARMONIC1TO: integer := 1;
	CONSTANT HARMONIC2FROM : integer := 2;
	CONSTANT HARMONIC2TO: integer := 2;
	CONSTANT HARMONIC3FROM : integer := 3;
	CONSTANT HARMONIC3TO: integer := 3;
	CONSTANT HARMONIC4FROM : integer := 4;
	CONSTANT HARMONIC4TO: integer := 4;
	CONSTANT HARMONIC5FROM : integer := 5;
	CONSTANT HARMONIC5TO: integer := 6;
	CONSTANT HARMONIC6FROM : integer := 7;
	CONSTANT HARMONIC6TO: integer := 8;
	CONSTANT HARMONIC7FROM : integer := 9;
	CONSTANT HARMONIC7TO: integer := 12;
	CONSTANT HARMONIC8FROM : integer := 13;
	CONSTANT HARMONIC8TO: integer := 18;
	CONSTANT HARMONIC9FROM : integer := 19;
	CONSTANT HARMONIC9TO: integer := 27;
	CONSTANT HARMONIC10FROM : integer := 28;
	CONSTANT HARMONIC10TO: integer := 40;
	CONSTANT HARMONIC11FROM : integer := 41;
	CONSTANT HARMONIC11TO: integer := 60;
	CONSTANT HARMONIC12FROM : integer := 61;
	CONSTANT HARMONIC12TO: integer := 90;
	CONSTANT HARMONIC13FROM : integer := 91;
	CONSTANT HARMONIC13TO: integer := 135;
	CONSTANT HARMONIC14FROM : integer := 136;
	CONSTANT HARMONIC14TO: integer := 201;
	CONSTANT HARMONIC15FROM : integer := 202;
	CONSTANT HARMONIC15TO: integer := 301;
	CONSTANT HARMONIC16FROM : integer := 302;
	CONSTANT HARMONIC16TO: integer := 449;
	CONSTANT HARMONIC17FROM : integer := 450;
	CONSTANT HARMONIC17TO: integer := 670;
	CONSTANT HARMONIC18FROM : integer := 671;
	CONSTANT HARMONIC18TO: integer := 999;
	CONSTANT HARMONIC19FROM : integer := 1000;
	CONSTANT HARMONIC19TO: integer := 1023;
BEGIN
	InUnSig <= InAmpl(36 DOWNTO 0);
	PROCESS(AudClk)
		VARIABLE Placeholder: unsigned(36 DOWNTO 0) := (others => '0');
	BEGIN
		IF RISING_EDGE(AudClk) THEN
			CASE TO_INTEGER(Count) IS
				WHEN HARMONIC1FROM to HARMONIC1TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC1TO THEN
						Harmonic1Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC2FROM to HARMONIC2TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC2TO THEN
						Harmonic2Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC3FROM to HARMONIC3TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC3TO THEN
						Harmonic3Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC4FROM to HARMONIC4TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC4TO THEN
						Harmonic4Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC5FROM to HARMONIC5TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC5TO THEN
						Harmonic5Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC6FROM to HARMONIC6TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC6TO THEN
						Harmonic6Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC7FROM to HARMONIC7TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC7TO THEN
						Harmonic7Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC8FROM to HARMONIC8TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC8TO THEN
						Harmonic8Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC9FROM to HARMONIC9TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC9TO THEN
						Harmonic9Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC10FROM to HARMONIC10TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC10TO THEN
						Harmonic10Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC11FROM to HARMONIC11TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC11TO THEN
						Harmonic11Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC12FROM to HARMONIC12TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC12TO THEN
						Harmonic12Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC13FROM to HARMONIC13TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC13TO THEN
						Harmonic13Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC14FROM to HARMONIC14TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC14TO THEN
						Harmonic14Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC15FROM to HARMONIC15TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC15TO THEN
						Harmonic15Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC16FROM to HARMONIC16TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC16TO THEN
						Harmonic16Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC17FROM to HARMONIC17TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC17TO THEN
						Harmonic17Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC18FROM to HARMONIC18TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC18TO THEN
						Harmonic18Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN HARMONIC19FROM to HARMONIC19TO =>
					IF InUnSig > Placeholder THEN
						Placeholder := InUnSig;
					END IF;
					IF Count = HARMONIC19TO THEN
						Harmonic19Out <= Placeholder;
						Placeholder := (others => '0');
					END IF;
				WHEN OTHERS =>
					Placeholder := (others => '0');
			END CASE;
		END IF;
	END PROCESS;
END HarmonicCounter;