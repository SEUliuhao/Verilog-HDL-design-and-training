//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : d_trig_tb.v
// FUNCTION        : coder4to10.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_trig_tb;

    //���弤��Դ
    reg r_clk;
    reg r_clr;
    reg r_enable;
    reg r_d;
    
    
        
    //��������ź�����
    wire w_q;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    d_trig  I_d_trig
        (
            .i_clk(r_clk), 
            .i_clr(r_clr),
            .i_enable(r_enable),  
            .i_d(r_d),
            .o_q(w_q)
        );
        
    //����ʱ�Ӽ����ź�
    initial
    begin
            r_clk = 1'b0;    
            forever
               #10 r_clk = ~r_clk;
    end
    
    initial
    begin
            r_clr = 1'b1;    
        #15 r_clr = 1'b0;
    end
    
    initial
    begin
            r_enable = 1'b1;    
        #20 r_enable = 1'b0;
        #20 r_enable = 1'b1;
    end
     
    initial
    begin
            r_d = 1'b0; 
        repeat(10)
        begin
            #2  r_d = 1'b1;      
            #2  r_d = 1'b0; 
            #4  r_d = 1'b1; 
            #4  r_d = 1'b0; 
            #6  r_d = 1'b1; 
            #2  r_d = 1'b1;    
            #2  r_d = 1'b0;      
            #2  r_d = 1'b1; 
            #4  r_d = 1'b0; 
            #4  r_d = 1'b0; 
            #6  r_d = 1'b1; 
            #2  r_d = 1'b1;  
        end       
    end
endmodule

//module d_trig_tb;
//
//    //���弤��Դ
//    reg r_clk;
//    reg r_d;
//    
//    
//        
//    //��������ź�����
//    wire w_q;
//    
//    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
//    d_trig  I_d_trig
//        (
//            .i_clk(r_clk),   
//            .i_d(r_d),
//            .o_q(w_q)
//        );
//        
//    //����ʱ�Ӽ����ź�
//    initial
//    begin
//            r_clk = 1'b0;    
//            forever
//               #10 r_clk = ~r_clk;
//    end
//      
//    initial
//    begin
//            r_d = 1'b0; 
//        repeat(10)
//        begin
//            #2  r_d = 1'b1;      
//            #2  r_d = 1'b0; 
//            #4  r_d = 1'b1; 
//            #4  r_d = 1'b0; 
//            #6  r_d = 1'b1; 
//            #2  r_d = 1'b1;    
//            #2  r_d = 1'b0;      
//            #2  r_d = 1'b1; 
//            #4  r_d = 1'b0; 
//            #4  r_d = 1'b0; 
//            #6  r_d = 1'b1; 
//            #2  r_d = 1'b1;  
//        end       
//    end
//endmodule



// END OF d_trig_tb.v FILE ***************************************************


