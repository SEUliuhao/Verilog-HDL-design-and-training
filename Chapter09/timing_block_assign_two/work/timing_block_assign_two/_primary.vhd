library verilog;
use verilog.vl_types.all;
entity timing_block_assign_two is
    port(
        clk             : in     vl_logic;
        a               : in     vl_logic;
        y               : out    vl_logic
    );
end timing_block_assign_two;
