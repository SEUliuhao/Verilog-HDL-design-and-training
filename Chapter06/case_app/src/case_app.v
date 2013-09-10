//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : case_app.v
// FUNCTION        : 单分支if条件选择语句应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module case_app( 
    input [1 : 0] case_sel,
    input din_one,  
    input din_two,      
    
    output reg dout    
    );    
    
//case条件选择语句
//根据case_sel的值，选择不同的逻辑操作
    always @(case_sel, din_one,din_two)
    begin
        case(case_sel)
            2'b00: 
                dout = din_one & din_two;
            2'b01: 
                dout = din_one | din_two;
            2'b10: 
                dout = din_one ^ din_two;
            2'b11: 
                dout = din_one ~^ din_two;
            default: 
                dout = din_one & din_two;
        endcase           
    end  

      
endmodule
// END OF case_app.v FILE ***************************************************

  