//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : seg_display_ctrl.v
// FUNCTION        : ����1��8������ܵ���ʾ,��ʾЧ�����£��ֱ���ʱ-��-��
//                    _  _   _  _   _  _  
//                   |_||_|_|_||_|_|_||_|
//                   |_||_| |_||_| |_||_| 
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seg_display_ctrl
    (
        input r_rst_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        input [3 : 0] i_hour_h,     //ʱ�Ӹ�λ
        input [3 : 0] i_hour_l,     //ʱ�ӵ�λ
        input [3 : 0] i_minut_h,    //���Ӹ�λ
        input [3 : 0] i_minut_l,    //���ӵ�λ
        input [3 : 0] i_second_h,   //���Ӹ�λ
        input [3 : 0] i_second_l,   //���ӵ�λ        
        
        
        output [7 : 0] o_seg_control, //�������
        output [7 : 0] o_seg_display //��������ǰֵ���
    );
    
    //��������ź�o_data�Ļ���
    reg [3 : 0] r_display_data;
    reg [2 : 0] r_cnt;
    reg [7 : 0] r_seg_control;
    wire w_dp;
    wire [6 : 0] w_seg_display;
    
    seg_display  I_seg_display
        (
            .i_data(r_display_data), 
            .i_dp(1'b1),           
            .o_seg(w_seg_display[6:0]),
            .o_dp(w_dp)
        );
    assign o_seg_display = {w_dp, w_seg_display};
    assign o_seg_control = r_seg_control;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
            r_cnt <= 3'd0;
        else
            r_cnt <= r_cnt + 3'd1;
	end
	
	always @(*) 
    begin
        case(r_cnt)
            3'd0: r_display_data =  i_second_l; 
            3'd1: r_display_data =  i_second_h; 
            3'd2: r_display_data =  4'hA;           //��ʾ��-��
            3'd3: r_display_data =  i_minut_l; 
            3'd4: r_display_data =  i_minut_h; 
            3'd5: r_display_data =  4'hA;           //��ʾ��-��
            3'd6: r_display_data =  i_hour_l; 
            3'd7: r_display_data =  i_hour_h; 
            default: r_display_data =  4'hA;        //��ʾ��-��
        endcase
	end
	
	always @(*) 
    begin
        case(r_cnt)
            3'd0: r_seg_control = 8'b01111111;
            3'd1: r_seg_control = 8'b10111111;
            3'd2: r_seg_control = 8'b11011111;
            3'd3: r_seg_control = 8'b11101111; 
            3'd4: r_seg_control = 8'b11110111;
            3'd5: r_seg_control = 8'b11111011;
            3'd6: r_seg_control = 8'b11111101;
            3'd7: r_seg_control = 8'b11111110;
            default: r_seg_control = 8'b11111111;
        endcase
	end
    
endmodule
// END OF seg_display_ctrl.v FILE ***************************************************



