//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : forever_app.v
// FUNCTION        : forѭ�����Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module forever_app(        
        );    
    reg clk;
    
   
    initial 
    begin
            clk = 1'b0;            
            
        #1   forever
                #1  clk = ~clk; //����һ������Ϊ2ns��ʱ���ź�
    end    
    
endmodule
// END OF forever_app.v FILE ***************************************************

    
   