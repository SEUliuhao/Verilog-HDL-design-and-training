//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : decoder4to10_tb.v
// FUNCTION        : coder4to10.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module decoder4to10_tb;

    //定义激励源
    reg [3 : 0] r_data;
    
    
        
    //定义输出信号连线
    wire [9 : 0] w_decode;
    
    //实例化设计模块，采用端口名称映射方式
    decoder4to10  I_decoder4to10
        (
            .i_data(r_data),            
            .o_decode(w_decode)
        );
        
    //产生激励信号
    initial
    begin
            r_data = 4'd0;       
            repeat(10)
               #2 r_data = r_data + 4'd1;
    end
      
endmodule
// END OF decoder4to10_tb.v FILE ***************************************************



