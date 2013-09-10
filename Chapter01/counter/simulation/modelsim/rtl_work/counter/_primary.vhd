library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        PERIOD          : integer := 15
    );
    port(
        I_rst_n         : in     vl_logic;
        I_clk           : in     vl_logic;
        O_cnt           : out    vl_logic_vector(7 downto 0);
        O_cout          : out    vl_logic
    );
end counter;
