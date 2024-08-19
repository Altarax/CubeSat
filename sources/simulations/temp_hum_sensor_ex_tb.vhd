----------------------------------------------------------------------------------
--!
--! \file temp_hum_sensor_ex_tb.vhd
--!
--! \brief Testbench for temp_hum_sensor_ex_tb.
--!
--! \version 1.0
--! \date 
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use simulation librairies
library ieee;
    use ieee.std_logic_1164.all;

library work;
    use work.custom_types.all;

entity tb_temp_hum_sensor_ex is
end tb_temp_hum_sensor_ex;

architecture tb of tb_temp_hum_sensor_ex is

    component temp_hum_sensor_ex
        port (clk_50Mhz        : in std_logic;
              reset            : in std_logic;
              ask_for_ext_temp : in std_logic;
              ow_in_out        : inout std_logic;
              ext_temp_value   : inout t_TEMP);
    end component;

    signal clk_50Mhz_s        : std_logic;
    signal reset_s            : std_logic;
    signal ask_for_ext_temp_s : std_logic;
    signal ow_in_out_s        : std_logic;
    signal ext_temp_value_s   : t_TEMP;
    
    constant c_TEMP_FINAL : t_TEMP := (rh_data => (others => '1'), t_data => (others => '1'), checksum => (others => '1'));

begin

    dut : temp_hum_sensor_ex
    port map (clk_50Mhz        => clk_50Mhz_s,
              reset            => reset_s,
              ask_for_ext_temp => ask_for_ext_temp_s,
              ow_in_out        => ow_in_out_s,
              ext_temp_value   => ext_temp_value_s);

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
        ask_for_ext_temp_s <= '0';

        -- Start
        ask_for_ext_temp_s <= '1'; wait for 90 ns;
        ask_for_ext_temp_s <= '0';
        ow_in_out_s <= '1';

        -- End
        assert (ext_temp_value_s = c_TEMP_FINAL) report "Value should be FFFF" severity ERROR;

        wait;

    end process;

end tb;
