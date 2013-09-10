//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : coder10to4.v
// FUNCTION        : 10λ���ص�4λ���ݵı�����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module coder10to4
    (
        input [9: 0]i_data, //����10λ����������        
        
        output [3 : 0] o_code //����4λ�ı������
    );
    
    //��������ź�o_code�Ļ���
    reg [3 :0] r_code;
    
    assign o_code = r_code; //ͨ��assign������ֵ�����±������
    
       
   
    always @(*) //ʹ��always���̵���Ϊ��ʽ�����ȽϷ���
    begin
   	    case(i_data)
   	        10'b0000000001: r_code = 4'b0001; //��ϵ�·ʹ��������ֵ���
   	        10'b0000000010: r_code = 4'b0010;
   	        10'b0000000100: r_code = 4'b0011;
   	        10'b0000001000: r_code = 4'b0100;
   	        10'b0000010000: r_code = 4'b0101;
   	        10'b0000100000: r_code = 4'b0110;
   	        10'b0001000000: r_code = 4'b0111;
   	        10'b0010000000: r_code = 4'b1000;
   	        10'b0100000000: r_code = 4'b1001;
   	        10'b1000000000: r_code = 4'b1010;
   	        default: r_code = 4'b0000; //��Ҫ����Ĭ�Ϸ�֧�ĸ�ֵ���������������
   	    endcase
	end
    
endmodule

// END OF coder10to4.v FILE ***************************************************


