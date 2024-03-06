library ieee;
  	use ieee.std_logic_1164.all;
  	use ieee.numeric_std.all;

library work;
	use work.custom_types.all;

entity temp_hum_sensor_ex is
    port (
		clk_50Mhz       : in std_logic;
        reset           : in std_logic;
		
		ask_for_ext_temp: in std_logic;
		ow_in_out 		: inout std_logic;

		ext_temp_value	: inout t_TEMP
    );
end entity;

architecture rtl of temp_hum_sensor_ex is

    type state_type is (INIT, PULL_LOW, PULL_HIGH, SENSOR_PULLING_LOW, SENSOR_PULLING_HIGH, 
						RECEIVE_TRANSMISSION, INSERT_VALUE, WAIT_FOR_BIT, WAIT_END_BIT, DONE);
    signal current_state, next_state : state_type;
    signal count : integer := 0;

	constant count_1_ms 	: natural := 5000;
	constant count_40_us	: natural := 2000;
	constant count_80_us	: natural := 4000;
	constant count_28_us	: natural := 1400;
	constant count_50_us	: natural := 2500;

	signal s_index_value	: natural range 0 to 39;
	signal s_ex_temp_value 	: t_TEMP := c_TEMP_INIT;
	signal get_data_done	: std_logic := '0';

begin
    process(clk_50Mhz, reset)
    begin
        if rising_edge(clk_50Mhz) then
		    if reset = '1' then
            	current_state <= INIT;
            else
            	current_state <= next_state;
			end if;
		end if;
    end process;

    process(current_state, ask_for_ext_temp, count)
    begin
        case current_state is
            when INIT =>
                if ask_for_ext_temp = '1' then
                    next_state <= PULL_LOW;
                    count <= 0;
                else
                    next_state <= INIT;
                end if;

            when PULL_LOW =>
                if count < count_1_ms then
                    count <= count + 1;
                    ow_in_out <= '0';
                else
					count <= 0;
                    next_state <= PULL_HIGH;
                end if;

            when PULL_HIGH =>
                if count < count_40_us then
                    count <= count + 1;
                else
					count <= 0;
                    next_state <= SENSOR_PULLING_LOW;
                end if;

            when SENSOR_PULLING_LOW =>
                if count < count_80_us then
                    count <= count + 1;
                else
					count <= 0;
                    next_state <= SENSOR_PULLING_HIGH;
                end if;

            when SENSOR_PULLING_HIGH =>
                if count < count_80_us then
                    count <= count + 1;
                else
					count <= 0;
                    next_state <= WAIT_FOR_BIT;
                end if;

            when WAIT_FOR_BIT =>
                if count < count_50_us then
                    count <= count + 1;
                else
					count <= 0;
                    next_state <= INSERT_VALUE;
                end if;

            when WAIT_END_BIT =>
                if count < count_28_us-1 then
                    count <= count + 1;
                else
					count <= 0;
                    next_state <= INSERT_VALUE;
                end if;

            when INSERT_VALUE =>
				if s_index_value >= 39 then
					next_state <= DONE;
				elsif s_index_value < 16 then
					s_ex_temp_value.rh_data <= s_ex_temp_value.rh_data(14 downto 0) & ow_in_out;
				elsif s_index_value >= 16 and  s_index_value < 32 then
					s_ex_temp_value.t_data <= s_ex_temp_value.t_data(14 downto 0) & ow_in_out;
				elsif s_index_value >= 32 and s_index_value < 40 then
					s_ex_temp_value.checksum <= s_ex_temp_value.checksum(6 downto 0) & ow_in_out;
				end if;

				s_index_value <= s_index_value + 1;
				next_state <= WAIT_END_BIT;

			when DONE =>
				s_index_value <= 0;
                current_state <= INIT;
                    
            when others => 
                current_state <= INIT;
                    
				
        end case;
	end process;

	ow_in_out <= 	'0' when (current_state = PULL_LOW) else
					'1' when (current_state = PULL_HIGH) else
					'Z';

	get_data_done <= '1' when current_state = DONE else '0';
	ext_temp_value <= s_ex_temp_value when get_data_done <= '1' else ext_temp_value;

end architecture;
