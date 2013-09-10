//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : p_counter.v
// FUNCTION        : �������ļ����������������������λ���������Բ�����
//                   
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module p_counter
    #(
        parameter PERIOD = 12,//����������
        parameter CNT_WIDTH = 4 //��������������λ��   
    )
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        
        
        output  o_cout, //�������
        output [CNT_WIDTH-1 : 0]  o_cnt //��������ǰֵ���
    );
    
    //��������ź�o_data�Ļ���
    reg [CNT_WIDTH-1 : 0] r_cnt;
    
    assign o_cout = ((PERIOD - 1) == r_cnt)? 1'b1 : 1'b0; //�ã������ʵ�������ź����
    assign o_cnt = r_cnt;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 0;
        else
            if((PERIOD - 1) == r_cnt)
                r_cnt <= 0;
            else
                r_cnt <= r_cnt + 1;
	end
    
endmodule
// END OF p_counter.v FILE ***************************************************



