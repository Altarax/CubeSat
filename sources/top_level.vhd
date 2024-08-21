library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
library work;
  use work.custom_types.all;

entity top_level is
    port (

      clk_in : in std_logic;
      reset  : in std_logic;

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
      
      -- 1-wire EXT Temp interface
      ext_ow_in_out       : inout std_logic;

      -- Distance sensor interface
      echo                : in std_logic;
      trigger             : out std_logic

    );
end entity;

architecture rtl of top_level is

    -- I2C interface
    signal i2c_ena      : std_logic := '0';
    signal i2c_busy     : std_logic := '0';
    signal i2c_rw       : std_logic := '0';
    signal i2c_data_wr  : std_logic_vector(7 downto 0) := (others => '0');
    signal i2c_data_rd  : std_logic_vector(7 downto 0) := (others => '0');
    signal i2c_addr     : std_logic_vector(6 downto 0) := (others => '0');

    -- SPI interface
    signal spi_cont     : std_logic := '0';
    signal spi_rx_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal spi_ena      : std_logic := '0';
    signal spi_busy     : std_logic := '0';
    signal spi_tx_data  : std_logic_vector(7 downto 0) := (others => '0');

    -- Accelerometer
    signal ask_for_position_s   : std_logic := '0';
    signal accel_data_s         : std_logic_vector(15 downto 0) := (others => '0');

    -- Altimeter sensor
    signal ask_for_pressure_s   : std_logic := '0';
    signal altitude_s           : std_logic_vector(19 downto 0) := (others => '0');

    -- Distance sensor
    signal ask_for_distance_s   : std_logic := '0';
    signal distance_s           : std_logic_vector(15 downto 0) := (others => '0');

    -- UV Sensor
    signal ask_for_uv_s         : std_logic := '0';
    signal uv_data_s            : std_logic_vector(7 downto 0) := (others => '0');
    
begin
  
end architecture;
