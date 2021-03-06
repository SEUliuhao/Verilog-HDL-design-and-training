//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : timing_no_block_assign.v
// FUNCTION        : 时序电路中阻塞赋值应用示例三
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module timing_no_block_assign
        (
            input clk,
            input a, 
            
            output y        
        );
    
    reg temp_one;
    reg temp_two;
    reg y_r;

    assign y = y_r;
    
    always @(posedge clk)
    begin
        temp_one <= a;
        temp_two <= temp_one;
        y_r <= temp_two;        
    end    
endmodule
// END OF timing_no_block_assign.v FILE ***************************************************

    
   