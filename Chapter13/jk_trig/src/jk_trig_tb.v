//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : jk_trig_tb.v
// FUNCTION        : jk_trig.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module jk_trig_tb;

    //定义激励源
    reg r_clk;
    reg [1 : 0] r_cnt;
    
    
        
    //定义输出信号连线
    wire w_q;
    wire w_qb;
    
    //实例化设计模块，采用端口名称映射方式
    jk_trig  I_jk_trig
        (
            .i_clk(r_clk),   
            .i_j(r_cnt[1]),
            .i_k(r_cnt[0]),
            .o_q(w_q),
            .o_qb(w_qb)
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
        r_cnt = 2'd0; 
        forever
            #20    r_cnt = r_cnt + 2'd1;
    end
endmodule

// END OF jk_trig_tb.v FILE ***************************************************



