//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : shift_reg.v
// FUNCTION        : 移位寄存器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module shift_reg
    (
        input i_clk, //时钟能信号
        input i_d, //数据输入 
        
        output  o_q, //串行数据正输出
        output [7 : 0]  o_data //并行数据输出
    );
    
    //定义输出信号o_data的缓存
    reg  r_q;
    reg [7 : 0] r_data;
    
    assign o_q = r_data[7]; //左移，每次都输出寄存器的最高位
    //assign o_q = r_data[0]; //右移，每次都输出寄存器的最低位
    assign o_data = r_data;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk) 
    begin 
        r_data <= {r_data[6 : 0], i_d};  //左移操作      
        //r_data <= {i_d, r_data[7 : 1]};  //右移操作       
	end
    
endmodule
// END OF shift_reg.v FILE ***************************************************



