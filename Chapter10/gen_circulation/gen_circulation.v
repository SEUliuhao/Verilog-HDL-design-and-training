//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gen_circulation.v
// FUNCTION        : 产生循环信号
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gen_circulation;  //测试平台不需要端口定义

    reg a;
    reg b;
    reg c;
    
    
    initial
    begin
            a = 0;
        forever
            #2 a = ~a;            
    end
    
    initial
            b = 0;                 
    
    always 
        #4 b = ~b;
        
    initial
    begin
            c = 0;
        forever
        begin
            #1 c= 1; 
            #2 c= 0;
            #3 c= 1;           
            #4 c= 0;
        end
    end
    
endmodule

// END OF gen_circulation.v FILE ***************************************************



