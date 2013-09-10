//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : count.v
// FUNCTION        : ���ڲ�������������ģ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module counter(
    input I_rst_n,
    input I_clk,
    
    output reg [7 : 0] O_cnt,//��ǰ�������
    output reg O_cout //һ��ʱ�����ڿ�ȵĽ�λ�ź�
    );
    
    parameter PERIOD = 8'D15;

//*********************************PROCESS**************************************
// FUNCTION        :����PERIOD��Сʵ�����ڼ�������
//******************************************************************************     
    always @(negedge I_rst_n, posedge I_clk)
    begin
        if(~I_rst_n)
        begin
            O_cout <= 1'b0;
            O_cnt <= 8'd0;
        end
        else
        begin
            if(PERIOD == O_cnt)
            begin
                O_cnt <= 8'd0;
                O_cout <= 1'b1;
            end
            else
            begin
                O_cnt <= O_cnt + 8'd1;
                O_cout <= 1'b0;
            end
        end
    end
endmodule

// END OF count.v FILE *********************************************************
                 
       
            
    
    