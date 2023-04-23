-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "04/22/2023 22:06:36"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	accelerometer IS
    PORT (
	clk_50Mhz : IN std_logic;
	reset : IN std_logic;
	ask_for_position : IN std_logic;
	accel_data : OUT std_logic_vector(15 DOWNTO 0);
	i2c_scl : INOUT std_logic;
	i2c_sda : INOUT std_logic
	);
END accelerometer;

-- Design Ports Information
-- i2c_scl	=>  Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- i2c_sda	=>  Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[0]	=>  Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[1]	=>  Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[2]	=>  Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[3]	=>  Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[4]	=>  Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[5]	=>  Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[6]	=>  Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[7]	=>  Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[8]	=>  Location: PIN_115,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[9]	=>  Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[10]	=>  Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[11]	=>  Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[12]	=>  Location: PIN_93,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[13]	=>  Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[14]	=>  Location: PIN_94,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- accel_data[15]	=>  Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk_50Mhz	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ask_for_position	=>  Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF accelerometer IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50Mhz : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_ask_for_position : std_logic;
SIGNAL ww_accel_data : std_logic_vector(15 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50Mhz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fsm:busy_count[2]~regout\ : std_logic;
SIGNAL \i2c_master_inst|state.mstr_ack~regout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[0]~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~4_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~12_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~14_combout\ : std_logic;
SIGNAL \i2c_master_inst|Mux2~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~15_combout\ : std_logic;
SIGNAL \i2c_master_inst|Mux2~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~16_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~17_combout\ : std_logic;
SIGNAL \i2c_master_inst|Mux2~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~18_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~19_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~20_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~21_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~22_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~7_combout\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \i2c_data_wr[6]~0_combout\ : std_logic;
SIGNAL \i2c_data_wr[6]~1_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \clk_50Mhz~combout\ : std_logic;
SIGNAL \clk_50Mhz~clkctrl_outclk\ : std_logic;
SIGNAL \i2c_scl~0\ : std_logic;
SIGNAL \i2c_sda~0\ : std_logic;
SIGNAL \i2c_master_inst|count~4_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \i2c_master_inst|Add0~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~5\ : std_logic;
SIGNAL \i2c_master_inst|Add0~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|Equal0~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~7\ : std_logic;
SIGNAL \i2c_master_inst|Add0~9\ : std_logic;
SIGNAL \i2c_master_inst|Add0~10_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~8_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~7_combout\ : std_logic;
SIGNAL \i2c_master_inst|stretch~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|stretch~regout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~1\ : std_logic;
SIGNAL \i2c_master_inst|Add0~3\ : std_logic;
SIGNAL \i2c_master_inst|Add0~4_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Equal0~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|count~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add0~11\ : std_logic;
SIGNAL \i2c_master_inst|Add0~12_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~8_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~9_combout\ : std_logic;
SIGNAL \i2c_master_inst|scl_clk~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|scl_clk~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector17~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|process_0~4_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_clk~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_clk~regout\ : std_logic;
SIGNAL \i2c_master_inst|data_clk_prev~regout\ : std_logic;
SIGNAL \i2c_master_inst|process_1~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.ready~regout\ : std_logic;
SIGNAL \i2c_master_inst|bit_cnt[0]~1_combout\ : std_logic;
SIGNAL \busy_count~1_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \next_state.init~0_combout\ : std_logic;
SIGNAL \next_state.init~regout\ : std_logic;
SIGNAL \current_state.init~regout\ : std_logic;
SIGNAL \fsm:busy_count[0]~regout\ : std_logic;
SIGNAL \busy_count~0_combout\ : std_logic;
SIGNAL \fsm:busy_count[1]~regout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \ask_for_position~combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \next_state.get_result_t~regout\ : std_logic;
SIGNAL \current_state.get_result_t~regout\ : std_logic;
SIGNAL \busy_count~2_combout\ : std_logic;
SIGNAL \i2c_rw~0_combout\ : std_logic;
SIGNAL \i2c_rw~1_combout\ : std_logic;
SIGNAL \i2c_rw~regout\ : std_logic;
SIGNAL \i2c_master_inst|state~13_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector25~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Add1~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector19~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.command~regout\ : std_logic;
SIGNAL \i2c_master_inst|state~14_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.slv_ack1~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector21~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector21~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.rd~regout\ : std_logic;
SIGNAL \i2c_master_inst|bit_cnt[2]~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Equal1~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|state~15_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.slv_ack2~regout\ : std_logic;
SIGNAL \i2c_master_inst|addr_rw[0]~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|addr_rw[0]~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector20~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector20~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.wr~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector0~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector0~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector0~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|busy~regout\ : std_logic;
SIGNAL \busy_prev~0_combout\ : std_logic;
SIGNAL \busy_prev~regout\ : std_logic;
SIGNAL \fsm~0_combout\ : std_logic;
SIGNAL \i2c_ena~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \i2c_ena~1_combout\ : std_logic;
SIGNAL \i2c_ena~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector22~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.stop~regout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~9_combout\ : std_logic;
SIGNAL \i2c_master_inst|scl_ena~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|scl_ena~regout\ : std_logic;
SIGNAL \i2c_master_inst|scl~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector18~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector18~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|state.start~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~9_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~8_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~10_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~11_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~13_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~7_combout\ : std_logic;
SIGNAL \i2c_master_inst|Selector23~23_combout\ : std_logic;
SIGNAL \i2c_master_inst|sda_int~regout\ : std_logic;
SIGNAL \i2c_master_inst|Selector29~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[0]~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[0]~feeder_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[0]~3_combout\ : std_logic;
SIGNAL \accel_data_s[0]~0_combout\ : std_logic;
SIGNAL \next_state.send_config_t~0_combout\ : std_logic;
SIGNAL \next_state.send_config_t~regout\ : std_logic;
SIGNAL \current_state.send_config_t~regout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \get_data_done~regout\ : std_logic;
SIGNAL \accel_data~0_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[1]~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[1]~feeder_combout\ : std_logic;
SIGNAL \accel_data~1_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[2]~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[2]~feeder_combout\ : std_logic;
SIGNAL \accel_data~2_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~4_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[3]~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[3]~feeder_combout\ : std_logic;
SIGNAL \accel_data~3_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[4]~4_combout\ : std_logic;
SIGNAL \accel_data~4_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[5]~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[5]~feeder_combout\ : std_logic;
SIGNAL \accel_data~5_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~7_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[6]~6_combout\ : std_logic;
SIGNAL \accel_data~6_combout\ : std_logic;
SIGNAL \i2c_master_inst|Decoder0~8_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rx[7]~7_combout\ : std_logic;
SIGNAL \i2c_master_inst|data_rd[7]~feeder_combout\ : std_logic;
SIGNAL \accel_data~7_combout\ : std_logic;
SIGNAL \accel_data_s[8]~1_combout\ : std_logic;
SIGNAL \accel_data_s[8]~2_combout\ : std_logic;
SIGNAL \accel_data~8_combout\ : std_logic;
SIGNAL \accel_data~9_combout\ : std_logic;
SIGNAL \accel_data~10_combout\ : std_logic;
SIGNAL \accel_data~11_combout\ : std_logic;
SIGNAL \accel_data~12_combout\ : std_logic;
SIGNAL \accel_data~13_combout\ : std_logic;
SIGNAL \accel_data~14_combout\ : std_logic;
SIGNAL \accel_data~15_combout\ : std_logic;
SIGNAL i2c_data_wr : std_logic_vector(7 DOWNTO 0);
SIGNAL accel_data_s : std_logic_vector(15 DOWNTO 0);
SIGNAL \i2c_master_inst|data_tx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i2c_master_inst|data_rx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i2c_master_inst|data_rd\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i2c_master_inst|count\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \i2c_master_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \i2c_master_inst|addr_rw\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~combout\ : std_logic;

BEGIN

ww_clk_50Mhz <= clk_50Mhz;
ww_reset <= reset;
ww_ask_for_position <= ask_for_position;
accel_data <= ww_accel_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);

\clk_50Mhz~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk_50Mhz~combout\);
\ALT_INV_reset~combout\ <= NOT \reset~combout\;

-- Location: LCFF_X18_Y9_N9
\fsm:busy_count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector4~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \current_state.init~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm:busy_count[2]~regout\);

-- Location: LCFF_X19_Y9_N13
\i2c_master_inst|state.mstr_ack\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[0]~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.mstr_ack~regout\);

-- Location: LCCOMB_X18_Y9_N8
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\busy_count~2_combout\ & ((!\Mux18~0_combout\) # (!\i2c_master_inst|busy~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|busy~regout\,
	datac => \busy_count~2_combout\,
	datad => \Mux18~0_combout\,
	combout => \Selector4~0_combout\);

-- Location: LCFF_X12_Y13_N7
\i2c_master_inst|count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|count~5_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(0));

-- Location: LCFF_X12_Y13_N25
\i2c_master_inst|count[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|count~7_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(4));

-- Location: LCCOMB_X12_Y13_N0
\i2c_master_inst|count~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~0_combout\ = (\i2c_master_inst|count\(2)) # (!\i2c_master_inst|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|count\(2),
	datad => \i2c_master_inst|count\(0),
	combout => \i2c_master_inst|count~0_combout\);

-- Location: LCCOMB_X13_Y13_N6
\i2c_master_inst|LessThan1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|LessThan1~0_combout\ = (!\i2c_master_inst|Equal0~1_combout\ & ((\i2c_master_inst|Add0~10_combout\) # (\i2c_master_inst|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Equal0~1_combout\,
	datac => \i2c_master_inst|Add0~10_combout\,
	datad => \i2c_master_inst|Add0~12_combout\,
	combout => \i2c_master_inst|LessThan1~0_combout\);

-- Location: LCCOMB_X18_Y8_N4
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\current_state.get_result_t~regout\) # (!\current_state.send_config_t~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.send_config_t~regout\,
	datad => \current_state.get_result_t~regout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X19_Y9_N12
\i2c_master_inst|data_rd[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[0]~2_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|bit_cnt\(2) & \i2c_master_inst|state.rd~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(0),
	datac => \i2c_master_inst|bit_cnt\(2),
	datad => \i2c_master_inst|state.rd~regout\,
	combout => \i2c_master_inst|data_rd[0]~2_combout\);

-- Location: LCFF_X18_Y8_N21
\i2c_data_wr[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector23~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(0));

-- Location: LCFF_X18_Y8_N27
\i2c_data_wr[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector21~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(2));

-- Location: LCFF_X18_Y8_N11
\i2c_data_wr[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector20~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(3));

