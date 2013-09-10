library verilog;
use verilog.vl_types.all;
entity spi_master is
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_spi_tx_rx     : in     vl_logic;
        i_tx_data       : in     vl_logic_vector(7 downto 0);
        o_tx_done       : out    vl_logic;
        o_rx_data       : out    vl_logic_vector(7 downto 0);
        o_rx_done       : out    vl_logic;
        o_spi_cs        : out    vl_logic;
        o_spi_clk       : out    vl_logic;
        i_spi_miso      : in     vl_logic;
        o_spi_mosi      : out    vl_logic;
        o_spi_busy      : out    vl_logic
    );
end spi_master;
