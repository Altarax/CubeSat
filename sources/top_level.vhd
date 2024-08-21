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
      
      -- Distance sensor interface
      echo                : in std_logic;
      trigger             : out std_logic

    );
end entity;

architecture rtl of top_level is

    -- Accelerometer
    signal ask_for_position   : std_logic := '0';
    signal accel_data         : std_logic_vector(15 downto 0) := (others => '0');

    -- Altimeter sensor
    signal ask_for_pressure   : std_logic := '0';
    signal altitude           : std_logic_vector(19 downto 0) := (others => '0');

    -- Distance sensor
    signal ask_for_distance   : std_logic := '0';
    signal distance           : std_logic_vector(15 downto 0) := (others => '0');

    -- UV Sensor
    signal ask_for_uv         : std_logic := '0';
    signal uv_data            : std_logic_vector(7 downto 0) := (others => '0');
    
begin
  
end architecture;
