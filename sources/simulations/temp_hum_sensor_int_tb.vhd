----------------------------------------------------------------------------------
--!
--! \file temp_hum_sensor_int_tb.vhd
--!
--! \brief Testbench for temp_hum_sensor_int_tb.
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

--! \brief Entity of temp_hum_sensor_int_tb
entity temp_hum_sensor_int_tb is
    --  Port ( );
end temp_hum_sensor_int_tb;

architecture simulation of temp_hum_sensor_int_tb is
    

begin
    
    UUT: entity work.temp_hum_sensor_int
		port map (
		);

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;