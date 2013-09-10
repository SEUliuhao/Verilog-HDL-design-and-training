//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : p_clk_div_tb.v
// FUNCTION        : p_clk_div.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module p_clk_div_tb;

    //���弤��Դ
    reg r_clk;
    reg r_reset_n;
    
    
        
    //��������ź�����
    wire w_1_div_clk;
    wire w_2_div_clk;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    clk_6_div  I1_clk_6_div
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_1_div_clk)
        );
        
    clk_6_div  I1_clk_6_div
        #(
            .COEFFICIENT(24),
            .CNT_WIDTH(5)
        )
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_2_div_clk)
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

// END OF p_clk_div_tb.v FILE ***************************************************



