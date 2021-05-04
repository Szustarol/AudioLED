library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY FFTController IS 
	PORT(
		Clk: IN STD_LOGIC;
		AudioSignal: IN STD_LOGIC_VECTOR(23 downto 0);
		sink_valid: OUT STD_LOGIC := '0';
		sink_eop: OUT STD_LOGIC;
		sink_sop: OUT STD_LOGIC;
		inverse: OUT STD_LOGIC := '0';
		sink_ready: OUT STD_LOGIC := '1';
		sink_error: OUT STD_LOGIC_VECTOR(1 downto 0) := b"00";
		out_real: OUT STD_LOGIC_VECTOR(23 downto 0);
		out_imag: OUT STD_LOGIC_VECTOR(23 downto 0);
		out_fftps: OUT STD_LOGIC_VECTOR(11 downto 0)
	);
END FFTController;

ARCHITECTURE FTTCArch OF FFTController IS
BEGIN
	out_real <= AudioSignal;
	out_imag <= (others => '0');
	out_fftps <= std_logic_vector(to_unsigned(2048, out_fftps'length));
	PROCESS(Clk)
		VARIABLE count : integer range 0 to 2047 := 0;
	BEGIN
		IF RISING_EDGE(CLK) THEN
			count := count + 1;
			IF count = 2047 THEN
				sink_eop <= '1';
			ELSIF count = 0 THEN
				sink_sop <= '1';
				sink_eop <= '0';
				sink_valid <= '1';
			ELSE
				sink_sop <= '0';
				sink_eop <= '0';
			END IF;				
		END IF;
	END PROCESS;
END FTTCArch;