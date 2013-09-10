//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : crc_code_three.v
// FUNCTION        : CRC编码的第二种方式
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module crc_code_three
    (
        input [2 : 0] i_data,
        output [3 : 0] o_crc
    );
    
    reg [3 : 0] r_crc;
    
    assign o_crc = r_crc;
    
    always @(*) 
    begin
        r_crc[3] = i_data[2] ^ i_data[1];
        r_crc[2] = i_data[1] ^ i_data[0];
        r_crc[1] = i_data[2] ^ i_data[1] ^ i_data[0];
        r_crc[0] = i_data[2] ^ i_data[0];
	end
	    
endmodule
// END OF crc_code_three.v FILE ***************************************************



