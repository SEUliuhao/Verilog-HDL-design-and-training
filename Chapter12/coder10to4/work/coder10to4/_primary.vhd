library verilog;
use verilog.vl_types.all;
entity coder10to4 is
    port(
        i_data          : in     vl_logic_vector(9 downto 0);
        o_code          : out    vl_logic_vector(3 downto 0)
    );
end coder10to4;
