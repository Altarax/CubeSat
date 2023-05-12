----------------------------------------------------------------------------------
--!
--! \file template_tb.vhd
--!
--! \brief Testbench for template_tb.
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

--! \brief Entity of template_tb
entity template_tb is
    --  Port ( );
end template_tb;

architecture simulation of template_tb is
    
begin
    
    UUT: entity work.entity_to_test

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;