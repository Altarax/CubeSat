 library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity accelerometer is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_position    : in std_logic;
        accel_data          : inout std_logic_vector(15 downto 0);
        
        -- I2C interface
        i2c_ena      : out std_logic;
        i2c_busy     : in std_logic;
        i2c_rw       : out std_logic;
        i2c_data_wr  : out std_logic_vector(7 downto 0);
        i2c_data_rd  : in std_logic_vector(7 downto 0);
        i2c_addr     : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of accelerometer is

    -- TODO : this could be in a package
    constant I2C_WRITE_c   : std_logic := '0';
    constant I2C_READ_c    : std_logic := '1';

    -- Constants
    constant SLAVE_ADDR_c           : std_logic_vector(6 downto 0) := "0110100";
    constant PWR_MGMT_ADDR_c        : std_logic_vector(7 downto 0) := X"6B";
    constant PWR_MGMT_DATA_c        : std_logic_vector(7 downto 0) := X"08";
    constant ACCEL_CONFIG_ADDR_c    : std_logic_vector(7 downto 0) := X"1C";
    constant ACCEL_CONFIG_DATA_c    : std_logic_vector(7 downto 0) := X"00";

    -- States
    type state_type is (init, send_config_t, get_result_t);
    signal current_state : state_type := init;

    -- I2C Signals
    signal busy_prev    : std_logic := '0';

    signal accel_data_s : std_logic_vector(15 downto 0) := (others => '0');
    signal get_data_done : std_logic := '0';

begin
    
    mpu_6050_gen: process(clk_50Mhz, reset, get_data_done, ask_for_position, busy_prev, i2c_busy)
        variable busy_count : integer := 0;
    begin

        if reset = '0' then
            busy_count := 0; 
            i2c_ena <= '0';
            current_state <= init;
    
        elsif rising_edge(clk_50Mhz) then

			case current_state is 

                when init =>
                    get_data_done <= '0';
                    if ask_for_position = '1' then
                        current_state <= send_config_t;
                    else 
                        current_state <= init;
                    end if;

                when send_config_t =>
                    busy_prev <= i2c_busy;
                    if (busy_prev = '0' and i2c_busy = '1') then
                        busy_count := busy_count + 1;
                    end if;

                    case busy_count is
                        when 0 =>
                            i2c_ena <= '1';
                            i2c_addr <= SLAVE_ADDR_c;
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= PWR_MGMT_ADDR_c;
                        when 1 =>
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= PWR_MGMT_DATA_c;
                        when 2 =>
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= ACCEL_CONFIG_ADDR_c;
                        when 3 =>
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= ACCEL_CONFIG_DATA_c;
                        when 4 =>
                            i2c_ena <= '0';
                            if (i2c_busy = '0') then
                                busy_count := 0;
                                current_state <= get_result_t;
                            end if;

                        when others => NULL;
                    end case;

                when get_result_t =>
                    busy_prev <= i2c_busy;
                    if (busy_prev = '0' and i2c_busy = '1') then
                        busy_count := busy_count + 1;
                    end if;

                    case busy_count is
                        when 0 => 
                            i2c_ena <= '1';
                            i2c_addr <= SLAVE_ADDR_c;
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= X"3B";
                        when 1 =>
                            i2c_rw <= I2C_READ_c;
                        when 2 =>
                            i2c_rw <= I2C_WRITE_c;
                            i2c_data_wr <= X"3C";
                            if (i2c_busy = '0') then
                                accel_data_s(15 downto 8) <= i2c_data_rd;
                            end if;
                        when 3 =>
                            i2c_rw <= I2C_READ_c;
                        when 4 =>
                            i2c_ena <= '0';
                            if (i2c_busy = '0') then
                                accel_data_s(7 downto 0) <= i2c_data_rd;  
                                busy_count := 0;
                                get_data_done <= '1';
                                current_state <= init; 
                            end if;

                        when others => NULL;
                    end case;

                when others => NULL;
            end case;

        end if;

    end process;

    accel_data <= accel_data_s when get_data_done = '1' else accel_data;

end architecture;
