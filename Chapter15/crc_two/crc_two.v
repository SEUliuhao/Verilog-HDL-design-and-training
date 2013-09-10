//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : crc_two.v
// FUNCTION        : CRC���뷽ʽ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module crc_two(
    input i_rst_n,
    input i_clk,
    
    input i_data,       //��������
    output o_crc_code,  //CRC�������
    output o_crc_done);      //CRC������ɱ�־����Ϊ���

    
    reg [3 : 0] r_shift;    //
    reg [2 : 0] r_cnt;
    reg r_crc_code;
    reg r_crc_done;
    
    assign o_crc_done = r_crc_done;
    assign o_crc_code = r_crc_code;
    
//*********************************PROCESS**************************************
// FUNCTION        :����CRC���붨�����CRC����
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
            if(r_cnt < 3'd3)     //CRC�������
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
                if(r_cnt == 3'd6)                   //���λΪ1��������
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
                 
       
            
    
    


