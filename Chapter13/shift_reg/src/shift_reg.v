//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : shift_reg.v
// FUNCTION        : ��λ�Ĵ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module shift_reg
    (
        input i_clk, //ʱ�����ź�
        input i_d, //�������� 
        
        output  o_q, //�������������
        output [7 : 0]  o_data //�����������
    );
    
    //��������ź�o_data�Ļ���
    reg  r_q;
    reg [7 : 0] r_data;
    
    assign o_q = r_data[7]; //���ƣ�ÿ�ζ�����Ĵ��������λ
    //assign o_q = r_data[0]; //���ƣ�ÿ�ζ�����Ĵ��������λ
    assign o_data = r_data;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk) 
    begin 
        r_data <= {r_data[6 : 0], i_d};  //���Ʋ���      
        //r_data <= {i_d, r_data[7 : 1]};  //���Ʋ���       
	end
    
endmodule
// END OF shift_reg.v FILE ***************************************************



