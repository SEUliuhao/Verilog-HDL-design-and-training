//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : jk_trig.v
// FUNCTION        : ��������ģ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module jk_trig
    (
        input i_clk, //ʹ���ź�
        input i_j, //�������� 
        input i_k,
        
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
        case({i_j, i_k})
            2'b00:  r_q <= r_q;
            2'b01:  r_q <= 1'b0;
            2'b10:  r_q <= 1'b1;
            2'b11:  r_q <= ~r_q;
            default:  r_q <= r_q;
        endcase            
	end
    
endmodule
// END OF jk_trig.v FILE ***************************************************



