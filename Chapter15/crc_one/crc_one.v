//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : crc_one.v
// FUNCTION        : CRC编码方式一
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module crc_one(
    input i_rst_n,
    input i_clk,
    
    input [2 : 0] i_data,       //数据输入
    output [3 : 0] o_crc_code,  //CRC编码输出
    output o_crc_done);      //CRC编码完成标志，高为完成

    parameter GX = 4'b10111;
    
    reg [7 : 0] r_shift;    //
    reg [2 : 0] r_cnt;
    reg [3 : 0] r_crc_code;
    reg r_crc_done;
    
    assign o_crc_code = r_crc_code;
    assign o_crc_done = r_crc_done;
    
//*********************************PROCESS**************************************
// FUNCTION        :根据CRC编码定义进行CRC编码
//******************************************************************************     
    always @(negedge i_rst_n, posedge i_clk)
    begin
        if(~i_rst_n)
        begin
            r_shift <= 8'b0;
            r_cnt <= 3'b0;
            r_crc_code <= 4'b0;
            r_crc_done <= 1'b0;
        end
        else
            if(r_cnt == 3'd3)     //CRC编码完成
            begin
                r_shift <= {1'b0, i_data, 4'b0};        //重新装载数据
                r_cnt <= 3'b0;
                r_crc_code <= r_shift[6 : 3];
                r_crc_done <= 1'b1;
            end
            else
            begin
                if(r_shift[6] == 1'b1)                   //最高位为1则作除法
                begin   
                    r_shift[7 : 3] <= r_shift[6 : 2] ^ GX;
                    r_shift[2 : 0] <= {r_shift[1 : 0], 1'b0};
                end
                else
                    r_shift <= {r_shift[6 : 0], 1'b0};
                
                r_cnt <= r_cnt + 3'd1;
                r_crc_done <= 1'b0;
            end
    end
endmodule

// END OF crc_one.v FILE *********************************************************
                 
       
            
    
    
