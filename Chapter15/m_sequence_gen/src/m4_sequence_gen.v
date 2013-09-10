//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : m4_sequence_gen.v
// FUNCTION        : 4阶m序列发生器
//                    _  _   _  _   _  _  
//                   |_||_|_|_||_|_|_||_|
//                   |_||_| |_||_| |_||_| 
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module m4_sequence_gen
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        output o_code      
    );
    
    //定义输出信号o_data的缓存
    reg [3 : 0] r_shift;
    
    assign o_code = r_shift[0];
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_shift <= 4'b0001;
        end
        else
        begin
            r_shift[2 : 0]  <= r_shift[3 : 1];
            r_shift[3] <= r_shift[3] ^ r_shift[0];
        end
	end
    
endmodule
// END OF m4_sequence_gen.v FILE ***************************************************



