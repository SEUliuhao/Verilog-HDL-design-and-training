//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : mux2to1.v
// FUNCTION        : 2选1复用器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module mux2to1(
	input A,
	input B,
	input sel,
	
	output reg Y
);

//*********************************always***************************************
// FUNCTION        :根据sel的值选择输出信号Y是A还是B
//****************************************************************************** 
    always @(A, B, sel)
    begin
        if(sel)
            Y = B;
        else
            Y = A;
    end
endmodule
// END OF mux2to1.v FILE *******************************************************
           