-- Location: LCCOMB_X18_Y8_N12
\i2c_master_inst|Selector23~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~3_combout\ = (\i2c_master_inst|bit_cnt\(0) & ((i2c_data_wr(2)))) # (!\i2c_master_inst|bit_cnt\(0) & (i2c_data_wr(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => i2c_data_wr(3),
	datab => \i2c_master_inst|bit_cnt\(0),
	datad => i2c_data_wr(2),
	combout => \i2c_master_inst|Selector23~3_combout\);

-- Location: LCFF_X18_Y8_N15
\i2c_data_wr[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector17~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(6));

-- Location: LCFF_X18_Y8_N31
\i2c_data_wr[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector19~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(4));

-- Location: LCFF_X18_Y8_N25
\i2c_data_wr[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector18~0_combout\,
	ena => \i2c_data_wr[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => i2c_data_wr(5));

-- Location: LCCOMB_X19_Y8_N24
\i2c_master_inst|Selector23~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~4_combout\ = (\i2c_master_inst|bit_cnt\(0) & (((i2c_data_wr(4))) # (!\i2c_master_inst|bit_cnt\(1)))) # (!\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|bit_cnt\(1) & ((i2c_data_wr(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(0),
	datab => \i2c_master_inst|bit_cnt\(1),
	datac => i2c_data_wr(4),
	datad => i2c_data_wr(5),
	combout => \i2c_master_inst|Selector23~4_combout\);

-- Location: LCCOMB_X19_Y8_N18
\i2c_master_inst|Selector23~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~5_combout\ = (\i2c_master_inst|bit_cnt\(2) & (((\i2c_master_inst|bit_cnt\(1))))) # (!\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|Selector23~4_combout\ & ((i2c_data_wr(6)) # (\i2c_master_inst|bit_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => i2c_data_wr(6),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|Selector23~4_combout\,
	datad => \i2c_master_inst|bit_cnt\(1),
	combout => \i2c_master_inst|Selector23~5_combout\);

-- Location: LCCOMB_X19_Y8_N20
\i2c_master_inst|Selector23~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~6_combout\ = (\i2c_master_inst|bit_cnt\(2) & ((\i2c_master_inst|Selector23~5_combout\ & ((i2c_data_wr(0)))) # (!\i2c_master_inst|Selector23~5_combout\ & (\i2c_master_inst|Selector23~3_combout\)))) # 
-- (!\i2c_master_inst|bit_cnt\(2) & (((\i2c_master_inst|Selector23~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Selector23~3_combout\,
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => i2c_data_wr(0),
	datad => \i2c_master_inst|Selector23~5_combout\,
	combout => \i2c_master_inst|Selector23~6_combout\);

-- Location: LCCOMB_X20_Y8_N6
\i2c_master_inst|Selector23~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~12_combout\ = (\i2c_master_inst|state.rd~regout\ & ((\i2c_rw~regout\ $ (\i2c_master_inst|addr_rw\(0))) # (!\i2c_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_rw~regout\,
	datab => \i2c_ena~regout\,
	datac => \i2c_master_inst|state.rd~regout\,
	datad => \i2c_master_inst|addr_rw\(0),
	combout => \i2c_master_inst|Selector23~12_combout\);

-- Location: LCCOMB_X20_Y8_N22
\i2c_master_inst|Selector23~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~14_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|state.command~regout\ & \i2c_master_inst|bit_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|state.command~regout\,
	datac => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Selector23~14_combout\);

-- Location: LCFF_X19_Y8_N27
\i2c_master_inst|data_tx[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(6),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(6));

-- Location: LCFF_X19_Y8_N9
\i2c_master_inst|data_tx[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(3),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(3));

-- Location: LCFF_X19_Y8_N23
\i2c_master_inst|data_tx[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(2),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(2));

-- Location: LCCOMB_X19_Y8_N22
\i2c_master_inst|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Mux2~0_combout\ = (\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|data_tx\(3))) # (!\i2c_master_inst|bit_cnt\(0) & ((\i2c_master_inst|data_tx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|data_tx\(3),
	datac => \i2c_master_inst|data_tx\(2),
	datad => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Mux2~0_combout\);

-- Location: LCCOMB_X19_Y8_N4
\i2c_master_inst|Selector23~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~15_combout\ = (\i2c_master_inst|Add1~0_combout\ & (((\i2c_master_inst|Mux2~0_combout\)))) # (!\i2c_master_inst|Add1~0_combout\ & (\i2c_master_inst|data_tx\(6) & (!\i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|data_tx\(6),
	datab => \i2c_master_inst|bit_cnt\(0),
	datac => \i2c_master_inst|Add1~0_combout\,
	datad => \i2c_master_inst|Mux2~0_combout\,
	combout => \i2c_master_inst|Selector23~15_combout\);

-- Location: LCFF_X19_Y8_N3
\i2c_master_inst|data_tx[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(5),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(5));

-- Location: LCFF_X19_Y8_N29
\i2c_master_inst|data_tx[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(4),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(4));

-- Location: LCCOMB_X19_Y8_N28
\i2c_master_inst|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Mux2~1_combout\ = (\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|data_tx\(5))) # (!\i2c_master_inst|bit_cnt\(0) & ((\i2c_master_inst|data_tx\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|data_tx\(5),
	datac => \i2c_master_inst|data_tx\(4),
	datad => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Mux2~1_combout\);

-- Location: LCFF_X19_Y8_N11
\i2c_master_inst|data_tx[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => i2c_data_wr(0),
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_tx\(0));

-- Location: LCCOMB_X19_Y8_N12
\i2c_master_inst|Selector23~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~16_combout\ = (\i2c_master_inst|Add1~0_combout\ & ((\i2c_master_inst|data_tx\(0)))) # (!\i2c_master_inst|Add1~0_combout\ & (\i2c_master_inst|Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add1~0_combout\,
	datac => \i2c_master_inst|Mux2~1_combout\,
	datad => \i2c_master_inst|data_tx\(0),
	combout => \i2c_master_inst|Selector23~16_combout\);

-- Location: LCCOMB_X20_Y8_N8
\i2c_master_inst|Selector23~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~17_combout\ = (\i2c_master_inst|state.wr~regout\ & ((\i2c_master_inst|Selector25~0_combout\ & ((\i2c_master_inst|Selector23~16_combout\))) # (!\i2c_master_inst|Selector25~0_combout\ & 
-- (\i2c_master_inst|Selector23~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.wr~regout\,
	datab => \i2c_master_inst|Selector25~0_combout\,
	datac => \i2c_master_inst|Selector23~15_combout\,
	datad => \i2c_master_inst|Selector23~16_combout\,
	combout => \i2c_master_inst|Selector23~17_combout\);

-- Location: LCCOMB_X19_Y8_N2
\i2c_master_inst|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Mux2~2_combout\ = (\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|data_tx\(4))) # (!\i2c_master_inst|bit_cnt\(0) & ((\i2c_master_inst|data_tx\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|data_tx\(4),
	datac => \i2c_master_inst|data_tx\(5),
	datad => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Mux2~2_combout\);

-- Location: LCCOMB_X19_Y8_N10
\i2c_master_inst|Selector23~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~18_combout\ = ((\i2c_master_inst|bit_cnt\(2) & ((\i2c_master_inst|data_tx\(0)))) # (!\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|Mux2~2_combout\))) # (!\i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(2),
	datab => \i2c_master_inst|Mux2~2_combout\,
	datac => \i2c_master_inst|data_tx\(0),
	datad => \i2c_master_inst|bit_cnt\(1),
	combout => \i2c_master_inst|Selector23~18_combout\);

-- Location: LCCOMB_X19_Y8_N26
\i2c_master_inst|Selector23~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~19_combout\ = (\i2c_master_inst|bit_cnt\(0) & ((\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|data_tx\(2))) # (!\i2c_master_inst|bit_cnt\(2) & ((\i2c_master_inst|data_tx\(6)))))) # (!\i2c_master_inst|bit_cnt\(0) & 
-- (((\i2c_master_inst|bit_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|data_tx\(2),
	datab => \i2c_master_inst|bit_cnt\(0),
	datac => \i2c_master_inst|data_tx\(6),
	datad => \i2c_master_inst|bit_cnt\(2),
	combout => \i2c_master_inst|Selector23~19_combout\);

-- Location: LCCOMB_X19_Y8_N8
\i2c_master_inst|Selector23~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~20_combout\ = (\i2c_master_inst|bit_cnt\(1)) # ((\i2c_master_inst|Selector23~19_combout\ & ((\i2c_master_inst|bit_cnt\(0)) # (\i2c_master_inst|data_tx\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(0),
	datab => \i2c_master_inst|bit_cnt\(1),
	datac => \i2c_master_inst|data_tx\(3),
	datad => \i2c_master_inst|Selector23~19_combout\,
	combout => \i2c_master_inst|Selector23~20_combout\);

-- Location: LCCOMB_X19_Y8_N14
\i2c_master_inst|Selector23~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~21_combout\ = (\i2c_master_inst|addr_rw\(0)) # ((\i2c_master_inst|Selector23~18_combout\ & \i2c_master_inst|Selector23~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|addr_rw\(0),
	datac => \i2c_master_inst|Selector23~18_combout\,
	datad => \i2c_master_inst|Selector23~20_combout\,
	combout => \i2c_master_inst|Selector23~21_combout\);

-- Location: LCCOMB_X20_Y8_N10
\i2c_master_inst|Selector23~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~22_combout\ = (\i2c_master_inst|Selector23~14_combout\) # ((\i2c_master_inst|Selector23~17_combout\) # ((\i2c_master_inst|state.slv_ack1~regout\ & \i2c_master_inst|Selector23~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.slv_ack1~regout\,
	datab => \i2c_master_inst|Selector23~14_combout\,
	datac => \i2c_master_inst|Selector23~17_combout\,
	datad => \i2c_master_inst|Selector23~21_combout\,
	combout => \i2c_master_inst|Selector23~22_combout\);

-- Location: LCCOMB_X12_Y13_N6
\i2c_master_inst|count~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~5_combout\ = (!\i2c_master_inst|Equal0~1_combout\ & \i2c_master_inst|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|Equal0~1_combout\,
	datad => \i2c_master_inst|Add0~0_combout\,
	combout => \i2c_master_inst|count~5_combout\);

-- Location: LCCOMB_X12_Y13_N24
\i2c_master_inst|count~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~7_combout\ = (!\i2c_master_inst|Equal0~1_combout\ & \i2c_master_inst|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Equal0~1_combout\,
	datad => \i2c_master_inst|Add0~8_combout\,
	combout => \i2c_master_inst|count~7_combout\);

