library verilog;
use verilog.vl_types.all;
entity d_latch is
    port(
        i_enable        : in     vl_logic;
        i_d             : in     vl_logic;
        o_q             : out    vl_logic
    );
end d_latch;
