//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : demux1to4.v
// FUNCTION        : 4-1������ѡ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module demux1to4
    (
        input i_data,
        input [1 : 0] i_sel, //2λ��ѡ���ź� 
        
        output o_a, //��һ·�������
        output o_b, //�ڶ�·������� 
        output o_c, //����·�������
        output o_d //����·�������        
    );
    
    //��������ź�o_data�Ļ���
    reg  r_a;
    reg  r_b;
    reg  r_c;
    reg  r_d;
    
    assign o_a = r_a; //ͨ��assign������ֵ�����±������
    assign o_b = r_b;
    assign o_c = r_c;
    assign o_d = r_d;
    
    //��ѡ���źŵ�ֵΪ00ʱ������������i_data���䵽��һ·����˿�
    //�����һ·���Ϊ0
    always @(*)
    begin
   	    if(i_sel == 2'b00)
   	        r_a = i_data;
   	    else
   	        r_a = 1'b0;
	end
	
	//��ѡ���źŵ�ֵΪ01ʱ������������i_data���䵽�ڶ�·����˿�
    //����ڶ�·���Ϊ0
    always @(*)
    begin
   	    if(i_sel == 2'b01)
   	        r_b = i_data;
   	    else
   	        r_b = 1'b0;
	end
	
	//��ѡ���źŵ�ֵΪ10ʱ������������i_data���䵽����·����˿�
    //�������·���Ϊ0
    always @(*)
    begin
   	    if(i_sel == 2'b10)
   	        r_c = i_data;
   	    else
   	        r_c = 1'b0;
	end
	
	//��ѡ���źŵ�ֵΪ11ʱ������������i_data���䵽����·����˿�
    //�������·���Ϊ0
    always @(*)
    begin
   	    if(i_sel == 2'b11)
   	        r_d = i_data;
   	    else
   	        r_d = 1'b0;
	end
    
endmodule

// END OF demux1to4.v FILE ***************************************************



