//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : gen_special.v
// FUNCTION        : �����ض����е�ֵ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gen_special;  //����ƽ̨����Ҫ�˿ڶ���

    reg a;
    
    initial
    begin
            a = 0;
        #10 a = 1;
        #20 a = 0;
        #5  a = 1;
        #15 a = 0;
    end
endmodule
