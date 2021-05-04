library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY LedDriver IS 
	PORT(
		CombinedIntensity: IN unsigned (151 DOWNTO 0);
		CombinedColor: IN unsigned(151 DOWNTO 0);
		Clk: IN STD_LOGIC;
		STRIP_OUT: OUT STD_LOGIC
	);
END LedDriver;

ARCHITECTURE LEDPayload OF LedDriver IS
	CONSTANT N_LEDS : integer := 20;
	CONSTANT CLK_FREQ : integer := 50000000;
	CONSTANT ONE_HIGH_NS : integer := 900; --T1H
	CONSTANT ONE_LOW_NS : integer := 350; --T1L
	CONSTANT ZERO_HIGH_NS : integer := 350; --T0H
	CONSTANT ZERO_LOW_NS : integer := 900; --T0L
	CONSTANT LATCH_NS : integer := 8600000*2;
	CONSTANT CLK_PERIOD_NS : INTEGER := 1000000000/CLK_FREQ;
	SIGNAL LED_COLOR : unsigned(23 downto 0) := (others => '0');
	SIGNAL bitIndex : integer range 0 to 255 := 0;
	SIGNAL state : integer range 0 to 15 := 0;
	SIGNAL waiter : integer range -1000 to 20000000:= 0;
	SIGNAL ledIdx : integer range 0 to 120 := 1;
	
	FUNCTION Reverse8Bit(X : unsigned(7 DOWNTO 0)) 
		RETURN unsigned IS 
		VARIABLE temp : unsigned(7 DOWNTO 0) := (others => '0');
	BEGIN
		FOR i IN 0 TO 7 LOOP
			temp(i) := X(7-i);
		END LOOP;
		RETURN temp;
	END Reverse8Bit;
BEGIN
	--states:
	--0 - send byte high
	--1 - send byte low
	--2 - send latch
	PROCESS(Clk)
		VARIABLE LED_COLOR : unsigned(23 downto 0) := (others => '0');
		VARIABLE ColorHolder: integer := 0;
		VARIABLE IntensityHolder: unsigned(7 downto 0) := (others => '0');
		VARIABLE RedColor: unsigned(7 downto 0) := (others => '0');
		VARIABLE GreenColor: unsigned(7 downto 0) := (others => '0');
		VARIABLE BlueColor: unsigned(7 downto 0) := (others => '0');
	BEGIN
		IF RISING_EDGE(Clk) THEN --BRG
			LED_COLOR := (others => '0');
			IntensityHolder := CombinedIntensity(ledIdx*8-1 DOWNTO (ledIdx-1)*8);
			ColorHolder := TO_INTEGER(CombinedColor(ledIdx*8-1 DOWNTO (ledIdx-1)*8));
			RedColor := (others => '0'); GreenColor := (others => '0'); BlueColor := (others => '0');
			IF ColorHolder > 0 AND ColorHolder < 9 THEN
				GreenColor(ColorHolder-1 DOWNTO 0) := IntensityHolder(ColorHolder-1 DOWNTO 0);
				IF ColorHolder < 8 THEN
					RedColor(7 DOWNTO ColorHolder) := IntensityHolder(7 DOWNTO ColorHolder);
				END IF;
			ELSIF ColorHolder > 8 THEN
				BlueColor(ColorHolder-9 DOWNTO 0) := IntensityHolder(ColorHolder-9 DOWNTO 0);
				IF ColorHolder < 16 THEN
					GreenColor(7 DOWNTO ColorHolder-8) := IntensityHolder(7 DOWNTO ColorHolder-8);
				END IF;
			ELSE
				RedColor := IntensityHolder(7 DOWNTO 0);
			END IF;
			--Green, Red, Blue +  All Reverse
			LED_COLOR(7 DOWNTO 0) := Reverse8Bit(GreenColor);
			LED_COLOR(15 DOWNTO 8) := Reverse8Bit(RedColor);
			LED_COLOR(23 DOWNTO 16) := Reverse8Bit(BlueColor);
		
		
			IF waiter > 0 THEN
				waiter <= waiter - CLK_PERIOD_NS;	
			ELSE
				IF state = 2 THEN -- send latch
					waiter <= LATCH_NS;
					state <= 0;
					STRIP_OUT <= '0';
				ELSIF state = 1 THEN -- send byte low
					--determine byte 0 or 1
					STRIP_OUT <= '0';
					IF LED_COLOR(bitIndex) = '1' THEN
						waiter <= ONE_LOW_NS;
					ELSE
						waiter <= ZERO_LOW_NS;
					END IF;
					--is there more to send?
					IF bitIndex + 1 > 23 AND ledIdx >= N_LEDS THEN --latch
						bitIndex <= 0;
						state <= 2;
						ledIdx <= 1;
					ELSE
						IF bitIndex + 1> 23 THEN
							bitIndex <= 0;
							ledIdx <= ledIdx + 1;
						ELSE
							bitIndex <= bitIndex + 1;
						END IF;
						state <= 0;
					END IF;
				ELSIF state = 0 THEN -- send byte high
					STRIP_OUT <= '1';
					IF LED_COLOR(bitIndex) = '1' THEN
						waiter <= ONE_HIGH_NS;
					ELSE
						waiter <= ZERO_HIGH_NS;
					END IF;
					state <= 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END LEDPayload;