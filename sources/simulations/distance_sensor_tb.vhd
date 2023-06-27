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
    

begin
    
    UUT: entity work.distance_sensor

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;