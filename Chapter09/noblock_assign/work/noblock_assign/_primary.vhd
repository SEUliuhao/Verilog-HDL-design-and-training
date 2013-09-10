library verilog;
use verilog.vl_types.all;
entity noblock_assign is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        y               : out    vl_logic
    );
end noblock_assign;
