LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY controlpath IS
	PORT (
		i_R, i_L, i_clock, i_reset : IN STD_LOGIC;
		selDisplayA, selDisplayB, loadDisplay : OUT STD_LOGIC;
		loadLMask, lMaskShiftLeft : OUT STD_LOGIC;
		loadRMask, rMaskShiftRight : OUT STD_LOGIC
	);
END controlpath;

ARCHITECTURE rtl OF controlpath IS
	COMPONENT dff
		PORT (
			i_d : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			i_async_reset : IN STD_LOGIC;
			i_async_set : IN STD_LOGIC;
			o_q, o_qBar : OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL s0, s1, s2, s3, s4 : STD_LOGIC;
BEGIN
	dff_s0 : dff
	PORT MAP(
		i_d => '0',
		i_clock => i_clock,
		i_enable => '1',
		i_async_set => i_reset,
		i_async_reset => '0',
		o_q => s0
	);

	dff_s1 : dff
	PORT MAP(
		i_d => i_L AND i_R,
		i_clock => i_clock,
		i_enable => '1',
		i_async_set => '0',
		i_async_reset => i_reset,
		o_q => s1
	);

	dff_s2 : dff
	PORT MAP(
		i_d => i_L AND NOT i_R,
		i_clock => i_clock,
		i_enable => '1',
		i_async_set => '0',
		i_async_reset => i_reset,
		o_q => s2
	);

	dff_s3 : dff
	PORT MAP(
		i_d => NOT i_L AND i_R,
		i_clock => i_clock,
		i_enable => '1',
		i_async_set => '0',
		i_async_reset => i_reset,
		o_q => s3
	);

	dff_s4 : dff
	PORT MAP(
		i_d => NOT i_L AND NOT i_R,
		i_clock => i_clock,
		i_enable => '1',
		i_async_set => '0',
		i_async_reset => i_reset,
		o_q => s4
	);

	loadDisplay <= s0 OR s1 OR s2 OR s3 OR s4;
	selDisplayA <= s1 OR s3;
	selDisplayB <= s2 OR s3;
	loadLMask <= s0;
	loadRMask <= s0;
	lMaskShiftLeft <= s1 OR s2;
	rMaskShiftRight <= s1 OR s3;
END rtl;