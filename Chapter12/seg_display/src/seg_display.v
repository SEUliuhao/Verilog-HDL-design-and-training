//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : seg_display.v
// FUNCTION        : ����ܵı����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seg_display
    (
        input [3: 0]i_data, //����10λ���������� 
        input i_dp,       
        
        output [6 : 0] o_seg, //����7λ�ı������,�ߵ��ͷֱ����A��B��C��D��E��F��G
        output o_dp
    );
    
    //��������ź�o_code�Ļ���
    reg [6 :0] r_seg;
    
    assign o_dp = i_dp; //С������ʾ����Ҫ���룬ֱ������Ϳ���
    
    assign o_seg = r_seg; //ͨ��assign������ֵ�����±������
    
   
    always @(*) //ʹ��always���̵���Ϊ��ʽ�����ȽϷ���
    begin
   	    case(i_data)
   	        4'b0000: r_seg = 7'b1111110; //��ʾ�ַ�0
   	        4'b0001: r_seg = 7'b0000110; //��ʾ�ַ�1
   	        4'b0010: r_seg = 7'b1101101; //��ʾ�ַ�2
   	        4'b0011: r_seg = 7'b1111001; //��ʾ�ַ�3
   	        4'b0100: r_seg = 7'b0110011; //��ʾ�ַ�4
   	        4'b0101: r_seg = 7'b1011011; //��ʾ�ַ�5
   	        4'b0110: r_seg = 7'b1011111; //��ʾ�ַ�6
   	        4'b0111: r_seg = 7'b1110000; //��ʾ�ַ�7
   	        4'b1000: r_seg = 7'b1111111; //��ʾ�ַ�8
   	        4'b1001: r_seg = 7'b1111011; //��ʾ�ַ�9
   	        4'b1010: r_seg = 7'b1110111; //��ʾ�ַ�A
   	        4'b1011: r_seg = 7'b0011111; //��ʾ�ַ�b
   	        4'b1100: r_seg = 7'b1001110; //��ʾ�ַ�c
   	        4'b1101: r_seg = 7'b0111101; //��ʾ�ַ�d
   	        4'b1110: r_seg = 7'b1001111; //��ʾ�ַ�E
   	        4'b1111: r_seg = 7'b1000111; //��ʾ�ַ�F
   	        default: r_seg = 7'b1111111; //ȫ��������
   	    endcase
	end
    
endmodule

// END OF seg_display.v FILE ***************************************************


