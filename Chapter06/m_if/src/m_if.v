//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : m_if.v
// FUNCTION        : ����֧if����ѡ�����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module m_if( 
    input [1 : 0] din_sel,
    input din_one,  
    input din_two,
    input din_three,  
    
    output reg dout_one,
    output reg dout_two
    
    );    
    

    always @(din_sel, din_one,din_two)
    begin
        if(din_sel[0])
            dout_one = din_one;
        else if(din_sel[1])
            dout_one = din_two;        
    end    

    always @(din_sel, din_one,din_two,din_three)
    begin
        if(din_sel[0])
            dout_two = din_one;
        else if(din_sel[1])
            dout_two = din_two; 
        else
            dout_two = din_three;       
    end  
      
endmodule
// END OF m_if.v FILE ***************************************************

    
   
