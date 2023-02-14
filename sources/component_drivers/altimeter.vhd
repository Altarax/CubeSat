library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity altimeter is
    port (
        clk_50Mhz : in std_logic;
        reset : in std_logic;

        -- I2C interface
        i2c_scl : in std_logic;
        i2c_sda : in std_logic;
        i2c_sck : out std_logic
    );
end entity;

architecture rtl of altimeter is
begin

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
