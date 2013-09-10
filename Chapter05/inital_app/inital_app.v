//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : initial_app.v
// FUNCTION        : initial初始化语句应用举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module initial_ap(        
    );
    reg clk_one;
    reg clk_two;
    reg sig_one;
    
    initial
    begin
        clk_one = 0;
        #2 clk_one = 1;
        #2 clk_one = 0;
        #2 clk_one = 1;
        #2 clk_one = 0;
    end
    
        initial
    begin
        clk_two = 0;
        #5 clk_two = 1;
        #5 clk_two = 0;
        #5 clk_two = 1;
        #5 clk_two = 0;
    end
    
    initial
    begin
        sig_one = 1;       
    end
            
    
    
endmodule
// END OF initial_ap.v FILE ***************************************************

    
   
