//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : demux1to4_tb.v
// FUNCTION        : coder4to10.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module demux1to4_tb;

    //���弤��Դ
    reg  r_data;
    reg [1 : 0] r_sel;
    
    
        
    //��������ź�����
    wire w_a;
    wire w_b;
    wire w_c;
    wire w_d;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    demux1to4  I_demux1to4
        (
            .i_data(r_data),
            .i_sel(r_sel),   
            .o_a(w_a),   
            .o_b(w_b),
            .o_c(w_c),
            .o_d(w_d)
        );
        
    //���������ź�
    initial
    begin
            r_data = 4'd0;       
            repeat(64)
               #2 r_data = ~r_data;
    end
      
    initial
    begin
            r_sel = 2'd0;       
            repeat(4)
               #32 r_sel = r_sel + 4'd1;
    end
endmodule
// END OF demux1to4_tb.v FILE ***************************************************



