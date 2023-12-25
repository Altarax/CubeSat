    library IEEE;
    use IEEE.Std_logic_1164.all;
    use IEEE.Numeric_Std.all;

    entity top_level_tb is
    end;

    architecture bench of top_level_tb is

    component top_level
        port (
            clk_in              : in std_logic;
            reset               : in std_logic;

            i2c_scl             : inout std_logic;
            i2c_sda             : inout std_logic;

            miso                : in std_logic;
            sclk                : buffer std_logic;
            ss_n                : buffer std_logic_vector(0 downto 0);
            mosi                : out std_logic;

            uv_spi_sck          : out std_logic;
            uv_spi_cs           : out std_logic;
            uv_spi_data         : in std_logic;

            echo                : inout std_logic;
            trigger             : inout std_logic
        );
    end component;

    signal clk_in     : std_logic;
    signal reset      : std_logic;

    signal i2c_scl    : std_logic;
    signal i2c_sda    : std_logic;

    signal miso       : std_logic;
    signal sclk       : std_logic;
    signal ss_n       : std_logic_vector(0 downto 0);
    signal mosi       : std_logic;

    signal uv_spi_sck : std_logic;
    signal uv_spi_cs  : std_logic;
    signal uv_spi_data: std_logic;

    signal echo       : std_logic;
    signal trigger    : std_logic;

 begin

    uut: top_level port map ( clk_in      => clk_in,
                                reset       => reset,
                                i2c_scl     => i2c_scl,
                                i2c_sda     => i2c_sda,
                                miso        => miso,
                                sclk        => sclk,
                                ss_n        => ss_n,
                                mosi        => mosi,
                                uv_spi_sck  => uv_spi_sck,
                                uv_spi_cs   => uv_spi_cs,
                                uv_spi_data => uv_spi_data,
                                echo        => echo,
                                trigger     => trigger );

    clk_gen: process
    begin
        clk_in <= '0'; wait for 100ns;
        clk_in <= '1'; wait for 100ns;
    end process;

    stimulus: process
    begin
    
        -- Put initialisation code here
        reset <= '1'; wait for 500ns;
        reset <= '0';
        
        -- Test UV Sensor
        uv_spi_data <= '0';

        wait;
    end process;


    end;