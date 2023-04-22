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

    scl_gen: process (clk_50Mhz, reset)
    begin
        if reset = '1' then
            i2c_scl <= '0';
        elsif rising_edge(clk_50Mhz) then
            if current_state = start_t or current_state = stop_t or current_state = init_t then
                i2c_scl <= '1';
            else
                i2c_scl <= not(i2c_scl);
            end if;
        end if;
    end process;

    reg_fsm: process (clk_50Mhz, reset)
    begin
        if reset = '1' then
            current_state <= init_t;
        elsif rising_edge(clk_50Mhz) then
            current_state <= futur_state;
        end if;
    end process;

    fsm: process (current_state)
    begin
        case current_state is
            
            when init_t =>
                if ask_for_pressure = '1' then
                    futur_state <= start_t;
                end if;
                get_pressure <= '0';
                
            when start_t =>
                futur_state <= send_slave_addr_t;
                
            when send_slave_addr_t =>
                if count_slave_addr = 7 and config_sent = '0' then
                    futur_state <= write_t;
                elsif count_slave_addr = 7 and config_sent = '1' then
                    futur_state <= read_t;
                end if;
                
            when write_t =>
                futur_state <= wack_write_t;
                
            when wack_write_t =>
                if config_sent = '0' then
                    futur_state <= send_reg_addr_t;
                else 
                    futur_state <= send_reg_data_t;
                end if;
                
            when read_t =>
                futur_state <= wack_read_t;
                
            when wack_read_t =>
                futur_state <= get_data_t;
                
            when send_reg_data_t =>
                if count_reg_data = 7 then
                    futur_state <= stop_t;
                end if;
                
            when send_reg_addr_t =>
                futur_state <= send_data_t;
                
            when send_data_t =>
                if count_data = 7 then
                    futur_state <= stop_t;
                end if;
                
            when get_data_t =>
                if count_get_data = 19 then
                    get_pressure <= '1';
                    futur_state <= stop_t;
                end if;
                
            when stop_t =>
                futur_state <= init_t;
                
            when others =>
                futur_state <= init_t;
        end case;
        
    end process;
    
    output_fsm: process (current_state)
    begin
        case current_state is
            when init_t =>
                i2c_sda <= '0';
            when start_t =>
                i2c_sda <= '1';
            when send_slave_addr_t =>
                i2c_sda <= SLAVE_ADDR_c(count_slave_addr);
            when write_t =>
                i2c_sda <= '0';
            when read_t =>
                i2c_sda <= '1';
            when send_reg_addr_t =>
                i2c_sda <= REG_ADDR_c(count_reg_addr);
            when send_reg_data_t =>
                i2c_sda <= REG_DATA_ADDR_c(count_reg_data);
            when send_data_t =>
                i2c_sda <= DATA_CONFIG(count_data);
                config_sent <= '1';
            when stop_t =>
                i2c_sda <= '1';
            when get_data_t =>
                received_data_s(count_get_data) <= i2c_sda;
            when others =>
                i2c_sda <= '1';
        end case;
    end process;

    count_gen: process (clk_50Mhz, reset)
    begin
        if reset = '1' then
            count_slave_addr <= 0;
        elsif rising_edge(clk_50Mhz) then
            if current_state = send_slave_addr_t then
                if count_slave_addr = 7 then
                    count_slave_addr <= 0;
                else
                    count_slave_addr <= count_slave_addr + 1;
                end if;
            elsif current_state = send_reg_addr_t then
                if count_data = 7 then
                    count_data <= 0;
                else
                    count_data <= count_data + 1;
                end if;
            elsif current_state = send_reg_data_t then
                if count_reg_data = 7 then
                    count_reg_data <= 0;
                else
                    count_reg_data <= count_reg_data + 1;
                end if;
            elsif current_state = get_data_t then
                if count_get_data = 19 then
                    count_get_data <= 0;
                else
                    count_get_data <= count_get_data + 1;
                end if;
            end if;
        end if;
    end process;

    pressure_data <= received_data_s(19 downto 0) when get_pressure = '1' else (others => '0');

    -- 4. Get data :
        -- 0xF7 : MSB of pressure (8 first bits to arrive)
        -- 0xF8 : LSB of pressure (8 next bits to arrive)
        -- 0xF9 : XLSB of pressure (4 last bits to arrive, bit 7,6,5,4 of addr)

end architecture;
