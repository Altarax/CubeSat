----------------------------------------------------------------------------------
--!
--! \file distance_sensor_tb.vhd
--!
--! \brief Testbench for distance_sensor_tb.
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

--! \brief Entity of distance_sensor_tb
entity distance_sensor_tb is
    --  Port ( );
end distance_sensor_tb;

architecture simulation of distance_sensor_tb is
    
	signal clk_in_s : std_logic;
	signal reset_s : std_logic;
	signal ask_for_distance_s : std_logic;
	signal distance_s : real;
	signal echo_s : std_logic;
	signal trigger_s : std_logic;

begin
    
    UUT: entity work.distance_sensor
		port map (
			clk_in => clk_in_s,
			reset => reset_s,
			ask_for_distance => ask_for_distance_s,
			distance => distance_s,
			echo => echo_s,
			trigger => trigger_s
		);

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;