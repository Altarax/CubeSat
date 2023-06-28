----------------------------------------------------------------------------------
--!
--! \file uv_sensor_tb.vhd
--!
--! \brief Testbench for uv_sensor_tb.
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

--! \brief Entity of uv_sensor_tb
entity uv_sensor_tb is
    --  Port ( );
end uv_sensor_tb;

architecture simulation of uv_sensor_tb is
    


begin
    
    UUT: entity work.uv_sensor
	       port map (
       );
	
    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;