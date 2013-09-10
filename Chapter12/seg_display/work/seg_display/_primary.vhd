library verilog;
use verilog.vl_types.all;
entity seg_display is
    port(
        i_data          : in     vl_logic_vector(3 downto 0);
        i_dp            : in     vl_logic;
        o_seg           : out    vl_logic_vector(6 downto 0);
        o_dp            : out    vl_logic
    );
end seg_display;
