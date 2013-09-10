//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : case_app.v
// FUNCTION        : ����֧if����ѡ�����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module case_app( 
    input [1 : 0] case_sel,
    input din_one,  
    input din_two,      
    
    output reg dout    
    );    
    
//case����ѡ�����
//����case_sel��ֵ��ѡ��ͬ���߼�����
    always @(case_sel, din_one,din_two)
    begin
        case(case_sel)
            2'b00: 
                dout = din_one & din_two;
            2'b01: 
                dout = din_one | din_two;
            2'b10: 
                dout = din_one ^ din_two;
            2'b11: 
                dout = din_one ~^ din_two;
            default: 
                dout = din_one & din_two;
        endcase           
    end  

      
endmodule
// END OF case_app.v FILE ***************************************************

  