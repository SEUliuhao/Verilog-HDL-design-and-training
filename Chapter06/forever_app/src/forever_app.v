//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : forever_app.v
// FUNCTION        : for循环语句应用举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module forever_app(        
        );    
    reg clk;
    
   
    initial 
    begin
            clk = 1'b0;            
            
        #1   forever
                #1  clk = ~clk; //产生一个周期为2ns的时钟信号
    end    
    
endmodule
// END OF forever_app.v FILE ***************************************************

    
   