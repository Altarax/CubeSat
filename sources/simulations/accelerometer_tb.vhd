----------------------------------------------------------------------------------
--!
--! \file accelerometer_tb.vhd
--!
--! \brief Testbench for accelerometer_tb.
--!
--! \version 1.0
--! \date 
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use simulation librairies
Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--! \brief Entity of accelerometer_tb
entity accelerometer_tb is
    --  Port ( );
end accelerometer_tb;

architecture simulation of accelerometer_tb is
    
    signal clk_50Mhz_s: std_logic;
    signal reset_s: std_logic;
    signal ask_for_position_s: std_logic;
    signal accel_data_s: std_logic_vector(15 downto 0);
    signal i2c_ena_s: std_logic;
    signal i2c_busy_s: std_logic;
    signal i2c_rw_s: std_logic;
    signal i2c_data_wr_s: std_logic_vector(7 downto 0);
    signal i2c_data_rd_s: std_logic_vector(7 downto 0);
    signal i2c_addr_s: std_logic_vector(6 downto 0);

begin
    
    UUT: entity work.accelerometer

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;