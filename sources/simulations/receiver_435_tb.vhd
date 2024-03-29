----------------------------------------------------------------------------------
--!
--! \file receiver_435_tb.vhd
--!
--! \brief Testbench for receiver_435_tb.
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

--! \brief Entity of receiver_435_tb
entity receiver_435_tb is
    --  Port ( );
end receiver_435_tb;

architecture simulation of receiver_435_tb is
    


begin
    
    UUT: entity work.receiver_435
	       port map (
       );
	
    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;