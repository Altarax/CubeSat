library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity uv_sensor is
    port (
        clk_50Mhz     : in std_logic;
        reset         : in std_logic;
        
        ask_for_uv    : in std_logic;
        uv_data       : inout std_logic_vector(8 downto 0);
        
        -- SPI interface
        spi_sck       : out std_logic;
        spi_cs        : out std_logic;
        spi_data      : in std_logic
    );
end entity;

architecture rtl of uv_sensor is

    type state_t is (init, waiting_t, read_t, stop_t);
    signal current_state : state_t := init;

    signal uv_data_s : std_logic_vector(8 downto 0) := (others => '0');
    signal get_data_done : std_logic := '0';

begin
    process(clk_50Mhz, reset)
        variable waiting_count : integer range 0 to 3 := 0;
        variable read_count : integer range 0 to 9 := 0;
    begin
        if (reset = '0') then

            spi_cs <= '1';
            get_data_done <= '0';
            uv_data_s <= (others => '0');
            current_state <= init;

        elsif rising_edge(clk_50Mhz) then

            case current_state is 

                when init =>
                    get_data_done <= '0';
                    if ask_for_uv = '1' then
                        current_state <= waiting_t;
                    end if;

                when waiting_t =>
                    spi_cs <= '0';
                    if waiting_count = 3 then
                        waiting_count := 0;
                        current_state <= read_t;
                    else
                        waiting_count := waiting_count + 1;
                    end if;

                when read_t =>
                    spi_cs <= '0';
                    if read_count = 9 then
                        read_count := 0;
                        current_state <= stop_t;
                    else
                        uv_data_s <= uv_data_s(7 downto 0) & spi_data;
                    end if;

                when stop_t =>
                    spi_cs <= '1';
                    get_data_done <= '1';
                    current_state <= init;

            end case;
        end if;

    end process;

    spi_sck <= clk_50Mhz when (current_state = read_t or current_state = waiting_t) else '0';
    uv_data <= uv_data_s when get_data_done = '1' else uv_data;

end architecture;
