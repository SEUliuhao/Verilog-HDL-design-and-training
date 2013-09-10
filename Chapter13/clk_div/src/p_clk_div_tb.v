//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : p_clk_div_tb.v
// FUNCTION        : p_clk_div.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module p_clk_div_tb;

    //定义激励源
    reg r_clk;
    reg r_reset_n;
    
    
        
    //定义输出信号连线
    wire w_1_div_clk;
    wire w_2_div_clk;
    
    //实例化设计模块，采用端口名称映射方式
    clk_6_div  I1_clk_6_div
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_1_div_clk)
        );
        
    clk_6_div  I1_clk_6_div
        #(
            .COEFFICIENT(24),
            .CNT_WIDTH(5)
        )
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_2_div_clk)
        );
        
    //产生时钟激励信号
    initial
    begin
        r_clk = 1'b0;    
        forever
           #10 r_clk = ~r_clk;
    end
      
    initial
    begin
            r_reset_n = 1'b0;
        #40 r_reset_n = 1'b1;
    end
endmodule

// END OF p_clk_div_tb.v FILE ***************************************************



