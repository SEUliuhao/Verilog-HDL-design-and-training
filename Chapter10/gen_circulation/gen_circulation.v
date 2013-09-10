//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : gen_circulation.v
// FUNCTION        : ����ѭ���ź�
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gen_circulation;  //����ƽ̨����Ҫ�˿ڶ���

    reg a;
    reg b;
    reg c;
    
    
    initial
    begin
            a = 0;
        forever
            #2 a = ~a;            
    end
    
    initial
            b = 0;                 
    
    always 
        #4 b = ~b;
        
    initial
    begin
            c = 0;
        forever
        begin
            #1 c= 1; 
            #2 c= 0;
            #3 c= 1;           
            #4 c= 0;
        end
    end
    
endmodule

// END OF gen_circulation.v FILE ***************************************************



