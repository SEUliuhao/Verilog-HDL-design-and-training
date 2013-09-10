//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : crc_one_tb.v
// FUNCTION        : CRC���뷽ʽһģ�����ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module crc_one_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg [2 : 0] r_data;
    
    wire [3 : 0] w_crc_code;    //CRC�����ź� 
    wire w_crc_done;    //CRC��������ź�

       
//*********************************PROCESS**************************************
// FUNCTION        :��ʼ��r_rst_n
//******************************************************************************     
    initial
    begin
            r_rst_n = 1'b0;
        #10 r_rst_n = 1'b1; 
    end

//*********************************PROCESS**************************************
// FUNCTION        :��ʼ��r_clk,��������Ϊ2ns��ʱ���ź�
//******************************************************************************     
    initial
    begin
            r_clk = 1'b0;
        forever
            #1  r_clk = ~r_clk;
    end
//*********************************PROCESS**************************************
// FUNCTION        :��ʼ��r_data
//******************************************************************************     
    initial
    begin
            r_data = 1'b0;
        forever
            #8  r_data = r_data + 3'd1;
    end

//*********************************PROCESS**************************************
// FUNCTION        :ʵ����CRC����ģ��crc_one
//******************************************************************************     
    crc_one I1_crc_one(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_data(r_data),
                        .o_crc_code(w_crc_code),
                        .o_crc_done(w_crc_done)
                      );
    
endmodule
// END OF data_encrypt.v FILE *********************************************************
                 
       
            
    
    