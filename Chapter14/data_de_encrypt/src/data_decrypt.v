//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : data_decrypt.v
// FUNCTION        : ���ݽ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module data_decrypt(
    input i_rst_n,
    input i_clk,
    
    input i_code,       //���ܺ�ı�������
    output o_data);      //���ܺ���������

    
    reg [4 : 0] r_shift;
    
    assign o_data = r_shift[0] ^ r_shift[2] ^ i_code;
    
//*********************************PROCESS**************************************
// FUNCTION        :����ͼ14-3�Ľṹ�������ݽ���
//******************************************************************************     
    always @(negedge i_rst_n, posedge i_clk)
    begin
        if(~i_rst_n)
        begin
            r_shift <= 5'b0;
        end
        else
        begin
            r_shift[3 : 0] <= r_shift[4 : 1];
            r_shift[4] <= i_code;
        end
    end
endmodule

// END OF data_decrypt.v FILE *********************************************************
                 
       
            
    
    