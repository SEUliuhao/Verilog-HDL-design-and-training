//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : seq_execute.v
// FUNCTION        : initial��ʼ�����Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seq_execute( 
    input [7 : 0] data_one,
    input [7 : 0] data_two,
    input [7 : 0] data_three,   
    
    output [7 : 0] p_sum_one,
    output [7 : 0] p_sum_two,
    output [7 : 0] p_sum_three,
    
    output reg [7 : 0] s_sum_one,
    output reg [7 : 0] s_sum_two,
    output reg [7 : 0] s_sum_three    
    );    
    
    //��������������ֵ���
    assign p_sum_one = data_one + data_two;
    assign p_sum_two = data_one + data_three;
    assign p_sum_three = data_three + data_two;
 
    //��always������Ҳ������˳��ֵ���   
    always @(data_one, data_two, data_three)
    begin
        s_sum_one = data_one + data_two;
        s_sum_two = data_one + data_three;
        s_sum_three = data_three + data_two;  
    end      
        
endmodule
// END OF seq_execute.v FILE ***************************************************

    
   
