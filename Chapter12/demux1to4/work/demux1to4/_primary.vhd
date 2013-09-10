library verilog;
use verilog.vl_types.all;
entity demux1to4 is
    port(
        i_data          : in     vl_logic;
        i_sel           : in     vl_logic_vector(1 downto 0);
        o_a             : out    vl_logic;
        o_b             : out    vl_logic;
        o_c             : out    vl_logic;
        o_d             : out    vl_logic
    );
end demux1to4;
