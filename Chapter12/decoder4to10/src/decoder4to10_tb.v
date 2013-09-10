//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : decoder4to10_tb.v
// FUNCTION        : coder4to10.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module decoder4to10_tb;

    //���弤��Դ
    reg [3 : 0] r_data;
    
    
        
    //��������ź�����
    wire [9 : 0] w_decode;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    decoder4to10  I_decoder4to10
        (
            .i_data(r_data),            
            .o_decode(w_decode)
        );
        
    //���������ź�
    initial
    begin
            r_data = 4'd0;       
            repeat(10)
               #2 r_data = r_data + 4'd1;
    end
      
endmodule
// END OF decoder4to10_tb.v FILE ***************************************************



