//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : encrypt_code.v
// FUNCTION        : �źż��ܱ���
//                    _  _   _  _   _  _  
//                   |_||_|_|_||_|_|_||_|
//                   |_||_| |_||_| |_||_| 
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module encrypt_code
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        input i_data,
        output o_code      
    );
    
    //��������ź�o_data�Ļ���
    reg [3 : 0] r_shift;
    
    assign o_code = r_shift[0] ^ i_data;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_shift <= 4'b0001;
        end
        else
        begin
            r_shift[2 : 0]  <= r_shift[3 : 1];
            r_shift[3] <= r_shift[3] ^ r_shift[0];
        end
	end
    
endmodule
// END OF encrypt_code.v FILE ***************************************************


