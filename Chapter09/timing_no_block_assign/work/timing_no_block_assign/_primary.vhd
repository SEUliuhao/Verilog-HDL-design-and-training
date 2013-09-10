library verilog;
use verilog.vl_types.all;
entity timing_no_block_assign is
    port(
        clk             : in     vl_logic;
        a               : in     vl_logic;
        y               : out    vl_logic
    );
end timing_no_block_assign;
