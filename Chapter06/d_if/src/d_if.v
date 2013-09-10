//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : d_if.v
// FUNCTION        : ����֧if����ѡ�����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_if( 
    input din_sel,
    input din_one,  
    input din_two,  
    
    output reg dout
    
    );    
    

    always @(din_sel, din_one,din_two)
    begin
        if(din_sel)
            dout = din_one;
         else
            dout = din_two;
    end    

        
endmodule
// END OF d_if.v FILE ***************************************************

    
   
