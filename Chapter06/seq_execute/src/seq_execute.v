//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : seq_execute.v
// FUNCTION        : initial初始化语句应用举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seq_execute( 
    input [7 : 0] data_one,
    input [7 : 0] data_two,
    input [7 : 0] data_three,   
    
    output [7 : 0] p_sum_one,
    output [7 : 0] p_sum_two,
    output [7 : 0] p_sum_three,
    
    output reg [7 : 0] s_sum_one,
    output reg [7 : 0] s_sum_two,
    output reg [7 : 0] s_sum_three    
    );    
    
    //三条并行连续赋值语句
    assign p_sum_one = data_one + data_two;
    assign p_sum_two = data_one + data_three;
    assign p_sum_three = data_three + data_two;
 
    //在always进程中也有三条顺序赋值语句   
    always @(data_one, data_two, data_three)
    begin
        s_sum_one = data_one + data_two;
        s_sum_two = data_one + data_three;
        s_sum_three = data_three + data_two;  
    end      
        
endmodule
// END OF seq_execute.v FILE ***************************************************

    
   
