//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : counter_tb.v
// FUNCTION        : counter.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module counter_tb;

    //���弤��Դ
    reg r_clk;
    reg r_reset_n;
    
    
        
    //��������ź�����
    wire w_cout;
    wire [3 : 0] w_cnt;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    counter  I_counter
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_cout(w_cout),
            .o_cnt(w_cnt)
        );
        
    //����ʱ�Ӽ����ź�
    initial
    begin
        r_clk = 1'b0;    
        forever
           #10 r_clk = ~r_clk;
    end
      
    initial
    begin
            r_reset_n = 1'b0;
        #40 r_reset_n = 1'b1;
    end
endmodule

// END OF counter_tb.v FILE ***************************************************



