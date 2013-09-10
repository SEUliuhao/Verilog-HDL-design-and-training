//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : s_if.v
// FUNCTION        : ����֧if����ѡ�����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module s_if( 
    input clk,
    input din_one,
    input din_two,    
    
    output reg dout_s, 
    output reg dout_mone, 
    output reg dout_mtwo    
    );    
    
    //��֧��ֻ��һ��˳�����
    always @(posedge clk)
    begin
        if(din_one)
            dout_s <= din_two;
    end
    
    //��֧�ڶ���˳�����
    always @(posedge clk)
    begin
        if(din_one)
        begin
            dout_mone = ~din_two;
            dout_mtwo = din_two;
        end
    end
        
endmodule
// END OF s_if.v FILE ***************************************************

    
   
