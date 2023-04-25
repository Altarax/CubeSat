library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity altimeter is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_pressure    : in std_logic;
        altitude_data       : out std_logic_vector(15 downto 0);
        
        -- SPI interface
        clk             : in      std_logic;
        reset_n         : in      std_logic;
        miso            : in      std_logic;
        sclk            : buffer  std_logic;
        cs              : buffer  std_logic_vector(0 downto 0);
        mosi            : out     std_logic
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
    signal current_state    : state_type := init;

    -- SPI Signals
    signal busy_prev        : std_logic := '0';

    signal get_pressure     : std_logic := '0';
    signal get_data_done    : std_logic := '0';
    
begin


end architecture;
