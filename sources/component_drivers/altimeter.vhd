library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

entity altimeter is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_pressure    : in std_logic;
        altitude            : out std_logic_vector(19 downto 0);
        get_data_done       : out std_logic;
        
        -- SPI interface
        spi_cont            : out     std_logic;    
        spi_rx_data         : in      std_logic_vector(7 downto 0);
        spi_ena             : buffer  std_logic;
        spi_busy            : in      std_logic;
        spi_tx_data         : out     std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of altimeter is

    -- Constants
    constant SLAVE_ADDR_c   : std_logic_vector(7 downto 0) := X"00";
    constant DATA_CONFIG    : std_logic_vector(7 downto 0) := X"00";
    constant COMPENSATE_REG_DATA_c  : std_logic_vector(7 downto 0) := X"8E";
    constant REG_DATA_ADDR_c        : std_logic_vector(7 downto 0) := X"FA";
    constant STATUS_REG_ADDR_c      : std_logic_vector(7 downto 0) := X"F4";

    -- States
    type state_type is (init, wait_for_bmp_not_busy, get_compensate_data_t, get_raw_data_t, get_result_t);
    signal current_state        : state_type := init;

    -- SPI Signals
    SIGNAL spi_busy_prev        : std_logic;

    -- Signals
    signal get_pressure         : std_logic := '0';
    signal get_data_done_s      : std_logic := '0';

    -- Data types and signals
    type compensate_t is array(0 to 8) of std_logic_vector(15 downto 0);
    signal compensate_data      : compensate_t := (others => (others => '0'));
    signal raw_data_s           : std_logic_vector(19 downto 0) := (others => '0');
    
begin

    fsm: process(clk_50Mhz, reset, ask_for_pressure, spi_busy_prev, spi_busy)
        variable busy_count : integer := 0;
        variable temp : std_logic_vector(7 downto 0);
    begin

        if rising_edge(clk_50Mhz) then

            if reset = '1' then
                get_data_done_s <= '0';
                current_state <= init;
            else
                case current_state is
                    when init =>
                        get_data_done_s <= '0';
                        if ask_for_pressure = '1' then
                            current_state <= wait_for_bmp_not_busy;
                        end if;
                        
                    when wait_for_bmp_not_busy =>
                        spi_busy_prev <= spi_busy;
                        if (spi_busy_prev = '1' and spi_busy = '0') then
                            busy_count := busy_count + 1;
                        end if;

                        case busy_count is
                            when 0 =>
                                spi_ena <= '1';
                                spi_tx_data <= STATUS_REG_ADDR_c;
                            when 1 =>
                                temp := spi_rx_data;
                            when 2 =>
                                spi_ena <= '0';
                                busy_count := 0;
                            when others => null;
                        end case;

                        if temp(3) = '0' then
                            current_state <= get_raw_data_t;
                        else
                            current_state <= wait_for_bmp_not_busy;
                        end if;

                    when get_raw_data_t =>
                        spi_busy_prev <= spi_busy;
                        if (spi_busy_prev = '1' and spi_busy = '0') then
                            busy_count := busy_count + 1;
                        end if;

                        case busy_count is
                            when 0 =>
                                spi_ena <= '1';
                                spi_cont <= '1';
                                spi_tx_data <= COMPENSATE_REG_DATA_c;
                            when 1 =>
                                raw_data_s(19 downto 12) <= spi_rx_data;
                            when 2 =>
                                raw_data_s(11 downto 4) <= spi_rx_data;   
                            when 7 =>
                                temp := spi_rx_data;
                            when 8 =>
                                raw_data_s(3 downto 0 ) <= '0' & temp(7 downto 5);
                                busy_count := 0;
                                spi_cont <= '0';
                                spi_ena <= '0';
                                current_state <= get_result_t;
                            when others => null;
                        end case;

                    when get_result_t =>
                        get_data_done_s <= '1';
                        current_state <= init;
                        
                    when others => 
                        current_state <= init;
                        
                end case;
            end if;
        end if;
    end process;

    get_data_done <= get_data_done_s;
    altitude <= raw_data_s;
    
end architecture;
