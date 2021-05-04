library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY FFTWrapper IS
	PORT(
		Clk: IN STD_LOGIC;
		InSignal: IN STD_LOGIC_VECTOR(23 downto 0);
		RealPower: OUT STD_LOGIC_VECTOR(35 downto 0);
		ImagPower: OUT STD_LOGIC_VECTOR(35 downto 0);
		SinkValid: BUFFER STD_LOGIC;
		SinkReady: OUT STD_LOGIC;
		SinkSOP: BUFFER STD_LOGIC;
		SinkEOP: BUFFER STD_LOGIC;
		FFTSourceSOP: OUT STD_LOGIC
	);
END FFTWrapper;

ARCHITECTURE WrapperRunner OF FFTWrapper IS
	SIGNAL shortIn: STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL FFTPts: STD_LOGIC_VECTOR(11 downto 0);
	SIGNAL FFTSourceEOP: STD_LOGIC;
	SIGNAL RealToFFTP: STD_LOGIC_VECTOR(23 downto 0);
	SIGNAL ImagToFFTP: STD_LOGIC_VECTOR(23 downto 0);
	SIGNAL resetN: STD_LOGIC := '0';
	COMPONENT fft_led IS
		PORT (
			clk          : in  std_logic                     := '0';             --    clk.clk
			reset_n      : in  std_logic                     := '0';             --    rst.reset_n
			sink_valid   : in  std_logic                     := '0';             --   sink.sink_valid
			sink_ready   : out std_logic;                                        --       .sink_ready
			sink_error   : in  std_logic_vector(1 downto 0)  := (others => '0'); --       .sink_error
			sink_sop     : in  std_logic                     := '0';             --       .sink_sop
			sink_eop     : in  std_logic                     := '0';             --       .sink_eop
			sink_real    : in  std_logic_vector(23 downto 0) := (others => '0'); --       .sink_real
			sink_imag    : in  std_logic_vector(23 downto 0) := (others => '0'); --       .sink_imag
			fftpts_in    : in  std_logic_vector(11 downto 0) := (others => '0'); --       .fftpts_in
			inverse      : in  std_logic_vector(0 downto 0)  := (others => '0'); --       .inverse
			source_valid : out std_logic;                                        -- source.source_valid
			source_ready : in  std_logic                     := '0';             --       .source_ready
			source_error : out std_logic_vector(1 downto 0);                     --       .source_error
			source_sop   : out std_logic;                                        --       .source_sop
			source_eop   : out std_logic;                                        --       .source_eop
			source_real  : out std_logic_vector(35 downto 0);                    --       .source_real
			source_imag  : out std_logic_vector(35 downto 0);                    --       .source_imag
			fftpts_out   : out std_logic_vector(11 downto 0)                     --       .fftpts_out
		);
	END COMPONENT fft_led;
BEGIN

	DriverInst: ENTITY work.FFTController(FTTCArch) PORT MAP(
		Clk 			=> Clk,
		AudioSignal => InSignal,
		sink_valid 	=> SinkValid,
		sink_eop		=> SinkEOP,
		sink_sop		=> SinkSOP,
--		sink_ready 	=> sinkReady,
		out_real 	=> RealToFFTP,
		out_imag 	=> ImagToFFTP,
--		inverse 		=> inverse,
--		sink_error 	=> sinkError, 
		out_fftps 	=> FFTPts
	);
	
	
	
	FFTInst: COMPONENT fft_led PORT MAP(
		clk          => Clk,
		reset_n      => resetN,
		sink_valid   => SinkValid,
		sink_ready   => SinkReady,
		sink_error   => b"00",
		sink_sop     => SinkSOP,
		sink_eop     => SinkEOP,
		sink_real    => RealToFFTP,
		sink_imag    => ImagToFFTP,
		fftpts_in    => FFTPts,
		inverse      => b"0",
		--source_valid => 
		source_ready => '1',
		--source_error => 
		source_sop   => FFTSourceSOP,
		source_eop   => FFTSourceEOP,
		source_real  => RealPower,
		source_imag  => ImagPower
		--fftpts_out   =>
	);

	PROCESS(Clk)
		VARIABLE Count: unsigned(4 downto 0) := b"00000";
	BEGIN
		IF RISING_EDGE(Clk) THEN
			Count := Count + 1;
			IF Count = b"11111" THEN
				resetN <= '1';
			END IF;
		END IF;
	END PROCESS;
END WrapperRunner;
