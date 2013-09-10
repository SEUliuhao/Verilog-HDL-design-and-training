//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : shift_reg_tb.v
// FUNCTION        : shift_reg.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module shift_reg_tb;

    //���弤��Դ
    reg r_clk;
    reg r_d;
    
    
        
    //��������ź�����
    wire w_q;
    wire [7 : 0] w_data;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    shift_reg  I_shift_reg
        (
            .i_clk(r_clk),   
            .i_d(r_d),
            .o_q(w_q),
            .o_data(w_data)
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
        r_d = 1'b0; 
        forever
            #20 r_d = random(1) % 2; //ͨ�����ϵͳ����������һ��0��1���������
    end
endmodule

// END OF shift_reg_tb.v FILE ***************************************************



