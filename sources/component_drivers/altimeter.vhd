library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

entity altimeter is
    port (
        clk_50Mhz           : in std_logic;
        reset               : in std_logic;
        
        ask_for_pressure    : in std_logic;
        altitude            : inout real;
        
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
    signal current_state    : state_type := init;

    -- SPI Signals
    SIGNAL spi_busy_prev      : std_logic;

    -- Signals
    signal get_pressure     : std_logic := '0';
    signal get_data_done    : std_logic := '0';

    type compensate_t is array(0 to 8) of std_logic_vector(15 downto 0);
    signal compensate_data  : compensate_t := (others => (others => '0'));
    signal raw_data         : std_logic_vector(19 downto 0) := (others => '0');
    
begin

    fsm: process(clk_50Mhz, reset)
        variable busy_count : integer := 0;
        variable temp : std_logic_vector(7 downto 0);
    begin
        if reset = '1' then
            current_state <= init;
        elsif rising_edge(clk_50Mhz) then
            case current_state is
                when init =>
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

                -- when get_compensate_data_t =>
                --     spi_busy_prev <= spi_busy;
                --     if (spi_busy_prev = '1' and spi_busy = '0') then
                --         busy_count := busy_count + 1;
                --     end if;

                --     case busy_count is
                --         when 0 =>
                --             spi_ena <= '1';
                --             spi_cont <= '1';
                --             spi_tx_data <= REG_DATA_ADDR_c;
                --         when 1 =>
                --             compensate_data(0)(15 downto 8) <= spi_rx_data;
                --         when 2 =>
                --             compensate_data(0)(7 downto 0) <= spi_rx_data;
                --         when 3 =>
                --             compensate_data(1)(15 downto 8) <= spi_rx_data;
                --         when 4 =>
                --             compensate_data(1)(7 downto 0) <= spi_rx_data;
                --         when 5 =>
                --             compensate_data(2)(15 downto 8) <= spi_rx_data;
                --         when 6 =>
                --             compensate_data(2)(7 downto 0) <= spi_rx_data;
                --         when 7 =>
                --             compensate_data(3)(15 downto 8) <= spi_rx_data;
                --         when 8 =>
                --             compensate_data(3)(7 downto 0) <= spi_rx_data;
                --         when 9 =>
                --             compensate_data(4)(15 downto 8) <= spi_rx_data;
                --         when 10 =>
                --             compensate_data(4)(7 downto 0) <= spi_rx_data;
                --         when 11 =>
                --             compensate_data(5)(15 downto 8) <= spi_rx_data;
                --         when 12 =>
                --             compensate_data(5)(7 downto 0) <= spi_rx_data;
                --         when 13 =>
                --             compensate_data(6)(15 downto 8) <= spi_rx_data;
                --         when 14 =>
                --             compensate_data(6)(7 downto 0) <= spi_rx_data;
                --         when 15 =>
                --             compensate_data(7)(15 downto 8) <= spi_rx_data;
                --         when 16 =>
                --             compensate_data(7)(7 downto 0) <= spi_rx_data;
                --         when 17 =>
                --             compensate_data(8)(15 downto 8) <= spi_rx_data;
                --         when 18 =>
                --             compensate_data(8)(7 downto 0) <= spi_rx_data;
                --         when 19 =>
                --             busy_count := 0;
                --             spi_cont <= '0';
                --             spi_ena <= '0';
                --             current_state <= get_raw_data_t;
                --         when others => null;
                --     end case;

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
                            raw_data(19 downto 12) <= spi_rx_data;
                        when 2 =>
                            raw_data(11 downto 4) <= spi_rx_data;
                        when 7 =>
                            temp := spi_rx_data;
                        when 8 =>
                            raw_data(3 downto 0) <= temp(7 downto 5);
                            busy_count := 0;
                            spi_cont <= '0';
                            spi_ena <= '0';
                            current_state <= get_result_t;
                        when others => null;
                    end case;

                when get_result_t =>
                    get_data_done <= '1';
                    current_state <= init;
                    
                when others => 
                    current_state <= init;
                    
                end case;
            end if;
                    
    end process;

    altitude   <= 44330.0 * (1.0 - real'pow(to_integer(unsigned(raw_data)/101325, 0.1903)))
                    when get_data_done = '1' else altitude;

end architecture;
