//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : demux1to4_tb.v
// FUNCTION        : coder4to10.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module demux1to4_tb;

    //定义激励源
    reg  r_data;
    reg [1 : 0] r_sel;
    
    
        
    //定义输出信号连线
    wire w_a;
    wire w_b;
    wire w_c;
    wire w_d;
    
    //实例化设计模块，采用端口名称映射方式
    demux1to4  I_demux1to4
        (
            .i_data(r_data),
            .i_sel(r_sel),   
            .o_a(w_a),   
            .o_b(w_b),
            .o_c(w_c),
            .o_d(w_d)
        );
        
    //产生激励信号
    initial
    begin
            r_data = 4'd0;       
            repeat(64)
               #2 r_data = ~r_data;
    end
      
    initial
    begin
            r_sel = 2'd0;       
            repeat(4)
               #32 r_sel = r_sel + 4'd1;
    end
endmodule
// END OF demux1to4_tb.v FILE ***************************************************



