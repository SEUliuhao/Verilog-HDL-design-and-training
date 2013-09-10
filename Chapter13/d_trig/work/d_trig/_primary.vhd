library verilog;
use verilog.vl_types.all;
entity d_trig is
    port(
        i_clk           : in     vl_logic;
        i_clr           : in     vl_logic;
        i_enable        : in     vl_logic;
        i_d             : in     vl_logic;
        o_q             : out    vl_logic
    );
end d_trig;
