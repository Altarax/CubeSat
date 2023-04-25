library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity top_level is
    port (
        clk_in : in std_logic;
        reset  : in std_logic;

         -- I2C interface
        i2c_scl             : inout std_logic;
        i2c_sda             : inout std_logic
    );
end entity;

architecture rtl of top_level is

        -- I2C interface
    signal i2c_ena      : std_logic := '0';
    signal i2c_busy     : std_logic := '0';
    signal busy_prev    : std_logic := '0';
    signal i2c_rw       : std_logic := '0';
    signal i2c_data_wr  : std_logic_vector(7 downto 0) := (others => '0');
    signal i2c_data_rd  : std_logic_vector(7 downto 0) := (others => '0');
    signal i2c_addr     : std_logic_vector(6 downto 0) := (others => '0');

    signal ask_for_position_s : std_logic := '0';
    signal accel_data_s       : std_logic_vector(15 downto 0) := (others => '0');
    
begin

  i2c_master_inst: entity work.i2c_master
    port map (
      clk       => clk_in,
      reset_n   => reset,
      ena       => i2c_ena,
      addr      => i2c_addr,
      rw        => i2c_rw,
      data_wr   => i2c_data_wr,
      busy      => i2c_busy,
      data_rd   => i2c_data_rd,
      ack_error => open,
      sda       => i2c_sda,
      scl       => i2c_scl
    );

  accelerometer_inst: entity work.accelerometer
      port map (
          clk_50Mhz        => clk_in,
          reset            => reset,
          ask_for_position => ask_for_position_s,
          accel_data       => accel_data_s,
          i2c_ena          => i2c_ena,
          i2c_busy         => i2c_busy,
          i2c_rw           => i2c_rw,
          i2c_data_wr      => i2c_data_wr,
          i2c_data_rd      => i2c_data_rd,
          i2c_addr         => i2c_addr
      );
  
end architecture;
