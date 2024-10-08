library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity distance_sensor is
    port (
        clk_in              : in std_logic;
        reset               : in std_logic;
        
        ask_for_distance    : in std_logic;
        distance            : out std_logic_vector(15 downto 0);
        get_data_done       : out std_logic;
        
        echo                : in std_logic;
        trigger             : out std_logic
    );
end entity;

architecture rtl of distance_sensor is

    signal counter_trigger, counter_echo, counter_burst: unsigned(15 downto 0) := (others => '0');
    constant max_trigger    : integer := 500;
    constant max_burst      : integer := 157; -- 3125ns/20ns (40Khz*8burst/Period)

    signal get_data_done_s : std_logic := '0';
    
    type state_type is (init_t, trigger_t, wait_burst_t, echo_t);
    signal current_state : state_type := init_t;
    
begin

    hc_sr04_gen:process(clk_in, reset, counter_trigger, ask_for_distance, echo, counter_burst)
    begin
            
        if rising_edge(clk_in) then

            if reset = '1' then
                counter_trigger <= (others => '0');
                counter_echo <= (others => '0');
                trigger <= '0';
                get_data_done_s <= '0';
                current_state <= init_t;

            else

                case current_state is
                    when init_t =>
                        get_data_done_s <= '0';
                        counter_echo <= (others => '0');
                        if ask_for_distance = '1' then
                            current_state <= trigger_t;
                        end if;

                    when trigger_t =>
                        if counter_trigger < max_trigger then
                            counter_trigger <= counter_trigger + 1;
                            trigger <= '1';
                        else
                            trigger <= '0';
                            counter_trigger <= (others => '0');
                            current_state <= wait_burst_t;
                        end if;
                        
                    when wait_burst_t =>
                        if counter_burst < max_burst then
                            counter_burst <= counter_burst + 1;
                        else
                            counter_burst <= (others => '0');
                            current_state <= echo_t;
                        end if;

                    when echo_t =>
                        if echo = '1' then
                            counter_echo <= counter_echo + 1;
                        else
                            get_data_done_s <= '1';
                            current_state <= init_t;
                        end if;
                        
                end case;
            end if;
        end if;
    end process;

    -- ns/1000/58 after
    get_data_done <= get_data_done_s;
    distance <= std_logic_vector(counter_echo);
    
end architecture;
