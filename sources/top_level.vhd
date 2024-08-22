library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
library work;
  use work.custom_types.all;

entity top_level is
    port (

      clk_50Mhz : in std_logic;
      reset     : in std_logic;

      -- I2C interface
      i2c_scl             : inout std_logic;
      i2c_sda             : inout std_logic;

      -- SPI interface
      miso                : in std_logic;
      sclk                : buffer std_logic;
      ss_n                : buffer std_logic_vector(0 downto 0);
      mosi                : out std_logic;

      -- UV SPI Interface
      uv_spi_sck          : out std_logic;
      uv_spi_cs           : out std_logic;
      uv_spi_data         : in std_logic;
      
      -- Distance sensor interface
      echo                : in std_logic;
      trigger             : out std_logic

    );
end entity;

architecture rtl of top_level is

    -- Accelerometer
    signal r_ask_for_position     : std_logic;
    signal r_accel_data           : std_logic_vector(15 downto 0);
    signal r_accel_i2c_ena        : std_logic;
    signal r_accel_i2c_busy       : std_logic;
    signal r_accel_i2c_rw         : std_logic;
    signal r_accel_i2c_data_wr    : std_logic_vector(7 downto 0);
    signal r_accel_i2c_data_rd    : std_logic_vector(7 downto 0);
    signal r_accel_i2c_addr       : std_logic_vector(6 downto 0);
    signal r_accel_get_data_done  : std_logic;
        
    -- Altimeter sensor
    signal r_ask_for_pressure   : std_logic;
    signal r_altitude           : std_logic_vector(19 downto 0);
    signal r_alti_spi_cont      : std_logic;    
    signal r_alti_spi_rx_data   : std_logic_vector(7 downto 0);
    signal r_alti_spi_ena       : std_logic;
    signal r_alti_spi_busy      : std_logic;
    signal r_alti_spi_tx_data   : std_logic_vector(7 downto 0);
    signal r_alti_get_data_done : std_logic;

    -- Distance sensor
    signal r_ask_for_distance   : std_logic;
    signal r_distance           : std_logic_vector(15 downto 0);

    -- UV Sensor
    signal r_ask_for_uv         : std_logic;
    signal r_uv_data            : std_logic_vector(7 downto 0);
    
begin

  r_ask_for_distance <= '1';
  r_ask_for_uv <= '1';

  sequencer_inst: entity work.sequencer
    port map (
      clk_50Mhz          => clk_50Mhz,
      reset              => reset,
      i2c_scl            => i2c_scl,
      i2c_sda            => i2c_sda,
      miso               => miso,
      sclk               => sclk,
      ss_n               => ss_n,
      mosi               => mosi,
      accelerometer_done => r_accel_get_data_done,
      altimeter_done     => r_alti_get_data_done,
      accel_i2c_ena      => r_accel_i2c_ena,
      accel_i2c_busy     => r_accel_i2c_busy,
      accel_i2c_rw       => r_accel_i2c_rw,
      accel_i2c_data_wr  => r_accel_i2c_data_wr,
      accel_i2c_data_rd  => r_accel_i2c_data_rd,
      accel_i2c_addr     => r_accel_i2c_addr,
      ask_for_pressure   => r_ask_for_pressure,
      alti_spi_cont      => r_alti_spi_cont,
      alti_spi_rx_data   => r_alti_spi_rx_data,
      alti_spi_ena       => r_alti_spi_ena,
      alti_spi_busy      => r_alti_spi_busy,
      alti_spi_tx_data   => r_alti_spi_tx_data,
      ask_for_position   => r_ask_for_position
    );

  accelerometer_inst: entity work.accelerometer
  port map (
    clk_50Mhz        => clk_50Mhz,
    reset            => reset,
    ask_for_position => r_ask_for_position,
    accel_data       => r_accel_data,
    get_data_done    => r_accel_get_data_done,
    i2c_ena          => r_accel_i2c_ena,
    i2c_busy         => r_accel_i2c_busy,
    i2c_rw           => r_accel_i2c_rw,
    i2c_data_wr      => r_accel_i2c_data_wr,
    i2c_data_rd      => r_accel_i2c_data_rd,
    i2c_addr         => r_accel_i2c_addr
  );

  altimeter_inst: entity work.altimeter
  port map (
    clk_50Mhz        => clk_50Mhz,
    reset            => reset,
    ask_for_pressure => r_ask_for_pressure,
    altitude         => r_altitude,
    get_data_done    => r_alti_get_data_done,
    spi_cont         => r_alti_spi_cont,
    spi_rx_data      => r_alti_spi_rx_data,
    spi_ena          => r_alti_spi_ena,
    spi_busy         => r_alti_spi_busy,
    spi_tx_data      => r_alti_spi_tx_data
  );

  distance_sensor_inst: entity work.distance_sensor
  port map (
    clk_in           => clk_50Mhz,
    reset            => reset,
    ask_for_distance => r_ask_for_distance,
    distance         => r_distance,
    get_data_done    => open,
    echo             => echo,
    trigger          => trigger
  );

  uv_sensor_inst: entity work.uv_sensor
  port map (
    clk_50Mhz     => clk_50Mhz,
    reset         => reset,
    ask_for_uv    => r_ask_for_uv,
    uv_data       => r_uv_data,
    get_data_done => open,
    spi_sck       => uv_spi_sck,
    spi_cs        => uv_spi_cs,
    spi_data      => uv_spi_data
  );
  
end architecture;
