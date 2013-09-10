//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : d_latch_tb.v
// FUNCTION        : d_latch.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_latch_tb;

    //���弤��Դ
    reg r_enable;
    reg r_d;
    
    
        
    //��������ź�����
    wire w_q;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    d_latch  I_d_latch
        (
            .i_enable(r_enable),   
            .i_d(r_d),
            .o_q(w_q)
        );
        
    //����ʱ�Ӽ����ź�
    initial
    begin
            r_enable = 1'b0;    
            forever
               #100 r_enable = ~r_enable;
    end
      
    initial
    begin
            r_d = 1'b0; 
        forever
            #15    r_d = ~r_d;
    end
endmodule

// END OF d_latch_tb.v FILE ***************************************************


