library verilog;
use verilog.vl_types.all;
entity data_decrypt is
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_code          : in     vl_logic;
        o_data          : out    vl_logic
    );
end data_decrypt;