-- Location: LCCOMB_X18_Y8_N20
\Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (!\busy_count~0_combout\ & ((!\busy_count~1_combout\) # (!\current_state.send_config_t~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.send_config_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X18_Y8_N0
\i2c_data_wr[6]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_data_wr[6]~0_combout\ = (\reset~combout\) # ((!\current_state.get_result_t~regout\ & !\current_state.send_config_t~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datac => \current_state.get_result_t~regout\,
	datad => \current_state.send_config_t~regout\,
	combout => \i2c_data_wr[6]~0_combout\);

-- Location: LCCOMB_X18_Y8_N18
\i2c_data_wr[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_data_wr[6]~1_combout\ = (!\i2c_data_wr[6]~0_combout\ & (!\busy_count~2_combout\ & ((\current_state.send_config_t~regout\) # (!\busy_count~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy_count~1_combout\,
	datab => \i2c_data_wr[6]~0_combout\,
	datac => \current_state.send_config_t~regout\,
	datad => \busy_count~2_combout\,
	combout => \i2c_data_wr[6]~1_combout\);

-- Location: LCCOMB_X18_Y8_N26
\Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\busy_count~0_combout\ & ((!\busy_count~1_combout\) # (!\current_state.send_config_t~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.send_config_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X18_Y8_N10
\Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\current_state.get_result_t~regout\) # ((!\busy_count~1_combout\) # (!\busy_count~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X18_Y8_N14
\Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (!\current_state.get_result_t~regout\ & (!\busy_count~0_combout\ & !\busy_count~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X18_Y8_N30
\Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\current_state.get_result_t~regout\) # ((\busy_count~0_combout\ & !\busy_count~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X18_Y8_N24
\Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (\current_state.get_result_t~regout\) # ((!\busy_count~0_combout\ & !\busy_count~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datac => \busy_count~0_combout\,
	datad => \busy_count~1_combout\,
	combout => \Selector18~0_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk_50Mhz~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk_50Mhz,
	combout => \clk_50Mhz~combout\);

-- Location: CLKCTRL_G2
\clk_50Mhz~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50Mhz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50Mhz~clkctrl_outclk\);

-- Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\i2c_scl~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2c_master_inst|scl~1_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => i2c_scl,
	combout => \i2c_scl~0\);

-- Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\i2c_sda~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2c_master_inst|Selector29~0_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => i2c_sda,
	combout => \i2c_sda~0\);

-- Location: LCCOMB_X12_Y13_N26
\i2c_master_inst|count~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~4_combout\ = (\i2c_master_inst|Add0~2_combout\ & !\i2c_master_inst|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~2_combout\,
	datac => \i2c_master_inst|Equal0~1_combout\,
	combout => \i2c_master_inst|count~4_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X12_Y13_N27
\i2c_master_inst|count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|count~4_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(1));

-- Location: LCCOMB_X12_Y13_N10
\i2c_master_inst|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~0_combout\ = (\i2c_master_inst|count\(0) & (\i2c_master_inst|stretch~regout\ $ (GND))) # (!\i2c_master_inst|count\(0) & (!\i2c_master_inst|stretch~regout\ & VCC))
-- \i2c_master_inst|Add0~1\ = CARRY((\i2c_master_inst|count\(0) & !\i2c_master_inst|stretch~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count\(0),
	datab => \i2c_master_inst|stretch~regout\,
	datad => VCC,
	combout => \i2c_master_inst|Add0~0_combout\,
	cout => \i2c_master_inst|Add0~1\);

-- Location: LCCOMB_X13_Y13_N18
\i2c_master_inst|count~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~6_combout\ = (!\i2c_master_inst|Equal0~1_combout\ & \i2c_master_inst|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Equal0~1_combout\,
	datac => \i2c_master_inst|Add0~10_combout\,
	combout => \i2c_master_inst|count~6_combout\);

-- Location: LCFF_X13_Y13_N19
\i2c_master_inst|count[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|count~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(5));

-- Location: LCCOMB_X12_Y13_N14
\i2c_master_inst|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~4_combout\ = (\i2c_master_inst|count\(2) & (\i2c_master_inst|Add0~3\ $ (GND))) # (!\i2c_master_inst|count\(2) & (!\i2c_master_inst|Add0~3\ & VCC))
-- \i2c_master_inst|Add0~5\ = CARRY((\i2c_master_inst|count\(2) & !\i2c_master_inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|count\(2),
	datad => VCC,
	cin => \i2c_master_inst|Add0~3\,
	combout => \i2c_master_inst|Add0~4_combout\,
	cout => \i2c_master_inst|Add0~5\);

-- Location: LCCOMB_X12_Y13_N16
\i2c_master_inst|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~6_combout\ = (\i2c_master_inst|count\(3) & (!\i2c_master_inst|Add0~5\)) # (!\i2c_master_inst|count\(3) & ((\i2c_master_inst|Add0~5\) # (GND)))
-- \i2c_master_inst|Add0~7\ = CARRY((!\i2c_master_inst|Add0~5\) # (!\i2c_master_inst|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|count\(3),
	datad => VCC,
	cin => \i2c_master_inst|Add0~5\,
	combout => \i2c_master_inst|Add0~6_combout\,
	cout => \i2c_master_inst|Add0~7\);

-- Location: LCCOMB_X12_Y13_N8
\i2c_master_inst|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Equal0~0_combout\ = (\i2c_master_inst|count\(4) & (\i2c_master_inst|count\(6) & (\i2c_master_inst|count\(3) & \i2c_master_inst|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count\(4),
	datab => \i2c_master_inst|count\(6),
	datac => \i2c_master_inst|count\(3),
	datad => \i2c_master_inst|count\(5),
	combout => \i2c_master_inst|Equal0~0_combout\);

-- Location: LCCOMB_X12_Y13_N2
\i2c_master_inst|count~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~3_combout\ = (\i2c_master_inst|Add0~6_combout\ & ((\i2c_master_inst|count~0_combout\) # ((!\i2c_master_inst|Equal0~0_combout\) # (!\i2c_master_inst|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count~0_combout\,
	datab => \i2c_master_inst|count\(1),
	datac => \i2c_master_inst|Add0~6_combout\,
	datad => \i2c_master_inst|Equal0~0_combout\,
	combout => \i2c_master_inst|count~3_combout\);

-- Location: LCFF_X12_Y13_N9
\i2c_master_inst|count[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|count~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(3));

-- Location: LCCOMB_X12_Y13_N18
\i2c_master_inst|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~8_combout\ = (\i2c_master_inst|count\(4) & (\i2c_master_inst|Add0~7\ $ (GND))) # (!\i2c_master_inst|count\(4) & (!\i2c_master_inst|Add0~7\ & VCC))
-- \i2c_master_inst|Add0~9\ = CARRY((\i2c_master_inst|count\(4) & !\i2c_master_inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count\(4),
	datad => VCC,
	cin => \i2c_master_inst|Add0~7\,
	combout => \i2c_master_inst|Add0~8_combout\,
	cout => \i2c_master_inst|Add0~9\);

-- Location: LCCOMB_X12_Y13_N20
\i2c_master_inst|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~10_combout\ = (\i2c_master_inst|count\(5) & (!\i2c_master_inst|Add0~9\)) # (!\i2c_master_inst|count\(5) & ((\i2c_master_inst|Add0~9\) # (GND)))
-- \i2c_master_inst|Add0~11\ = CARRY((!\i2c_master_inst|Add0~9\) # (!\i2c_master_inst|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|count\(5),
	datad => VCC,
	cin => \i2c_master_inst|Add0~9\,
	combout => \i2c_master_inst|Add0~10_combout\,
	cout => \i2c_master_inst|Add0~11\);

-- Location: LCCOMB_X12_Y13_N12
\i2c_master_inst|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~2_combout\ = (\i2c_master_inst|count\(1) & (!\i2c_master_inst|Add0~1\)) # (!\i2c_master_inst|count\(1) & ((\i2c_master_inst|Add0~1\) # (GND)))
-- \i2c_master_inst|Add0~3\ = CARRY((!\i2c_master_inst|Add0~1\) # (!\i2c_master_inst|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|count\(1),
	datad => VCC,
	cin => \i2c_master_inst|Add0~1\,
	combout => \i2c_master_inst|Add0~2_combout\,
	cout => \i2c_master_inst|Add0~3\);

-- Location: LCCOMB_X13_Y13_N14
\i2c_master_inst|process_0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~6_combout\ = (\i2c_master_inst|Add0~2_combout\) # ((\i2c_master_inst|Add0~0_combout\ & !\i2c_master_inst|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Add0~0_combout\,
	datac => \i2c_master_inst|Add0~10_combout\,
	datad => \i2c_master_inst|Add0~2_combout\,
	combout => \i2c_master_inst|process_0~6_combout\);

-- Location: LCCOMB_X13_Y13_N0
\i2c_master_inst|process_0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~5_combout\ = (\i2c_master_inst|Add0~8_combout\ & (\i2c_master_inst|Add0~4_combout\ & \i2c_master_inst|count~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Add0~8_combout\,
	datac => \i2c_master_inst|Add0~4_combout\,
	datad => \i2c_master_inst|count~3_combout\,
	combout => \i2c_master_inst|process_0~5_combout\);

-- Location: LCCOMB_X13_Y13_N4
\i2c_master_inst|process_0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~7_combout\ = (\i2c_master_inst|Add0~10_combout\ & ((\i2c_master_inst|count~2_combout\) # ((!\i2c_master_inst|process_0~5_combout\) # (!\i2c_master_inst|process_0~6_combout\)))) # (!\i2c_master_inst|Add0~10_combout\ & 
-- (((\i2c_master_inst|process_0~6_combout\ & \i2c_master_inst|process_0~5_combout\)) # (!\i2c_master_inst|count~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~10_combout\,
	datab => \i2c_master_inst|count~2_combout\,
	datac => \i2c_master_inst|process_0~6_combout\,
	datad => \i2c_master_inst|process_0~5_combout\,
	combout => \i2c_master_inst|process_0~7_combout\);

-- Location: LCCOMB_X12_Y13_N4
\i2c_master_inst|stretch~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|stretch~0_combout\ = (\i2c_master_inst|process_0~7_combout\ & ((\i2c_master_inst|stretch~regout\))) # (!\i2c_master_inst|process_0~7_combout\ & (!\i2c_scl~0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_scl~0\,
	datac => \i2c_master_inst|stretch~regout\,
	datad => \i2c_master_inst|process_0~7_combout\,
	combout => \i2c_master_inst|stretch~0_combout\);

-- Location: LCFF_X12_Y13_N5
\i2c_master_inst|stretch\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|stretch~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|stretch~regout\);

-- Location: LCCOMB_X12_Y13_N30
\i2c_master_inst|count~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~1_combout\ = (\i2c_master_inst|Add0~4_combout\ & ((\i2c_master_inst|count~0_combout\) # ((!\i2c_master_inst|Equal0~0_combout\) # (!\i2c_master_inst|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count~0_combout\,
	datab => \i2c_master_inst|count\(1),
	datac => \i2c_master_inst|Add0~4_combout\,
	datad => \i2c_master_inst|Equal0~0_combout\,
	combout => \i2c_master_inst|count~1_combout\);

-- Location: LCFF_X12_Y13_N1
\i2c_master_inst|count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|count~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(2));

-- Location: LCCOMB_X13_Y13_N8
\i2c_master_inst|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Equal0~1_combout\ = (\i2c_master_inst|count\(0) & (\i2c_master_inst|count\(1) & (!\i2c_master_inst|count\(2) & \i2c_master_inst|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|count\(0),
	datab => \i2c_master_inst|count\(1),
	datac => \i2c_master_inst|count\(2),
	datad => \i2c_master_inst|Equal0~0_combout\,
	combout => \i2c_master_inst|Equal0~1_combout\);

-- Location: LCCOMB_X13_Y13_N2
\i2c_master_inst|count~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|count~2_combout\ = (!\i2c_master_inst|Equal0~1_combout\ & \i2c_master_inst|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|Equal0~1_combout\,
	datad => \i2c_master_inst|Add0~12_combout\,
	combout => \i2c_master_inst|count~2_combout\);

-- Location: LCFF_X13_Y13_N25
\i2c_master_inst|count[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|count~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|count\(6));

-- Location: LCCOMB_X12_Y13_N22
\i2c_master_inst|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add0~12_combout\ = \i2c_master_inst|Add0~11\ $ (!\i2c_master_inst|count\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|count\(6),
	cin => \i2c_master_inst|Add0~11\,
	combout => \i2c_master_inst|Add0~12_combout\);

-- Location: LCCOMB_X12_Y13_N28
\i2c_master_inst|process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~2_combout\ = (\i2c_master_inst|Add0~2_combout\ & (\i2c_master_inst|Add0~4_combout\ & (\i2c_master_inst|Add0~6_combout\ & \i2c_master_inst|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~2_combout\,
	datab => \i2c_master_inst|Add0~4_combout\,
	datac => \i2c_master_inst|Add0~6_combout\,
	datad => \i2c_master_inst|Add0~8_combout\,
	combout => \i2c_master_inst|process_0~2_combout\);

-- Location: LCCOMB_X13_Y13_N30
\i2c_master_inst|process_0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~3_combout\ = (\i2c_master_inst|Add0~12_combout\) # ((\i2c_master_inst|Equal0~1_combout\) # ((\i2c_master_inst|Add0~10_combout\ & \i2c_master_inst|process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~10_combout\,
	datab => \i2c_master_inst|Add0~12_combout\,
	datac => \i2c_master_inst|Equal0~1_combout\,
	datad => \i2c_master_inst|process_0~2_combout\,
	combout => \i2c_master_inst|process_0~3_combout\);

-- Location: LCCOMB_X13_Y13_N10
\i2c_master_inst|process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~0_combout\ = (((!\i2c_master_inst|Add0~8_combout\) # (!\i2c_master_inst|Add0~0_combout\)) # (!\i2c_master_inst|Add0~6_combout\)) # (!\i2c_master_inst|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~2_combout\,
	datab => \i2c_master_inst|Add0~6_combout\,
	datac => \i2c_master_inst|Add0~0_combout\,
	datad => \i2c_master_inst|Add0~8_combout\,
	combout => \i2c_master_inst|process_0~0_combout\);

-- Location: LCCOMB_X13_Y13_N20
\i2c_master_inst|process_0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~1_combout\ = (!\i2c_master_inst|Add0~10_combout\ & ((\i2c_master_inst|Equal0~1_combout\) # ((\i2c_master_inst|process_0~0_combout\) # (!\i2c_master_inst|count~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~10_combout\,
	datab => \i2c_master_inst|Equal0~1_combout\,
	datac => \i2c_master_inst|count~1_combout\,
	datad => \i2c_master_inst|process_0~0_combout\,
	combout => \i2c_master_inst|process_0~1_combout\);

-- Location: LCCOMB_X13_Y13_N22
\i2c_master_inst|process_0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~8_combout\ = (\i2c_master_inst|Add0~2_combout\ & (\i2c_master_inst|Add0~6_combout\ & (!\i2c_master_inst|Equal0~1_combout\ & \i2c_master_inst|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Add0~2_combout\,
	datab => \i2c_master_inst|Add0~6_combout\,
	datac => \i2c_master_inst|Equal0~1_combout\,
	datad => \i2c_master_inst|Add0~8_combout\,
	combout => \i2c_master_inst|process_0~8_combout\);

-- Location: LCCOMB_X13_Y13_N28
\i2c_master_inst|process_0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~9_combout\ = (\i2c_master_inst|Add0~0_combout\ & (\i2c_master_inst|count~1_combout\ & \i2c_master_inst|process_0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Add0~0_combout\,
	datac => \i2c_master_inst|count~1_combout\,
	datad => \i2c_master_inst|process_0~8_combout\,
	combout => \i2c_master_inst|process_0~9_combout\);

-- Location: LCCOMB_X13_Y13_N26
\i2c_master_inst|scl_clk~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|scl_clk~0_combout\ = (\i2c_master_inst|LessThan1~0_combout\ & ((\i2c_master_inst|process_0~3_combout\) # ((\i2c_master_inst|process_0~1_combout\)))) # (!\i2c_master_inst|LessThan1~0_combout\ & (\i2c_master_inst|process_0~9_combout\ & 
-- ((\i2c_master_inst|process_0~3_combout\) # (\i2c_master_inst|process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|LessThan1~0_combout\,
	datab => \i2c_master_inst|process_0~3_combout\,
	datac => \i2c_master_inst|process_0~1_combout\,
	datad => \i2c_master_inst|process_0~9_combout\,
	combout => \i2c_master_inst|scl_clk~0_combout\);

-- Location: LCFF_X13_Y13_N27
\i2c_master_inst|scl_clk\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|scl_clk~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|scl_clk~regout\);

-- Location: LCCOMB_X19_Y9_N18
\i2c_master_inst|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector17~0_combout\ = (!\i2c_master_inst|state.stop~regout\ & ((\i2c_master_inst|state.ready~regout\) # (\i2c_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.ready~regout\,
	datab => \i2c_ena~regout\,
	datac => \i2c_master_inst|state.stop~regout\,
	combout => \i2c_master_inst|Selector17~0_combout\);

-- Location: LCCOMB_X13_Y13_N12
\i2c_master_inst|process_0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_0~4_combout\ = (\i2c_master_inst|process_0~1_combout\) # (\i2c_master_inst|process_0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|process_0~1_combout\,
	datad => \i2c_master_inst|process_0~3_combout\,
	combout => \i2c_master_inst|process_0~4_combout\);

-- Location: LCCOMB_X13_Y13_N16
\i2c_master_inst|data_clk~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_clk~0_combout\ = (\i2c_master_inst|LessThan1~0_combout\ & (((!\i2c_master_inst|process_0~4_combout\) # (!\i2c_master_inst|process_0~7_combout\)))) # (!\i2c_master_inst|LessThan1~0_combout\ & (\i2c_master_inst|process_0~9_combout\ & 
-- ((!\i2c_master_inst|process_0~4_combout\) # (!\i2c_master_inst|process_0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|LessThan1~0_combout\,
	datab => \i2c_master_inst|process_0~9_combout\,
	datac => \i2c_master_inst|process_0~7_combout\,
	datad => \i2c_master_inst|process_0~4_combout\,
	combout => \i2c_master_inst|data_clk~0_combout\);

-- Location: LCFF_X13_Y13_N17
\i2c_master_inst|data_clk\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_clk~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_clk~regout\);

-- Location: LCFF_X20_Y9_N5
\i2c_master_inst|data_clk_prev\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_clk~regout\,
	sload => VCC,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_clk_prev~regout\);

-- Location: LCCOMB_X20_Y9_N2
\i2c_master_inst|process_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|process_1~0_combout\ = (!\i2c_master_inst|data_clk_prev~regout\ & \i2c_master_inst|data_clk~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|data_clk_prev~regout\,
	datad => \i2c_master_inst|data_clk~regout\,
	combout => \i2c_master_inst|process_1~0_combout\);

-- Location: LCFF_X19_Y9_N25
\i2c_master_inst|state.ready\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|Selector17~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.ready~regout\);

-- Location: LCCOMB_X19_Y8_N0
\i2c_master_inst|bit_cnt[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|bit_cnt[0]~1_combout\ = !\i2c_master_inst|bit_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|bit_cnt[0]~1_combout\);

-- Location: LCCOMB_X18_Y9_N2
\busy_count~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_count~1_combout\ = \fsm:busy_count[0]~regout\ $ (((!\i2c_master_inst|busy~regout\ & !\busy_prev~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|busy~regout\,
	datac => \busy_prev~regout\,
	datad => \fsm:busy_count[0]~regout\,
	combout => \busy_count~1_combout\);

-- Location: LCCOMB_X18_Y9_N18
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\i2c_master_inst|busy~regout\ & \Mux18~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|busy~regout\,
	datad => \Mux18~0_combout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X18_Y8_N16
\next_state.init~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.init~0_combout\ = (\Selector3~0_combout\ & (((\next_state.init~regout\)))) # (!\Selector3~0_combout\ & (((!\Selector0~0_combout\)) # (!\current_state.get_result_t~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datab => \Selector3~0_combout\,
	datac => \next_state.init~regout\,
	datad => \Selector0~0_combout\,
	combout => \next_state.init~0_combout\);

-- Location: LCFF_X18_Y8_N17
\next_state.init\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \next_state.init~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_state.init~regout\);

-- Location: LCFF_X18_Y8_N13
\current_state.init\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \next_state.init~regout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.init~regout\);

-- Location: LCFF_X18_Y9_N27
\fsm:busy_count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \busy_count~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \current_state.init~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm:busy_count[0]~regout\);

-- Location: LCCOMB_X18_Y9_N26
\busy_count~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_count~0_combout\ = \fsm:busy_count[1]~regout\ $ (((!\busy_prev~regout\ & (!\i2c_master_inst|busy~regout\ & \fsm:busy_count[0]~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy_prev~regout\,
	datab => \i2c_master_inst|busy~regout\,
	datac => \fsm:busy_count[0]~regout\,
	datad => \fsm:busy_count[1]~regout\,
	combout => \busy_count~0_combout\);

-- Location: LCFF_X18_Y9_N29
\fsm:busy_count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \busy_count~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \current_state.init~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm:busy_count[1]~regout\);

-- Location: LCCOMB_X18_Y9_N30
\Mux18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\fsm:busy_count[2]~regout\ & (!\fsm:busy_count[1]~regout\ & (!\fsm~0_combout\ & !\fsm:busy_count[0]~regout\))) # (!\fsm:busy_count[2]~regout\ & (\fsm:busy_count[1]~regout\ & (\fsm~0_combout\ & \fsm:busy_count[0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm:busy_count[2]~regout\,
	datab => \fsm:busy_count[1]~regout\,
	datac => \fsm~0_combout\,
	datad => \fsm:busy_count[0]~regout\,
	combout => \Mux18~0_combout\);

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ask_for_position~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ask_for_position,
	combout => \ask_for_position~combout\);

-- Location: LCCOMB_X18_Y8_N22
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\current_state.init~regout\ & (((!\Mux18~0_combout\)) # (!\i2c_master_inst|busy~regout\))) # (!\current_state.init~regout\ & (((!\ask_for_position~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.init~regout\,
	datab => \i2c_master_inst|busy~regout\,
	datac => \Mux18~0_combout\,
	datad => \ask_for_position~combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X18_Y8_N2
\Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~0_combout\ & (((\next_state.get_result_t~regout\)))) # (!\Selector3~0_combout\ & (!\Selector3~1_combout\ & ((\Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~1_combout\,
	datab => \Selector3~0_combout\,
	datac => \next_state.get_result_t~regout\,
	datad => \Selector0~0_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCFF_X18_Y8_N3
\next_state.get_result_t\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector3~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_state.get_result_t~regout\);

-- Location: LCFF_X18_Y8_N1
\current_state.get_result_t\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \next_state.get_result_t~regout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.get_result_t~regout\);

-- Location: LCCOMB_X18_Y9_N16
\busy_count~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_count~2_combout\ = \fsm:busy_count[2]~regout\ $ (((\fsm:busy_count[1]~regout\ & (\fsm~0_combout\ & \fsm:busy_count[0]~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm:busy_count[2]~regout\,
	datab => \fsm:busy_count[1]~regout\,
	datac => \fsm~0_combout\,
	datad => \fsm:busy_count[0]~regout\,
	combout => \busy_count~2_combout\);

-- Location: LCCOMB_X18_Y8_N28
\i2c_rw~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_rw~0_combout\ = (!\reset~combout\ & (!\busy_count~2_combout\ & \current_state.init~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \busy_count~2_combout\,
	datad => \current_state.init~regout\,
	combout => \i2c_rw~0_combout\);

-- Location: LCCOMB_X18_Y8_N6
\i2c_rw~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_rw~1_combout\ = (\i2c_rw~0_combout\ & (\busy_count~1_combout\ & (\current_state.get_result_t~regout\))) # (!\i2c_rw~0_combout\ & (((\i2c_rw~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy_count~1_combout\,
	datab => \current_state.get_result_t~regout\,
	datac => \i2c_rw~regout\,
	datad => \i2c_rw~0_combout\,
	combout => \i2c_rw~1_combout\);

-- Location: LCFF_X18_Y8_N7
i2c_rw : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_rw~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_rw~regout\);

-- Location: LCCOMB_X19_Y9_N30
\i2c_master_inst|state~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|state~13_combout\ = (\i2c_master_inst|addr_rw\(0) $ (\i2c_rw~regout\)) # (!\i2c_ena~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|addr_rw\(0),
	datac => \i2c_ena~regout\,
	datad => \i2c_rw~regout\,
	combout => \i2c_master_inst|state~13_combout\);

-- Location: LCCOMB_X19_Y8_N30
\i2c_master_inst|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector25~0_combout\ = \i2c_master_inst|bit_cnt\(1) $ (\i2c_master_inst|bit_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i2c_master_inst|bit_cnt\(1),
	datad => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Selector25~0_combout\);

-- Location: LCFF_X19_Y8_N31
\i2c_master_inst|bit_cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector25~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|bit_cnt\(1));

-- Location: LCCOMB_X19_Y8_N16
\i2c_master_inst|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Add1~0_combout\ = \i2c_master_inst|bit_cnt\(2) $ (((\i2c_master_inst|bit_cnt\(1) & \i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|bit_cnt\(1),
	datac => \i2c_master_inst|bit_cnt\(2),
	datad => \i2c_master_inst|bit_cnt\(0),
	combout => \i2c_master_inst|Add1~0_combout\);

-- Location: LCFF_X19_Y8_N17
\i2c_master_inst|bit_cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Add1~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|bit_cnt\(2));

-- Location: LCCOMB_X19_Y9_N14
\i2c_master_inst|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector19~0_combout\ = (\i2c_master_inst|state.start~regout\) # ((\i2c_master_inst|state.command~regout\ & !\i2c_master_inst|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.start~regout\,
	datac => \i2c_master_inst|state.command~regout\,
	datad => \i2c_master_inst|Equal1~0_combout\,
	combout => \i2c_master_inst|Selector19~0_combout\);

-- Location: LCFF_X19_Y9_N15
\i2c_master_inst|state.command\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector19~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.command~regout\);

-- Location: LCCOMB_X20_Y9_N14
\i2c_master_inst|state~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|state~14_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|state.command~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|state.command~regout\,
	combout => \i2c_master_inst|state~14_combout\);

-- Location: LCFF_X19_Y9_N5
\i2c_master_inst|state.slv_ack1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|state~14_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.slv_ack1~regout\);

-- Location: LCCOMB_X19_Y9_N28
\i2c_master_inst|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector21~0_combout\ = (\i2c_master_inst|addr_rw\(0) & ((\i2c_master_inst|state.slv_ack1~regout\) # ((\i2c_master_inst|state.rd~regout\ & !\i2c_master_inst|Equal1~0_combout\)))) # (!\i2c_master_inst|addr_rw\(0) & 
-- (\i2c_master_inst|state.rd~regout\ & ((!\i2c_master_inst|Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|addr_rw\(0),
	datab => \i2c_master_inst|state.rd~regout\,
	datac => \i2c_master_inst|state.slv_ack1~regout\,
	datad => \i2c_master_inst|Equal1~0_combout\,
	combout => \i2c_master_inst|Selector21~0_combout\);

-- Location: LCCOMB_X19_Y9_N0
\i2c_master_inst|Selector21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector21~1_combout\ = (\i2c_master_inst|Selector21~0_combout\) # ((\i2c_master_inst|state.mstr_ack~regout\ & !\i2c_master_inst|state~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_master_inst|state~13_combout\,
	datad => \i2c_master_inst|Selector21~0_combout\,
	combout => \i2c_master_inst|Selector21~1_combout\);

-- Location: LCFF_X19_Y9_N1
\i2c_master_inst|state.rd\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector21~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.rd~regout\);

-- Location: LCCOMB_X20_Y9_N16
\i2c_master_inst|bit_cnt[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|bit_cnt[2]~0_combout\ = (\i2c_master_inst|process_1~0_combout\ & ((\i2c_master_inst|state.command~regout\) # ((\i2c_master_inst|state.wr~regout\) # (\i2c_master_inst|state.rd~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.command~regout\,
	datab => \i2c_master_inst|state.wr~regout\,
	datac => \i2c_master_inst|state.rd~regout\,
	datad => \i2c_master_inst|process_1~0_combout\,
	combout => \i2c_master_inst|bit_cnt[2]~0_combout\);

-- Location: LCFF_X19_Y8_N1
\i2c_master_inst|bit_cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|bit_cnt[0]~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|bit_cnt[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|bit_cnt\(0));

-- Location: LCCOMB_X20_Y8_N0
\i2c_master_inst|Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Equal1~0_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|bit_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|bit_cnt\(2),
	combout => \i2c_master_inst|Equal1~0_combout\);

-- Location: LCCOMB_X20_Y8_N2
\i2c_master_inst|state~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|state~15_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|state.wr~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|state.wr~regout\,
	combout => \i2c_master_inst|state~15_combout\);

-- Location: LCFF_X20_Y8_N3
\i2c_master_inst|state.slv_ack2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|state~15_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.slv_ack2~regout\);

-- Location: LCCOMB_X19_Y9_N8
\i2c_master_inst|addr_rw[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|addr_rw[0]~2_combout\ = (\i2c_ena~regout\ & ((\i2c_master_inst|state.mstr_ack~regout\) # ((\i2c_master_inst|state.slv_ack2~regout\) # (!\i2c_master_inst|state.ready~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_ena~regout\,
	datac => \i2c_master_inst|state.ready~regout\,
	datad => \i2c_master_inst|state.slv_ack2~regout\,
	combout => \i2c_master_inst|addr_rw[0]~2_combout\);

-- Location: LCCOMB_X19_Y9_N26
\i2c_master_inst|addr_rw[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|addr_rw[0]~3_combout\ = (!\i2c_master_inst|data_clk_prev~regout\ & (!\reset~combout\ & (\i2c_master_inst|addr_rw[0]~2_combout\ & \i2c_master_inst|data_clk~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|data_clk_prev~regout\,
	datab => \reset~combout\,
	datac => \i2c_master_inst|addr_rw[0]~2_combout\,
	datad => \i2c_master_inst|data_clk~regout\,
	combout => \i2c_master_inst|addr_rw[0]~3_combout\);

-- Location: LCFF_X19_Y8_N7
\i2c_master_inst|addr_rw[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_rw~regout\,
	sload => VCC,
	ena => \i2c_master_inst|addr_rw[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|addr_rw\(0));

-- Location: LCCOMB_X19_Y9_N10
\i2c_master_inst|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector20~0_combout\ = (\i2c_master_inst|state.slv_ack2~regout\ & (((\i2c_master_inst|state.slv_ack1~regout\ & !\i2c_master_inst|addr_rw\(0))) # (!\i2c_master_inst|state~13_combout\))) # (!\i2c_master_inst|state.slv_ack2~regout\ & 
-- (((\i2c_master_inst|state.slv_ack1~regout\ & !\i2c_master_inst|addr_rw\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.slv_ack2~regout\,
	datab => \i2c_master_inst|state~13_combout\,
	datac => \i2c_master_inst|state.slv_ack1~regout\,
	datad => \i2c_master_inst|addr_rw\(0),
	combout => \i2c_master_inst|Selector20~0_combout\);

-- Location: LCCOMB_X20_Y9_N20
\i2c_master_inst|Selector20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector20~1_combout\ = (\i2c_master_inst|Selector20~0_combout\) # ((!\i2c_master_inst|Equal1~0_combout\ & \i2c_master_inst|state.wr~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|Equal1~0_combout\,
	datac => \i2c_master_inst|state.wr~regout\,
	datad => \i2c_master_inst|Selector20~0_combout\,
	combout => \i2c_master_inst|Selector20~1_combout\);

-- Location: LCFF_X20_Y9_N21
\i2c_master_inst|state.wr\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector20~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.wr~regout\);

-- Location: LCCOMB_X20_Y9_N30
\i2c_master_inst|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector0~1_combout\ = (\i2c_master_inst|state.rd~regout\) # ((\i2c_master_inst|state.wr~regout\) # ((!\i2c_master_inst|state.ready~regout\ & \i2c_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.rd~regout\,
	datab => \i2c_master_inst|state.ready~regout\,
	datac => \i2c_master_inst|state.wr~regout\,
	datad => \i2c_ena~regout\,
	combout => \i2c_master_inst|Selector0~1_combout\);

-- Location: LCCOMB_X19_Y9_N2
\i2c_master_inst|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector0~0_combout\ = (!\i2c_master_inst|busy~regout\ & ((\i2c_master_inst|state.command~regout\) # ((\i2c_master_inst|state.slv_ack1~regout\) # (\i2c_master_inst|Selector22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.command~regout\,
	datab => \i2c_master_inst|state.slv_ack1~regout\,
	datac => \i2c_master_inst|Selector22~0_combout\,
	datad => \i2c_master_inst|busy~regout\,
	combout => \i2c_master_inst|Selector0~0_combout\);

-- Location: LCCOMB_X19_Y9_N22
\i2c_master_inst|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector0~2_combout\ = (!\i2c_master_inst|state.start~regout\ & (!\i2c_master_inst|Selector0~1_combout\ & !\i2c_master_inst|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.start~regout\,
	datab => \i2c_master_inst|Selector0~1_combout\,
	datad => \i2c_master_inst|Selector0~0_combout\,
	combout => \i2c_master_inst|Selector0~2_combout\);

-- Location: LCFF_X19_Y9_N23
\i2c_master_inst|busy\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector0~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|busy~regout\);

-- Location: LCCOMB_X18_Y9_N20
\busy_prev~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_prev~0_combout\ = (\reset~combout\ & (((\busy_prev~regout\)))) # (!\reset~combout\ & ((\current_state.init~regout\ & (!\i2c_master_inst|busy~regout\)) # (!\current_state.init~regout\ & ((\busy_prev~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \i2c_master_inst|busy~regout\,
	datac => \busy_prev~regout\,
	datad => \current_state.init~regout\,
	combout => \busy_prev~0_combout\);

-- Location: LCFF_X18_Y9_N21
busy_prev : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \busy_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \busy_prev~regout\);

-- Location: LCCOMB_X18_Y9_N14
\fsm~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm~0_combout\ = (!\busy_prev~regout\ & !\i2c_master_inst|busy~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \busy_prev~regout\,
	datad => \i2c_master_inst|busy~regout\,
	combout => \fsm~0_combout\);

-- Location: LCCOMB_X18_Y9_N28
\i2c_ena~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_ena~0_combout\ = (\fsm:busy_count[2]~regout\ & (\fsm~0_combout\ & (\fsm:busy_count[1]~regout\ & \fsm:busy_count[0]~regout\))) # (!\fsm:busy_count[2]~regout\ & (!\fsm~0_combout\ & (!\fsm:busy_count[1]~regout\ & !\fsm:busy_count[0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm:busy_count[2]~regout\,
	datab => \fsm~0_combout\,
	datac => \fsm:busy_count[1]~regout\,
	datad => \fsm:busy_count[0]~regout\,
	combout => \i2c_ena~0_combout\);

-- Location: LCCOMB_X18_Y9_N0
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\fsm:busy_count[0]~regout\ & ((\i2c_master_inst|busy~regout\) # ((\busy_prev~regout\) # (!\fsm:busy_count[1]~regout\)))) # (!\fsm:busy_count[0]~regout\ & ((\fsm:busy_count[1]~regout\) # ((!\i2c_master_inst|busy~regout\ & 
-- !\busy_prev~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|busy~regout\,
	datab => \fsm:busy_count[0]~regout\,
	datac => \busy_prev~regout\,
	datad => \fsm:busy_count[1]~regout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X18_Y9_N4
\i2c_ena~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_ena~1_combout\ = (\current_state.init~regout\ & ((\Mux0~0_combout\ & ((\i2c_ena~regout\))) # (!\Mux0~0_combout\ & (\i2c_ena~0_combout\)))) # (!\current_state.init~regout\ & (((\i2c_ena~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.init~regout\,
	datab => \i2c_ena~0_combout\,
	datac => \i2c_ena~regout\,
	datad => \Mux0~0_combout\,
	combout => \i2c_ena~1_combout\);

-- Location: LCFF_X18_Y9_N5
i2c_ena : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_ena~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_ena~regout\);

-- Location: LCCOMB_X19_Y9_N4
\i2c_master_inst|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector22~0_combout\ = (!\i2c_ena~regout\ & ((\i2c_master_inst|state.mstr_ack~regout\) # (\i2c_master_inst|state.slv_ack2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_ena~regout\,
	datad => \i2c_master_inst|state.slv_ack2~regout\,
	combout => \i2c_master_inst|Selector22~0_combout\);

-- Location: LCFF_X19_Y9_N19
\i2c_master_inst|state.stop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|Selector22~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.stop~regout\);

-- Location: LCCOMB_X19_Y9_N24
\i2c_master_inst|Decoder0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~9_combout\ = (\i2c_master_inst|data_clk_prev~regout\ & !\i2c_master_inst|data_clk~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|data_clk_prev~regout\,
	datad => \i2c_master_inst|data_clk~regout\,
	combout => \i2c_master_inst|Decoder0~9_combout\);

-- Location: LCCOMB_X18_Y9_N10
\i2c_master_inst|scl_ena~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|scl_ena~0_combout\ = (\i2c_master_inst|Decoder0~9_combout\ & ((\i2c_master_inst|state.start~regout\) # ((!\i2c_master_inst|state.stop~regout\ & \i2c_master_inst|scl_ena~regout\)))) # (!\i2c_master_inst|Decoder0~9_combout\ & 
-- (((\i2c_master_inst|scl_ena~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.start~regout\,
	datab => \i2c_master_inst|state.stop~regout\,
	datac => \i2c_master_inst|scl_ena~regout\,
	datad => \i2c_master_inst|Decoder0~9_combout\,
	combout => \i2c_master_inst|scl_ena~0_combout\);

-- Location: LCFF_X18_Y9_N11
\i2c_master_inst|scl_ena\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|scl_ena~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|scl_ena~regout\);

-- Location: LCCOMB_X13_Y13_N24
\i2c_master_inst|scl~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|scl~1_combout\ = (\i2c_master_inst|scl_clk~regout\) # (!\i2c_master_inst|scl_ena~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|scl_clk~regout\,
	datad => \i2c_master_inst|scl_ena~regout\,
	combout => \i2c_master_inst|scl~1_combout\);

-- Location: LCCOMB_X19_Y9_N20
\i2c_master_inst|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector18~0_combout\ = (\i2c_master_inst|state.mstr_ack~regout\ & (\i2c_rw~regout\ $ (((\i2c_master_inst|addr_rw\(0)))))) # (!\i2c_master_inst|state.mstr_ack~regout\ & (\i2c_master_inst|state.slv_ack2~regout\ & (\i2c_rw~regout\ $ 
-- (\i2c_master_inst|addr_rw\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_rw~regout\,
	datac => \i2c_master_inst|state.slv_ack2~regout\,
	datad => \i2c_master_inst|addr_rw\(0),
	combout => \i2c_master_inst|Selector18~0_combout\);

-- Location: LCCOMB_X19_Y9_N6
\i2c_master_inst|Selector18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector18~1_combout\ = (\i2c_ena~regout\ & ((\i2c_master_inst|Selector18~0_combout\) # (!\i2c_master_inst|state.ready~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.ready~regout\,
	datab => \i2c_ena~regout\,
	datac => \i2c_master_inst|Selector18~0_combout\,
	combout => \i2c_master_inst|Selector18~1_combout\);

-- Location: LCFF_X19_Y9_N7
\i2c_master_inst|state.start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector18~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|state.start~regout\);

-- Location: LCCOMB_X20_Y8_N24
\i2c_master_inst|Selector23~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~9_combout\ = (\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(1) & \i2c_master_inst|addr_rw\(0))) # (!\i2c_master_inst|bit_cnt\(2) & (!\i2c_master_inst|bit_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(1),
	datad => \i2c_master_inst|addr_rw\(0),
	combout => \i2c_master_inst|Selector23~9_combout\);

-- Location: LCCOMB_X20_Y8_N26
\i2c_master_inst|Selector23~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~8_combout\ = (\i2c_master_inst|state.command~regout\) # ((\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|state.start~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(0),
	datab => \i2c_master_inst|state.command~regout\,
	datac => \i2c_master_inst|state.start~regout\,
	combout => \i2c_master_inst|Selector23~8_combout\);

-- Location: LCCOMB_X20_Y8_N18
\i2c_master_inst|Selector23~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~10_combout\ = (\i2c_master_inst|state.mstr_ack~regout\ & (((\i2c_master_inst|Selector23~9_combout\ & \i2c_master_inst|Selector23~8_combout\)) # (!\i2c_master_inst|state~13_combout\))) # (!\i2c_master_inst|state.mstr_ack~regout\ 
-- & (\i2c_master_inst|Selector23~9_combout\ & ((\i2c_master_inst|Selector23~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_master_inst|Selector23~9_combout\,
	datac => \i2c_master_inst|state~13_combout\,
	datad => \i2c_master_inst|Selector23~8_combout\,
	combout => \i2c_master_inst|Selector23~10_combout\);

-- Location: LCCOMB_X20_Y8_N4
\i2c_master_inst|Selector23~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~11_combout\ = (!\i2c_master_inst|bit_cnt\(0) & (\i2c_master_inst|state.start~regout\ & (\i2c_master_inst|bit_cnt\(1) $ (\i2c_master_inst|bit_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|state.start~regout\,
	combout => \i2c_master_inst|Selector23~11_combout\);

-- Location: LCCOMB_X20_Y8_N20
\i2c_master_inst|Selector23~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~13_combout\ = (\i2c_master_inst|Selector23~11_combout\) # ((\i2c_master_inst|Equal1~0_combout\ & ((\i2c_master_inst|Selector23~12_combout\) # (\i2c_master_inst|state.wr~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Selector23~12_combout\,
	datab => \i2c_master_inst|Equal1~0_combout\,
	datac => \i2c_master_inst|Selector23~11_combout\,
	datad => \i2c_master_inst|state.wr~regout\,
	combout => \i2c_master_inst|Selector23~13_combout\);

-- Location: LCCOMB_X19_Y8_N6
\i2c_master_inst|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~0_combout\ = (\i2c_master_inst|state.slv_ack2~regout\ & ((\i2c_rw~regout\ $ (\i2c_master_inst|addr_rw\(0))) # (!\i2c_ena~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.slv_ack2~regout\,
	datab => \i2c_rw~regout\,
	datac => \i2c_master_inst|addr_rw\(0),
	datad => \i2c_ena~regout\,
	combout => \i2c_master_inst|Selector23~0_combout\);

-- Location: LCCOMB_X20_Y8_N16
\i2c_master_inst|Selector23~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~1_combout\ = (\i2c_master_inst|state.mstr_ack~regout\) # (((\i2c_master_inst|state.stop~regout\) # (\i2c_master_inst|Selector23~0_combout\)) # (!\i2c_master_inst|state.ready~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.mstr_ack~regout\,
	datab => \i2c_master_inst|state.ready~regout\,
	datac => \i2c_master_inst|state.stop~regout\,
	datad => \i2c_master_inst|Selector23~0_combout\,
	combout => \i2c_master_inst|Selector23~1_combout\);

-- Location: LCCOMB_X20_Y8_N30
\i2c_master_inst|Selector23~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~2_combout\ = (!\i2c_master_inst|sda_int~regout\ & ((\i2c_master_inst|Selector23~1_combout\) # ((\i2c_master_inst|state.rd~regout\ & !\i2c_master_inst|Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|sda_int~regout\,
	datab => \i2c_master_inst|state.rd~regout\,
	datac => \i2c_master_inst|Selector23~1_combout\,
	datad => \i2c_master_inst|Equal1~0_combout\,
	combout => \i2c_master_inst|Selector23~2_combout\);

-- Location: LCCOMB_X20_Y8_N28
\i2c_master_inst|Selector23~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~7_combout\ = (\i2c_master_inst|Selector23~2_combout\) # ((\i2c_master_inst|Selector23~6_combout\ & (\i2c_master_inst|state.slv_ack2~regout\ & !\i2c_master_inst|state~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Selector23~6_combout\,
	datab => \i2c_master_inst|state.slv_ack2~regout\,
	datac => \i2c_master_inst|state~13_combout\,
	datad => \i2c_master_inst|Selector23~2_combout\,
	combout => \i2c_master_inst|Selector23~7_combout\);

-- Location: LCCOMB_X20_Y8_N12
\i2c_master_inst|Selector23~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector23~23_combout\ = (!\i2c_master_inst|Selector23~22_combout\ & (!\i2c_master_inst|Selector23~10_combout\ & (!\i2c_master_inst|Selector23~13_combout\ & !\i2c_master_inst|Selector23~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|Selector23~22_combout\,
	datab => \i2c_master_inst|Selector23~10_combout\,
	datac => \i2c_master_inst|Selector23~13_combout\,
	datad => \i2c_master_inst|Selector23~7_combout\,
	combout => \i2c_master_inst|Selector23~23_combout\);

-- Location: LCFF_X20_Y8_N13
\i2c_master_inst|sda_int\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|Selector23~23_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|sda_int~regout\);

-- Location: LCCOMB_X20_Y8_N14
\i2c_master_inst|Selector29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Selector29~0_combout\ = (\i2c_master_inst|state.start~regout\ & (\i2c_master_inst|data_clk_prev~regout\)) # (!\i2c_master_inst|state.start~regout\ & ((\i2c_master_inst|state.stop~regout\ & (!\i2c_master_inst|data_clk_prev~regout\)) # 
-- (!\i2c_master_inst|state.stop~regout\ & ((!\i2c_master_inst|sda_int~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.start~regout\,
	datab => \i2c_master_inst|data_clk_prev~regout\,
	datac => \i2c_master_inst|state.stop~regout\,
	datad => \i2c_master_inst|sda_int~regout\,
	combout => \i2c_master_inst|Selector29~0_combout\);

-- Location: LCCOMB_X20_Y9_N0
\i2c_master_inst|Decoder0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~0_combout\ = (!\reset~combout\ & (\i2c_master_inst|data_clk_prev~regout\ & (\i2c_master_inst|state.rd~regout\ & !\i2c_master_inst|data_clk~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \i2c_master_inst|data_clk_prev~regout\,
	datac => \i2c_master_inst|state.rd~regout\,
	datad => \i2c_master_inst|data_clk~regout\,
	combout => \i2c_master_inst|Decoder0~0_combout\);

-- Location: LCCOMB_X20_Y9_N26
\i2c_master_inst|Decoder0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~1_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~1_combout\);

-- Location: LCCOMB_X21_Y9_N12
\i2c_master_inst|data_rx[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[0]~0_combout\ = (\i2c_master_inst|Decoder0~1_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~1_combout\ & ((\i2c_master_inst|data_rx\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(0),
	datad => \i2c_master_inst|Decoder0~1_combout\,
	combout => \i2c_master_inst|data_rx[0]~0_combout\);

-- Location: LCFF_X21_Y9_N13
\i2c_master_inst|data_rx[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(0));

-- Location: LCCOMB_X21_Y9_N0
\i2c_master_inst|data_rd[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[0]~feeder_combout\ = \i2c_master_inst|data_rx\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(0),
	combout => \i2c_master_inst|data_rd[0]~feeder_combout\);

-- Location: LCCOMB_X20_Y9_N6
\i2c_master_inst|data_rd[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[0]~3_combout\ = (\i2c_master_inst|state.rd~regout\ & (!\i2c_master_inst|data_clk_prev~regout\ & (\i2c_master_inst|data_clk~regout\ & \i2c_master_inst|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|state.rd~regout\,
	datab => \i2c_master_inst|data_clk_prev~regout\,
	datac => \i2c_master_inst|data_clk~regout\,
	datad => \i2c_master_inst|Equal1~0_combout\,
	combout => \i2c_master_inst|data_rd[0]~3_combout\);

-- Location: LCFF_X21_Y9_N1
\i2c_master_inst|data_rd[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[0]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(0));

-- Location: LCCOMB_X18_Y9_N12
\accel_data_s[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data_s[0]~0_combout\ = (\i2c_master_inst|busy~regout\ & (\current_state.get_result_t~regout\ & (!\reset~combout\ & \Mux18~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|busy~regout\,
	datab => \current_state.get_result_t~regout\,
	datac => \reset~combout\,
	datad => \Mux18~0_combout\,
	combout => \accel_data_s[0]~0_combout\);

-- Location: LCFF_X22_Y9_N1
\accel_data_s[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(0),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(0));

-- Location: LCCOMB_X18_Y8_N8
\next_state.send_config_t~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.send_config_t~0_combout\ = (\next_state.send_config_t~regout\ & (((!\current_state.init~regout\) # (!\Selector0~0_combout\)))) # (!\next_state.send_config_t~regout\ & (\ask_for_position~combout\ & ((!\current_state.init~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ask_for_position~combout\,
	datab => \Selector0~0_combout\,
	datac => \next_state.send_config_t~regout\,
	datad => \current_state.init~regout\,
	combout => \next_state.send_config_t~0_combout\);

-- Location: LCFF_X18_Y8_N9
\next_state.send_config_t\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \next_state.send_config_t~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_state.send_config_t~regout\);

-- Location: LCFF_X18_Y8_N19
\current_state.send_config_t\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \next_state.send_config_t~regout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.send_config_t~regout\);

-- Location: LCCOMB_X19_Y9_N16
\Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\current_state.get_result_t~regout\ & (((\get_data_done~regout\) # (\Selector0~0_combout\)))) # (!\current_state.get_result_t~regout\ & (\current_state.send_config_t~regout\ & (\get_data_done~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.get_result_t~regout\,
	datab => \current_state.send_config_t~regout\,
	datac => \get_data_done~regout\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCFF_X19_Y9_N17
get_data_done : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \Selector0~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \get_data_done~regout\);

-- Location: LCCOMB_X22_Y9_N0
\accel_data~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~0_combout\ = (accel_data_s(0) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(0),
	datad => \get_data_done~regout\,
	combout => \accel_data~0_combout\);

-- Location: LCCOMB_X20_Y9_N8
\i2c_master_inst|Decoder0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~2_combout\ = (\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (!\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~2_combout\);

-- Location: LCCOMB_X21_Y9_N18
\i2c_master_inst|data_rx[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[1]~1_combout\ = (\i2c_master_inst|Decoder0~2_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~2_combout\ & ((\i2c_master_inst|data_rx\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(1),
	datad => \i2c_master_inst|Decoder0~2_combout\,
	combout => \i2c_master_inst|data_rx[1]~1_combout\);

-- Location: LCFF_X21_Y9_N19
\i2c_master_inst|data_rx[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(1));

-- Location: LCCOMB_X21_Y9_N30
\i2c_master_inst|data_rd[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[1]~feeder_combout\ = \i2c_master_inst|data_rx\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(1),
	combout => \i2c_master_inst|data_rd[1]~feeder_combout\);

-- Location: LCFF_X21_Y9_N31
\i2c_master_inst|data_rd[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[1]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(1));

-- Location: LCFF_X22_Y9_N11
\accel_data_s[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(1),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(1));

-- Location: LCCOMB_X22_Y9_N10
\accel_data~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~1_combout\ = (accel_data_s(1) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(1),
	datad => \get_data_done~regout\,
	combout => \accel_data~1_combout\);

-- Location: LCCOMB_X20_Y9_N18
\i2c_master_inst|Decoder0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~3_combout\ = (!\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~3_combout\);

-- Location: LCCOMB_X21_Y9_N28
\i2c_master_inst|data_rx[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[2]~2_combout\ = (\i2c_master_inst|Decoder0~3_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~3_combout\ & ((\i2c_master_inst|data_rx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(2),
	datad => \i2c_master_inst|Decoder0~3_combout\,
	combout => \i2c_master_inst|data_rx[2]~2_combout\);

-- Location: LCFF_X21_Y9_N29
\i2c_master_inst|data_rx[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(2));

-- Location: LCCOMB_X21_Y9_N24
\i2c_master_inst|data_rd[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[2]~feeder_combout\ = \i2c_master_inst|data_rx\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(2),
	combout => \i2c_master_inst|data_rd[2]~feeder_combout\);

-- Location: LCFF_X21_Y9_N25
\i2c_master_inst|data_rd[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[2]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(2));

-- Location: LCFF_X22_Y9_N25
\accel_data_s[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(2),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(2));

-- Location: LCCOMB_X22_Y9_N24
\accel_data~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~2_combout\ = (accel_data_s(2) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(2),
	datad => \get_data_done~regout\,
	combout => \accel_data~2_combout\);

-- Location: LCCOMB_X20_Y9_N28
\i2c_master_inst|Decoder0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~4_combout\ = (!\i2c_master_inst|bit_cnt\(1) & (\i2c_master_inst|bit_cnt\(2) & (!\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~4_combout\);

-- Location: LCCOMB_X21_Y9_N22
\i2c_master_inst|data_rx[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[3]~3_combout\ = (\i2c_master_inst|Decoder0~4_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~4_combout\ & ((\i2c_master_inst|data_rx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(3),
	datad => \i2c_master_inst|Decoder0~4_combout\,
	combout => \i2c_master_inst|data_rx[3]~3_combout\);

-- Location: LCFF_X21_Y9_N23
\i2c_master_inst|data_rx[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(3));

-- Location: LCCOMB_X21_Y9_N14
\i2c_master_inst|data_rd[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[3]~feeder_combout\ = \i2c_master_inst|data_rx\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(3),
	combout => \i2c_master_inst|data_rd[3]~feeder_combout\);

-- Location: LCFF_X21_Y9_N15
\i2c_master_inst|data_rd[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[3]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(3));

-- Location: LCFF_X22_Y9_N31
\accel_data_s[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(3),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(3));

-- Location: LCCOMB_X22_Y9_N30
\accel_data~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~3_combout\ = (accel_data_s(3) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(3),
	datad => \get_data_done~regout\,
	combout => \accel_data~3_combout\);

-- Location: LCCOMB_X20_Y9_N22
\i2c_master_inst|Decoder0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~5_combout\ = (\i2c_master_inst|bit_cnt\(1) & (!\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~5_combout\);

-- Location: LCCOMB_X21_Y9_N8
\i2c_master_inst|data_rx[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[4]~4_combout\ = (\i2c_master_inst|Decoder0~5_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~5_combout\ & ((\i2c_master_inst|data_rx\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(4),
	datad => \i2c_master_inst|Decoder0~5_combout\,
	combout => \i2c_master_inst|data_rx[4]~4_combout\);

-- Location: LCFF_X21_Y9_N9
\i2c_master_inst|data_rx[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(4));

-- Location: LCFF_X21_Y9_N21
\i2c_master_inst|data_rd[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rx\(4),
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(4));

-- Location: LCFF_X22_Y9_N21
\accel_data_s[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(4),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(4));

-- Location: LCCOMB_X22_Y9_N20
\accel_data~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~4_combout\ = (accel_data_s(4) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(4),
	datad => \get_data_done~regout\,
	combout => \accel_data~4_combout\);

-- Location: LCCOMB_X20_Y9_N12
\i2c_master_inst|Decoder0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~6_combout\ = (\i2c_master_inst|bit_cnt\(1) & (!\i2c_master_inst|bit_cnt\(2) & (!\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~6_combout\);

-- Location: LCCOMB_X21_Y9_N26
\i2c_master_inst|data_rx[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[5]~5_combout\ = (\i2c_master_inst|Decoder0~6_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~6_combout\ & ((\i2c_master_inst|data_rx\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(5),
	datad => \i2c_master_inst|Decoder0~6_combout\,
	combout => \i2c_master_inst|data_rx[5]~5_combout\);

-- Location: LCFF_X21_Y9_N27
\i2c_master_inst|data_rx[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(5));

-- Location: LCCOMB_X21_Y9_N10
\i2c_master_inst|data_rd[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[5]~feeder_combout\ = \i2c_master_inst|data_rx\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(5),
	combout => \i2c_master_inst|data_rd[5]~feeder_combout\);

-- Location: LCFF_X21_Y9_N11
\i2c_master_inst|data_rd[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[5]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(5));

-- Location: LCFF_X22_Y9_N23
\accel_data_s[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(5),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(5));

-- Location: LCCOMB_X22_Y9_N22
\accel_data~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~5_combout\ = (accel_data_s(5) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(5),
	datad => \get_data_done~regout\,
	combout => \accel_data~5_combout\);

-- Location: LCCOMB_X20_Y9_N10
\i2c_master_inst|Decoder0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~7_combout\ = (!\i2c_master_inst|bit_cnt\(1) & (!\i2c_master_inst|bit_cnt\(2) & (\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~7_combout\);

-- Location: LCCOMB_X21_Y9_N16
\i2c_master_inst|data_rx[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[6]~6_combout\ = (\i2c_master_inst|Decoder0~7_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~7_combout\ & ((\i2c_master_inst|data_rx\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(6),
	datad => \i2c_master_inst|Decoder0~7_combout\,
	combout => \i2c_master_inst|data_rx[6]~6_combout\);

-- Location: LCFF_X21_Y9_N17
\i2c_master_inst|data_rx[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(6));

-- Location: LCFF_X21_Y9_N5
\i2c_master_inst|data_rd[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rx\(6),
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(6));

-- Location: LCFF_X22_Y9_N29
\accel_data_s[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(6),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(6));

-- Location: LCCOMB_X22_Y9_N28
\accel_data~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~6_combout\ = (accel_data_s(6) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(6),
	datad => \get_data_done~regout\,
	combout => \accel_data~6_combout\);

-- Location: LCCOMB_X20_Y9_N24
\i2c_master_inst|Decoder0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|Decoder0~8_combout\ = (!\i2c_master_inst|bit_cnt\(1) & (!\i2c_master_inst|bit_cnt\(2) & (!\i2c_master_inst|bit_cnt\(0) & \i2c_master_inst|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i2c_master_inst|bit_cnt\(1),
	datab => \i2c_master_inst|bit_cnt\(2),
	datac => \i2c_master_inst|bit_cnt\(0),
	datad => \i2c_master_inst|Decoder0~0_combout\,
	combout => \i2c_master_inst|Decoder0~8_combout\);

-- Location: LCCOMB_X21_Y9_N2
\i2c_master_inst|data_rx[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rx[7]~7_combout\ = (\i2c_master_inst|Decoder0~8_combout\ & (\i2c_sda~0\)) # (!\i2c_master_inst|Decoder0~8_combout\ & ((\i2c_master_inst|data_rx\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_sda~0\,
	datac => \i2c_master_inst|data_rx\(7),
	datad => \i2c_master_inst|Decoder0~8_combout\,
	combout => \i2c_master_inst|data_rx[7]~7_combout\);

-- Location: LCFF_X21_Y9_N3
\i2c_master_inst|data_rx[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rx[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rx\(7));

-- Location: LCCOMB_X21_Y9_N6
\i2c_master_inst|data_rd[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2c_master_inst|data_rd[7]~feeder_combout\ = \i2c_master_inst|data_rx\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i2c_master_inst|data_rx\(7),
	combout => \i2c_master_inst|data_rd[7]~feeder_combout\);

-- Location: LCFF_X21_Y9_N7
\i2c_master_inst|data_rd[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	datain => \i2c_master_inst|data_rd[7]~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \i2c_master_inst|data_rd[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i2c_master_inst|data_rd\(7));

-- Location: LCFF_X22_Y9_N15
\accel_data_s[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(7),
	sload => VCC,
	ena => \accel_data_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(7));

-- Location: LCCOMB_X22_Y9_N14
\accel_data~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~7_combout\ = (accel_data_s(7) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(7),
	datad => \get_data_done~regout\,
	combout => \accel_data~7_combout\);

-- Location: LCCOMB_X18_Y9_N24
\accel_data_s[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data_s[8]~1_combout\ = (!\fsm:busy_count[2]~regout\ & (!\fsm:busy_count[0]~regout\ & (!\reset~combout\ & \fsm:busy_count[1]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm:busy_count[2]~regout\,
	datab => \fsm:busy_count[0]~regout\,
	datac => \reset~combout\,
	datad => \fsm:busy_count[1]~regout\,
	combout => \accel_data_s[8]~1_combout\);

-- Location: LCCOMB_X18_Y9_N22
\accel_data_s[8]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data_s[8]~2_combout\ = (\i2c_master_inst|busy~regout\ & (\accel_data_s[8]~1_combout\ & \current_state.get_result_t~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i2c_master_inst|busy~regout\,
	datac => \accel_data_s[8]~1_combout\,
	datad => \current_state.get_result_t~regout\,
	combout => \accel_data_s[8]~2_combout\);

-- Location: LCFF_X22_Y9_N9
\accel_data_s[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(0),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(8));

-- Location: LCCOMB_X22_Y9_N8
\accel_data~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~8_combout\ = (accel_data_s(8) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(8),
	datad => \get_data_done~regout\,
	combout => \accel_data~8_combout\);

-- Location: LCFF_X22_Y9_N7
\accel_data_s[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(1),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(9));

-- Location: LCCOMB_X22_Y9_N6
\accel_data~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~9_combout\ = (accel_data_s(9) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(9),
	datad => \get_data_done~regout\,
	combout => \accel_data~9_combout\);

-- Location: LCFF_X22_Y9_N13
\accel_data_s[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(2),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(10));

-- Location: LCCOMB_X22_Y9_N12
\accel_data~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~10_combout\ = (accel_data_s(10) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(10),
	datad => \get_data_done~regout\,
	combout => \accel_data~10_combout\);

-- Location: LCFF_X22_Y9_N19
\accel_data_s[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(3),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(11));

-- Location: LCCOMB_X22_Y9_N18
\accel_data~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~11_combout\ = (accel_data_s(11) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(11),
	datad => \get_data_done~regout\,
	combout => \accel_data~11_combout\);

-- Location: LCFF_X22_Y9_N17
\accel_data_s[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(4),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(12));

-- Location: LCCOMB_X22_Y9_N16
\accel_data~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~12_combout\ = (accel_data_s(12) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(12),
	datad => \get_data_done~regout\,
	combout => \accel_data~12_combout\);

-- Location: LCFF_X22_Y9_N3
\accel_data_s[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(5),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(13));

-- Location: LCCOMB_X22_Y9_N2
\accel_data~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~13_combout\ = (accel_data_s(13) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(13),
	datad => \get_data_done~regout\,
	combout => \accel_data~13_combout\);

-- Location: LCFF_X22_Y9_N5
\accel_data_s[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(6),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(14));

-- Location: LCCOMB_X22_Y9_N4
\accel_data~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~14_combout\ = (accel_data_s(14) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(14),
	datad => \get_data_done~regout\,
	combout => \accel_data~14_combout\);

-- Location: LCFF_X22_Y9_N27
\accel_data_s[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50Mhz~clkctrl_outclk\,
	sdata => \i2c_master_inst|data_rd\(7),
	sload => VCC,
	ena => \accel_data_s[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => accel_data_s(15));

-- Location: LCCOMB_X22_Y9_N26
\accel_data~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \accel_data~15_combout\ = (accel_data_s(15) & \get_data_done~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => accel_data_s(15),
	datad => \get_data_done~regout\,
	combout => \accel_data~15_combout\);

-- Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(0));

-- Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(1));

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(2));

-- Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(3));

-- Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(4));

-- Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(5));

-- Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(6));

-- Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(7));

-- Location: PIN_115,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(8));

-- Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(9));

-- Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(10));

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(11));

-- Location: PIN_93,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(12));

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(13));

-- Location: PIN_94,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(14));

-- Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\accel_data[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \accel_data~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_accel_data(15));
END structure;


