library verilog;
use verilog.vl_types.all;
entity data_encrypt is
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_data          : in     vl_logic;
        o_code          : out    vl_logic
    );
end data_encrypt;
