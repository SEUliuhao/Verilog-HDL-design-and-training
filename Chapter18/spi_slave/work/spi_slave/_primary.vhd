library verilog;
use verilog.vl_types.all;
entity spi_slave is
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_tx_data       : in     vl_logic_vector(7 downto 0);
        o_tx_done       : out    vl_logic;
        o_rx_data       : out    vl_logic_vector(7 downto 0);
        o_rx_done       : out    vl_logic;
        i_spi_cs        : in     vl_logic;
        i_spi_clk       : in     vl_logic;
        i_spi_mosi      : in     vl_logic;
        o_spi_miso      : out    vl_logic
    );
end spi_slave;
