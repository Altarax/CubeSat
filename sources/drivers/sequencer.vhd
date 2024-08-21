library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity uv_sensor is
    port (
        clk_50Mhz     : in std_logic;
        reset         : in std_logic;

        -- Retreive data done
        accelerometer_done  : in std_logic;
        altimeter_done      : in std_logic;
        distance_sensor     : in std_logic;
        uv_sensor_done      : in std_logic;

        -- Altimeter Interface
        -- UV Interface
        -- Distance Interface
        
    );
end entity;

architecture rtl of uv_sensor is

    type state_t is (init, waiting_t, read_t, stop_t);
    signal current_state    : state_t := init;

begin

end architecture;
