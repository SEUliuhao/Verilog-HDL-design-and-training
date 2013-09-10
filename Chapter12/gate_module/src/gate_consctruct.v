//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : gate_consctruct.v
// FUNCTION        : �ŵ�·��ģ���ýṹ������ʵ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_consctruct
    (
        input i_a, //����5�������ź�
        input i_b,
        input i_c,
        input i_d,
        input i_e,
        
        output o_y //����һ������ź�
    );
    
    //�����ŵ�·֮��������ź�
    wire w_and_o;
    wire w_or1_o;    
    wire w_xor_o;
    
    //����ͼ12-1�ĵ�·�ṹ�������뵽�����˳�����ʵ�����ŵ�·ģ��
    and I_and(w_and_o, i_a, i_b);//ʵ��������
    
    or I1_or(w_or1_o, i_c, i_d); //ʵ������һ������
    
    xor I_xor(w_xor_o, w_and_o, w_or1_o); //ʵ���������
    
    or I2_or(o_y, w_xor_o, i_e); //ʵ�����ڶ������ţ���ɽ�ģ    
    
endmodule

// END OF gate_consctruct.v FILE ***************************************************



