//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : block_assign.v
// FUNCTION        : 阻塞赋值应用示例一
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module block_assign
        (
            input a,
            input b,
            input c,
            input d,
            
            output y        
        );
    
    reg temp1;
    reg temp2;
    reg y_r;
    
    assign y = y_r;
    
    always @(a, b, c, d, temp1, temp2)
    begin
        temp1 = a & b;
        temp2 = d ^ c;
        y_r = temp1 | temp2;
    end    
endmodule
// END OF block_assign.v FILE ***************************************************

    
   