//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : initial_app.v
// FUNCTION        : initial��ʼ�����Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module initial_ap(        
    );
    reg clk_one;
    reg clk_two;
    reg sig_one;
    
    initial
    begin
        clk_one = 0;
        #2 clk_one = 1;
        #2 clk_one = 0;
        #2 clk_one = 1;
        #2 clk_one = 0;
    end
    
        initial
    begin
        clk_two = 0;
        #5 clk_two = 1;
        #5 clk_two = 0;
        #5 clk_two = 1;
        #5 clk_two = 0;
    end
    
    initial
    begin
        sig_one = 1;       
    end
            
    
    
endmodule
// END OF initial_ap.v FILE ***************************************************

    
   
