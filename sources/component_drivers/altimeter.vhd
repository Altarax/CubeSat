library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity altimeter is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_pressure    : in std_logic;
        received_data       : out std_logic_vector(15 downto 0);
        
        -- I2C interface
        i2c_scl             : in std_logic;
        i2c_sda             : in std_logic;
        i2c_sck             : out std_logic
    );
end entity;

architecture rtl of altimeter is

    constant SLAVE_ADDR_c   : std_logic_vector(7 downto 0) := "";
    constant REG_ADDR_c     : std_logic_vector(7 downto 0) := "";

    type state_type is (init_t, start_t, send_slave_addr_t, write_t, send_reg_addr_t, stop_t, get_data_t);
    signal present_state, futur_state            : state_type := init_t;
    
begin

    reg_fsm: process (clk_50Mhz, reset)
    begin
        if reset = '1' then
            present_state <= init_t;
        elsif rising_edge(clk_50Mhz) then
            present_state <= futur_state;
        end if;
    end process;

    fsm: process (present_state)
    begin
        case present_state is
            when init_t =>
                futur_state <= start_t;
            when start_t =>
                futur_state <= send_slave_addr_t;
            when send_slave_addr_t =>
                futur_state <= write_t;
            when write_t =>
                futur_state <= send_reg_addr_t;
            when send_reg_addr_t =>
                futur_state <= stop_t;
            when stop_t =>
                futur_state <= get_data_t;
            when get_data_t =>
                futur_state <= init_t;
            when others =>
                futur_state <= init_t;
        end case;
    end process;

    -- First config :
    -- 1. Send start bit
    -- 2. Send slave addresse
    -- 3. Wait ack
    -- 3. Send write (RW = 0)
    -- 3. Send osrs_p[2:0] = 111, addr = 0xFA
    -- 4. Wait ack
    -- 5. Send Stop bit

    -- Get data when we want
    -- 1. If receptor = ask_for_pressure
    -- 2. Send start bit
    -- 3. Send slave addresse
    -- 4. Send write (RW = 0)
    -- 3. Wait ack
    -- 3. Send addresse where to start reading (0xF7 to 0xF9, auto increment)
    -- 5. Wait ack
    -- 5. Send start bit
    -- 6. Send slave addresse
    -- 7. Wait ack
    -- 4. Get data :
        -- 0xF7 : MSB of pressure (8 first bits to arrive)
        -- 0xF8 : LSB of pressure (8 next bits to arrive)
        -- 0xF9 : XLSB of pressure (4 last bits to arrive, bit 7,6,5,4 of addr)
    -- 5. Send stop bit

end architecture;
