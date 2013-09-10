//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : block_assign_three.v
// FUNCTION        : 阻塞赋值应用示例三
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module block_assign_three
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
    
    always @(a, b, c, d)
    begin
        y_r = temp1 | temp2;
        temp1 = a & b;
        temp2 = d ^ c;        
    end    
endmodule
// END OF block_assign_three.v FILE ***************************************************

    
   