//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : seq_assign.v
// FUNCTION        : ˳��ֵ����Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seq_assign( 
    input din_one,
    input din_two,
    
    output reg db_one, //����˳��ֵ���
    output reg db_two, //����˳��ֵ���
    output reg d_one,  //������˳��ֵ���
    output reg d_two   //������˳��ֵ���
    
    );    
    
    //����˳��ֵ���Ӧ��
    always @(din_one, din_two)
    begin
        db_one = din_one ^ din_two;
        db_two = din_one & din_two;
    end
    
    //������˳��ֵ���Ӧ��
    always @(din_one, din_two)
    begin
        d_one = din_one ^ din_two;
        d_two = din_one & din_two;
    end
        
endmodule
// END OF seq_assign.v FILE ***************************************************

    
   
