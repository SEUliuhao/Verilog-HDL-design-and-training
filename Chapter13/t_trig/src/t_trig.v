//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : t_trig.v
// FUNCTION        : ��������ģ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module t_trig
    (
        input i_clk, //ʱ�����ź�
        input i_t, //�������� 
        
        output  o_q, //jk�����������
        output  o_qb //jk�����������
    );
    
    //��������ź�o_data�Ļ���
    reg  r_q;
    
    assign o_q = r_q; //ͨ��assign������ֵ�����±������
    assign o_qb = ~r_q;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk) 
    begin 
        if(1'b1 == i_t)
            r_q <= ~r_q;
        else
            r_q <= r_q;              
	end
    
endmodule
// END OF t_trig.v FILE ***************************************************



