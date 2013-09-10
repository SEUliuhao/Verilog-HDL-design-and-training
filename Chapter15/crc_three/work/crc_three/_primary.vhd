library verilog;
use verilog.vl_types.all;
entity crc_three is
    port(
        i_data          : in     vl_logic_vector(2 downto 0);
        o_crc_code      : out    vl_logic_vector(3 downto 0)
    );
end crc_three;
