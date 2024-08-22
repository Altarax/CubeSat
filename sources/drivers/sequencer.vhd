library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sequencer is
    port (
        clk_50Mhz     : in std_logic;
        reset         : in std_logic;

        -- I2C interface
        i2c_scl             : inout std_logic;
        i2c_sda             : inout std_logic;

        -- SPI interface
        miso                : in std_logic;
        sclk                : buffer std_logic;
        ss_n                : buffer std_logic_vector(0 downto 0);
        mosi                : out std_logic;

        -- Retreive data done
        accelerometer_done  : in std_logic;
        altimeter_done      : in std_logic;

        -- Accelerometer Interface
        accel_i2c_ena       : in std_logic;
        accel_i2c_busy      : out std_logic;
        accel_i2c_rw        : in std_logic;
        accel_i2c_data_wr   : in std_logic_vector(7 downto 0);
        accel_i2c_data_rd   : out std_logic_vector(7 downto 0);
        accel_i2c_addr      : in std_logic_vector(6 downto 0);
        ask_for_pressure    : out std_logic;

        -- Altimeter Interface
        alti_spi_cont       : in std_logic;    
        alti_spi_rx_data    : out std_logic_vector(7 downto 0);
        alti_spi_ena        : in std_logic;
        alti_spi_busy       : out std_logic;
        alti_spi_tx_data    : in std_logic_vector(7 downto 0);
        ask_for_position    : out std_logic

    );
end entity;

architecture rtl of sequencer is

    -- Constants
    constant c_SECURITY_VALUE   : integer := 10000000;

    -- I2C Signals
    signal r_i2c_ena      : std_logic;
    signal r_i2c_addr     : std_logic_vector(6 downto 0);
    signal r_i2c_rw       : std_logic;
    signal r_i2c_data_wr  : std_logic_vector(7 downto 0);
    signal r_i2c_busy     : std_logic;
    signal r_i2c_data_rd  : std_logic_vector(7 downto 0);

    -- SPI Signals
    signal r_spi_ena      : std_logic;
    signal r_spi_cont     : std_logic;
    signal r_spi_rx_data  : std_logic_vector(7 downto 0);
    signal r_spi_tx_data  : std_logic_vector(7 downto 0);
    signal r_spi_busy     : std_logic;

    -- FSMs Signals and Types
    type i2c_state_t is (accel_t, stop_t);
    signal i2c_current_state : i2c_state_t := accel_t;

    type spi_state_t is (alti_t, stop_t);
    signal spi_current_state : spi_state_t := alti_t;

    -- Other signals
    signal security_counter : integer := 0;

begin

    -- I2C Commands
    i2c_master_inst: entity work.i2c_master
        port map (
            clk       => clk_50Mhz,
            reset_n   => reset,
            ena       => r_i2c_ena,
            addr      => r_i2c_addr,
            rw        => r_i2c_rw,
            data_wr   => r_i2c_data_wr,
            busy      => r_i2c_busy,
            data_rd   => r_i2c_data_rd,
            ack_error => open,
            sda       => i2c_sda,
            scl       => i2c_scl
        );

    i2c_fsm_outputs: process(clk_50Mhz, i2c_current_state)
    begin
        
        if rising_edge(clk_50Mhz) then

            case i2c_current_state is
                when accel_t =>
                    ask_for_position    <= '1';
                    r_i2c_ena           <= accel_i2c_ena;
                    accel_i2c_busy      <= r_i2c_busy;
                    r_i2c_rw            <= accel_i2c_rw;
                    r_i2c_data_wr       <= accel_i2c_data_wr;
                    accel_i2c_data_rd   <= r_i2c_data_rd;
                    r_i2c_addr          <= accel_i2c_addr;

                 when others =>
                    null;

            end case;
        end if;
    end process;

    i2c_fsm: process(clk_50Mhz,i2c_current_state)
    begin

        if rising_edge(clk_50Mhz) then
        
            case i2c_current_state is
                when accel_t =>
                    if accelerometer_done = '1' then
                        i2c_current_state <= accel_t; -- New component using SPI here
                    else
                        i2c_current_state <= accel_t;
                    end if;

                when others =>
                    null;

            end case;
        end if;
    end process;

    -- SPI Commands
    spi_master_inst: entity work.spi_master
        port map (
        clock   => clk_50Mhz,
        reset_n => reset,
        enable  => r_spi_ena,
        cpol    => '1',
        cpha    => '1',
        cont    => r_spi_cont,
        clk_div => 0,
        addr    => 0,
        tx_data => r_spi_tx_data,
        miso    => miso,
        sclk    => sclk,
        ss_n    => ss_n,
        mosi    => mosi,
        busy    => r_spi_busy,
        rx_data => r_spi_rx_data
        );

    spi_fsm_outputs: process(clk_50Mhz, spi_current_state)
    begin
        
        if rising_edge(clk_50Mhz) then

            case spi_current_state is
                when alti_t =>
                    ask_for_pressure    <= '1';
                    r_spi_ena           <= alti_spi_ena;
                    r_spi_cont          <= alti_spi_cont;
                    alti_spi_rx_data    <= r_spi_rx_data;
                    r_spi_tx_data       <= alti_spi_tx_data;
                    alti_spi_busy       <= r_spi_busy; 

                when others =>
                    null;

            end case;
        end if;
    end process;

    spi_fsm: process(clk_50Mhz, spi_current_state)
    begin

        if rising_edge(clk_50Mhz) then
        
            case spi_current_state is
                when alti_t =>
                    if altimeter_done = '1' then
                        spi_current_state <= alti_t; -- New component using SPI here
                    else
                        spi_current_state <= alti_t;
                    end if;

                when others =>
                    null;

            end case;
        end if;
    end process;

end architecture;
