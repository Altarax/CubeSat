library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity distance_sensor is
    generic (
        FREQ : integer := 50_000_000    -- Hz
    );
    port (
        clk_in              : in std_logic;
        reset               : in std_logic;
        
        ask_for_distance    : in std_logic;
        distance            : inout integer;
        
        echo                : in std_logic;
        trigger             : out std_logic
    );
end entity;

architecture rtl of distance_sensor is

    signal counter_trigger, counter_echo: integer := 0;
    signal max_trigger : integer := 500;

    signal get_data_done : std_logic := '0';
    
    type state_type is (init_t, trigger_t, echo_t);
    signal current_state : state_type := init_t;
    
begin

    hc_sr04_gen:process(clk_in, reset)
    begin
        if reset = '1' then
            counter_trigger <= 0;
            counter_echo <= 0;
            trigger <= '0';
            distance <= 0;
            get_data_done <= '0';
            current_state <= init_t;
        elsif rising_edge(clk_in) then

            case current_state is
                when init_t =>
                    get_data_done <= '0';
                    counter_echo <= 0;
                    distance <= 0;
                    if ask_for_distance = '1' then
                        current_state <= trigger_t;
                    end if;

                when trigger_t =>
                    if counter_trigger < max_trigger then
                        counter_trigger <= counter_trigger + 1;
                        counter_trigger <= 0;
                        trigger <= '1';
                    else
                        trigger <= '0';
                        current_state <= echo_t;
                    end if;
                    
                when echo_t =>
                    if echo = '1' then
                        counter_echo <= counter_echo + 1;
                    else
                        get_data_done <= '1';
                        current_state <= init_t;
                    end if;
            end case;
        end if;
    end process;

    -- TODO : Lookup table
    --distance <= lut(counter_echo) when get_data_done = '1' else distance;
    
end architecture;
