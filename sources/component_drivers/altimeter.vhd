library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity altimeter is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_pressure    : in std_logic;
        pressure_data       : out std_logic_vector(19 downto 0);
        
        -- I2C interface
        i2c_scl             : inout std_logic;
        i2c_sda             : inout std_logic
    );
end entity;

architecture rtl of altimeter is

    constant SLAVE_ADDR_c   : std_logic_vector(7 downto 0) := X"00"; -- TBD
    constant DATA_CONFIG    : std_logic_vector(7 downto 0) := X"00";
    constant REG_ADDR_c     : std_logic_vector(7 downto 0) := X"FA";
    constant REG_DATA_ADDR_c: std_logic_vector(7 downto 0) := X"F7";

    type state_type is (init_t, start_t, send_reg_data_t, send_slave_addr_t, write_t, wack_write_t, read_t, wack_read_t, send_data_t, send_reg_addr_t, stop_t, get_data_t);
    signal current_state, futur_state            : state_type := init_t;

    signal count_slave_addr, count_reg_addr, count_data,count_reg_data  : integer range 0 to 7 := 0;
    signal config_sent                                                  : std_logic := '0';

    signal count_get_data                                               : integer range 0 to 19 := 0;
    signal received_data_s : std_logic_vector(19 downto 0) := (others => '0');

    signal get_pressure                                                 : std_logic := '0';
    
begin
end architecture;