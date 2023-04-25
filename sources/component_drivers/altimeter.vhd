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
        i2c_ena      : out std_logic := '0';
        i2c_busy     : in std_logic;
        i2c_rw       : out std_logic;
        i2c_data_wr  : out std_logic_vector(7 downto 0);
        i2c_data_rd  : in std_logic_vector(7 downto 0);
        i2c_addr     : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of altimeter is

    -- Constants
    constant SLAVE_ADDR_c   : std_logic_vector(7 downto 0) := X"00"; -- TBD
    constant DATA_CONFIG    : std_logic_vector(7 downto 0) := X"00";
    constant REG_ADDR_c     : std_logic_vector(7 downto 0) := X"FA";
    constant REG_DATA_ADDR_c: std_logic_vector(7 downto 0) := X"F7";

    -- States
    type state_type is (init, send_config_t, get_result_t);
    signal current_state : state_type := init;

    -- I2C Signals
    signal busy_prev    : std_logic := '0';

    signal get_pressure                                                 : std_logic := '0';
    signal get_data_done : std_logic := '0';
    
begin


end architecture;
