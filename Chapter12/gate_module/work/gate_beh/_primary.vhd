library verilog;
use verilog.vl_types.all;
entity gate_beh is
    port(
        i_a             : in     vl_logic;
        i_b             : in     vl_logic;
        i_c             : in     vl_logic;
        i_d             : in     vl_logic;
        i_e             : in     vl_logic;
        o_y             : out    vl_logic
    );
end gate_beh;
