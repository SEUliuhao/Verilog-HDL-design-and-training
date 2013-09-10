//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : parameter_module.v
// FUNCTION        : 参数化的数据选择器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************


module parameter_module(
        input [7 : 0] data_one,
        input [7 : 0] data_two,
        input sel,
        
        output [7 : 0] data_8out,
        output [2 : 0] data_3out
    );
    
    data_select    
        #(
            .DATA_WIDTH(8)     
        ) U1_8out(
            .data_one(data_one),
            .data_two(data_two),
            .sel(sel),
            .data_out(data_8out)
        );
        
    data_select    
        #(
            .DATA_WIDTH(3)     
        ) U1_3out(
            .data_one(data_one[2 :0]),
            .data_two(data_two[2 :0]),
            .sel(sel),
            .data_out(data_3out)
        );        
    
endmodule
// END OF parameter_module.v FILE ***************************************************

    
   