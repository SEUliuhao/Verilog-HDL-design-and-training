//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : d_latch.v
// FUNCTION        : ��������ģ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_latch
    (
        input i_enable, //ʹ���ź�
        input i_d, //�������� 
        
        output  o_q //�����ź����
    );
    
    //��������ź�o_data�Ļ���
    reg  r_q;
    
    assign o_q = r_q; //ͨ��assign������ֵ�����±������
   
    //�������źŽ�������
    always @(i_enable, i_d) //����Ϊ��ƽ�����¼�
    begin 
        if(1'b1 == i_enable)                  
   	        r_q <= i_d; //ʱ���·��ģ�����÷�������ֵ���
	end
    
endmodule
// END OF d_latch.v FILE ***************************************************



