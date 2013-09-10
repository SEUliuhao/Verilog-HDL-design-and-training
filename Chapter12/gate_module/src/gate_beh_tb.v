//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : gate_beh_tb.v
// FUNCTION        : �ŵ�·��ģ����ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_beh_tb;

    //���弤��Դ
    reg r_a;
    reg r_b;
    reg r_c;
    reg r_d;
    reg r_e;
    
    reg [4 : 0] r_cnt;
    
        
    //��������ź�����
    wire w_y;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    gate_beh  I_gate_beh
        (
            .i_a(r_a),
            .i_b(r_b),
            .i_c(r_c),
            .i_d(r_d),
            .i_e(r_e),
            .o_y(w_y)
        );
        
    //���������ź�
    initial
    begin
       r_cnt = 5'd0;
       forever
           #2 r_cnt = r_cnt + 5'd1;
    end
    
    //����gate_consctruct�������źŵ�ֵ
    always @(r_cnt)
    begin
        r_a = r_cnt[0];
        r_b = r_cnt[1];
        r_c = r_cnt[2];
        r_d = r_cnt[3];
        r_e = r_cnt[4];
    end
      
endmodule

// END OF gate_beh_tb.v FILE ***************************************************



