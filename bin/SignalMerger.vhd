library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY SignalMerger IS
	PORT(
		left_channel_data: IN SIGNED(23 DOWNTO 0);
		right_channel_data: IN SIGNED(23 DOWNTO 0);
		audio_data: OUT SIGNED(23 DOWNTO 0)
	);
END SignalMerger;

ARCHITECTURE Merger OF SignalMerger IS 
	SIGNAL intermediate_result: SIGNED(24 DOWNTO 0) := (others => '0');
BEGIN
	intermediate_result <= RESIZE(left_channel_data, 25) + RESIZE(right_channel_data, 25);
	audio_data <= RESIZE(SHIFT_RIGHT(intermediate_result, 1), 24);
END Merger;