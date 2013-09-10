library verilog;
use verilog.vl_types.all;
entity decoder4to10 is
    port(
        i_data          : in     vl_logic_vector(3 downto 0);
        o_decode        : out    vl_logic_vector(9 downto 0)
    );
end decoder4to10;
