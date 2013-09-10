library verilog;
use verilog.vl_types.all;
entity crc_two is
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_data          : in     vl_logic;
        o_crc_code      : out    vl_logic;
        o_crc_done      : out    vl_logic
    );
end crc_two;
