//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : casex_app.v
// FUNCTION        : casez条件选择语句应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module casex_app( 
    
    );    

    reg [3 : 0] sel;
    reg [3 : 0] data;
    
    initial 
    begin
            sel = 4'b0000;
        #1  sel = 4'b1000;
        #1  sel = 4'b0100;
        #1  sel = 4'b0010;
        #1  sel = 4'b0001;
        #1  sel = 4'b11zx;
    end
    
    always @(sel)
    begin
        casez(sel)
            4'b0000: data = 4'b0000; //当sel = 4'b0000执行
            4'b1zxz: data = 4'b0001; //当sel = 4'b1000执行，忽略分支项低三位的值
            4'b01zx: data = 4'b0010; //当sel = 4'b0100执行，忽略分支项低两位的值
            4'b001z: data = 4'b0011; //当sel = 4'b0010执行，忽略分支项低一位的值
            4'bzxz1: data = 4'b0100; //当sel = 4'b0001执行，忽略分支项高三位的值
            4'b11zx: data = 4'b0101; //当sel = 4'b1100执行，忽略条件表达低两位的值
            default: data = 4'b0110; //当sel不是以上值时执行
        endcasez
    end
          
endmodule
// END OF casex_app.v FILE ***************************************************

  