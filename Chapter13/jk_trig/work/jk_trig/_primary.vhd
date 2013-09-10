library verilog;
use verilog.vl_types.all;
entity jk_trig is
    port(
        i_clk           : in     vl_logic;
        i_j             : in     vl_logic;
        i_k             : in     vl_logic;
        o_q             : out    vl_logic;
        o_qb            : out    vl_logic
    );
end jk_trig;
