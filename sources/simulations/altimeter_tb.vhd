----------------------------------------------------------------------------------
--!
--! \file altimeter_tb.vhd
--!
--! \brief Testbench for altimeter_tb.
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

--! \brief Entity of altimeter_tb
entity altimeter_tb is
    --  Port ( );
end altimeter_tb;

architecture simulation of altimeter_tb is
    
    signal clk_50Mhz_s: std_logic;
    signal reset_s: std_logic;
    signal ask_for_pressure_s: std_logic;
    signal altitude_s: integer;
    signal spi_cont_s: std_logic;
    signal spi_rx_data_s: std_logic_vector(7 downto 0);
    signal spi_ena_s: std_logic;
    signal spi_busy_s: std_logic;
    signal spi_tx_data_s: std_logic_vector(7 downto 0);

begin
    
    UUT: entity work.altimeter

    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;