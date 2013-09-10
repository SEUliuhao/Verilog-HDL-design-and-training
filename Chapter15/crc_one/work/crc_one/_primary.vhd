library verilog;
use verilog.vl_types.all;
entity crc_one is
    generic(
        GX              : integer := 7
    );
    port(
        i_rst_n         : in     vl_logic;
        i_clk           : in     vl_logic;
        i_data          : in     vl_logic_vector(2 downto 0);
        o_crc_code      : out    vl_logic_vector(3 downto 0);
        o_crc_done      : out    vl_logic
    );
end crc_one;
