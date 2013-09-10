library verilog;
use verilog.vl_types.all;
entity mux4to1 is
    port(
        i_a             : in     vl_logic;
        i_b             : in     vl_logic;
        i_c             : in     vl_logic;
        i_d             : in     vl_logic;
        i_sel           : in     vl_logic_vector(1 downto 0);
        o_data          : out    vl_logic
    );
end mux4to1;
