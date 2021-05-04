-- megafunction wizard: %ALTSQRT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: ALTSQRT 

-- ============================================================
-- File Name: sqrt.vhd
-- Megafunction Name(s):
-- 			ALTSQRT
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.1 Build 720 11/11/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY sqrt IS
	PORT
	(
		radical		: IN STD_LOGIC_VECTOR (79 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (39 DOWNTO 0);
		remainder		: OUT STD_LOGIC_VECTOR (40 DOWNTO 0)
	);
END sqrt;


ARCHITECTURE SYN OF sqrt IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (39 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (40 DOWNTO 0);



	COMPONENT altsqrt
	GENERIC (
		pipeline		: NATURAL;
		q_port_width		: NATURAL;
		r_port_width		: NATURAL;
		width		: NATURAL;
		lpm_type		: STRING
	);
	PORT (
			radical	: IN STD_LOGIC_VECTOR (79 DOWNTO 0);
			q	: OUT STD_LOGIC_VECTOR (39 DOWNTO 0);
			remainder	: OUT STD_LOGIC_VECTOR (40 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(39 DOWNTO 0);
	remainder    <= sub_wire1(40 DOWNTO 0);

	ALTSQRT_component : ALTSQRT
	GENERIC MAP (
		pipeline => 0,
		q_port_width => 40,
		r_port_width => 41,
		width => 80,
		lpm_type => "ALTSQRT"
	)
	PORT MAP (
		radical => radical,
		q => sub_wire0,
		remainder => sub_wire1
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: PIPELINE NUMERIC "0"
-- Retrieval info: CONSTANT: Q_PORT_WIDTH NUMERIC "40"
-- Retrieval info: CONSTANT: R_PORT_WIDTH NUMERIC "41"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "80"
-- Retrieval info: USED_PORT: q 0 0 40 0 OUTPUT NODEFVAL "q[39..0]"
-- Retrieval info: USED_PORT: radical 0 0 80 0 INPUT NODEFVAL "radical[79..0]"
-- Retrieval info: USED_PORT: remainder 0 0 41 0 OUTPUT NODEFVAL "remainder[40..0]"
-- Retrieval info: CONNECT: @radical 0 0 80 0 radical 0 0 80 0
-- Retrieval info: CONNECT: q 0 0 40 0 @q 0 0 40 0
-- Retrieval info: CONNECT: remainder 0 0 41 0 @remainder 0 0 41 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf