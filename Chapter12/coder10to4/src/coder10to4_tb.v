//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : coder10to4_tb.v
// FUNCTION        : coder10to4.v��ģ����ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module coder10to4_tb;

    //���弤��Դ
    reg [9 : 0] r_data;
    
    
        
    //��������ź�����
    wire [3 : 0] w_code;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    coder10to4  I_coder10to4
        (
            .i_data(r_data),            
            .o_code(w_code)
        );
        
    //���������ź�
    initial
    begin
            r_data = 10'd0;
       #2   r_data = 10'd1;
            repeat(10)
               #2 r_data = r_data << 1;
    end
      
endmodule
// END OF coder10to4_tb.v FILE ***************************************************



