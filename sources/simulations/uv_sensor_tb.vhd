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
    
    signal clk_50Mhz_s: std_logic;
    signal reset_s: std_logic;
    signal ask_for_uv_s: std_logic;
    signal uv_data_s: std_logic_vector(8 downto 0);
    signal spi_sck_s: std_logic;
    signal spi_cs_s: std_logic;
    signal spi_data_s: std_logic;

begin
    
    UUT: entity work.uv_sensor
	       port map (
          clk_50Mhz => clk_50Mhz_s,
          reset => reset_s,
          ask_for_uv => ask_for_uv_s,
          uv_data => uv_data_s,
          spi_sck => spi_sck_s,
          spi_cs => spi_cs_s,
          spi_data => spi_data_s
       );
	
    reset_gen: process
        begin
        end process;

    clk_gen: process
        begin
        end process;

end simulation;