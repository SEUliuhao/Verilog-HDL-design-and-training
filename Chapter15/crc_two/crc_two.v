//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : crc_two.v
// FUNCTION        : CRC编码方式二
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module crc_two(
    input i_rst_n,
    input i_clk,
    
    input i_data,       //数据输入
    output o_crc_code,  //CRC编码输出
    output o_crc_done);      //CRC编码完成标志，高为完成

    
    reg [3 : 0] r_shift;    //
    reg [2 : 0] r_cnt;
    reg r_crc_code;
    reg r_crc_done;
    
    assign o_crc_done = r_crc_done;
    assign o_crc_code = r_crc_code;
    
//*********************************PROCESS**************************************
// FUNCTION        :根据CRC编码定义进行CRC编码
//******************************************************************************     
    always @(negedge i_rst_n, posedge i_clk)
    begin
        if(~i_rst_n)
        begin
            r_shift <= 4'b0;
            r_cnt <= 3'b0;
            r_crc_code <= 1'b0;
            r_crc_done <= 1'b0;
        end
        else
            if(r_cnt < 3'd3)     //CRC编码完成
            begin
                r_shift[3] <= i_data ^ r_shift[0];
                r_shift[2] <= i_data ^ r_shift[0] ^ r_shift[3];
                r_shift[1] <= i_data ^ r_shift[0] ^ r_shift[2];
                r_shift[0] <= r_shift[1];
                r_cnt <= r_cnt + 3'd1;
                r_crc_done <= 1'b0;
                r_crc_code <= i_data;
            end
            else
            begin
                if(r_cnt == 3'd6)                   //最高位为1则作除法
                begin 
                    r_cnt <= 3'b0;
                    r_crc_done <= 1'b1;  
                end
                else
                begin
                    r_cnt <= r_cnt + 3'd1;
                    r_crc_done <= 1'b0;
                end
                
                r_shift <= {1'b0, r_shift[3 : 1]};
                r_crc_code <= r_shift[0];
            end
    end
endmodule

// END OF crc_two.v FILE *********************************************************
                 
       
            
    
    


