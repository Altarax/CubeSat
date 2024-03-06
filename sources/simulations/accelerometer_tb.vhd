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
	       port map (
          clk_50Mhz => clk_50Mhz_s,
          reset => reset_s,
          ask_for_position => ask_for_position_s,
          accel_data => accel_data_s,
          i2c_ena => i2c_ena_s,
          i2c_busy => i2c_busy_s,
          i2c_rw => i2c_rw_s,
          i2c_data_wr => i2c_data_wr_s,
          i2c_data_rd => i2c_data_rd_s,
          i2c_addr => i2c_addr_s
       );
	
    reset_gen: process
    begin
        reset_s <= '1'; wait for 50 ns;
        reset_s <= '0'; wait; 
    end process;

    clk_gen: process
    begin
        clk_50Mhz_s <= '1'; wait for 20 ns;
        clk_50Mhz_s <= '0'; wait for 20 ns;
    end process;

    stimuli: process
    begin
        -- Init
        ask_for_position_s <= '0';
        i2c_data_rd_s <= "01010101";

        -- Start
        ask_for_position_s <= '1'; wait for 90 ns;
        ask_for_position_s <= '0';

        for i in 0 to 4 loop
            i2c_busy_s <= '1'; wait for 40 ns;
            i2c_busy_s <= '0'; wait for 40 ns;
        end loop;

        wait for 80 ns;

        for i in 0 to 4 loop
            i2c_busy_s <= '1'; wait for 40 ns;
            i2c_busy_s <= '0'; wait for 40 ns;
        end loop;

        -- End
        assert (accel_data_s = "0101010101010101") 
            report "Incorrect value, uv_data shoudld be 5555, value is " & integer'image(unsigned(accel_data_s))
            severity ERROR;

        wait;

    end process;

end simulation;