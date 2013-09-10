//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : s_if.v
// FUNCTION        : 单分支if条件选择语句应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module s_if( 
    input clk,
    input din_one,
    input din_two,    
    
    output reg dout_s, 
    output reg dout_mone, 
    output reg dout_mtwo    
    );    
    
    //分支内只有一条顺序语句
    always @(posedge clk)
    begin
        if(din_one)
            dout_s <= din_two;
    end
    
    //分支内多条顺序语句
    always @(posedge clk)
    begin
        if(din_one)
        begin
            dout_mone = ~din_two;
            dout_mtwo = din_two;
        end
    end
        
endmodule
// END OF s_if.v FILE ***************************************************

    
   
