//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : clk_6_div.v
// FUNCTION        : ������ʱ�ӽ���6��Ƶ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module clk_6_div
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        
        
        output  o_div_clk //�������
    );
    
    //��������ź�o_data�Ļ���
    reg [1 : 0] r_cnt;
    reg r_div_clk;
    assign o_div_clk = r_div_clk;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 2'd0;
        else
            if(2'd2 == r_cnt)
                r_cnt <= 2'd0;
            else
                r_cnt <= r_cnt + 2'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_div_clk <= 1'b0;
        else
            if(2'd2 == r_cnt)
                r_div_clk <= ~r_div_clk;
	end
    
endmodule
// END OF clk_6_div.v FILE ***************************************************



