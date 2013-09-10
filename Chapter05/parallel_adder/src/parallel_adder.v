//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : parallel_adder.v
// FUNCTION        : 实现三个并行的加法器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module parallel_adder(
    input [7 : 0] da_one,
    input [7 : 0] db_one,
    input [7 : 0] da_two,
    input [7 : 0] db_two,
    input [7 : 0] da_three,
    input [7 : 0] db_three,
    
    output [7 : 0] sum_one,
    output [7 : 0] sum_two,
    output [7 : 0] sum_three
    );

//实现第一个加法器操作    
    assign sum_one = da_one + db_one;

//实现第二个加法器操作    
    assign sum_two = da_two + db_two;

//实现第三个加法器操作   
    assign sum_three = da_three + db_three;

endmodule

// END OF parallel_adder.v FILE *********************************************************     
