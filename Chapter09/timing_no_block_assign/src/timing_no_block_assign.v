//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : timing_no_block_assign.v
// FUNCTION        : ʱ���·��������ֵӦ��ʾ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module timing_no_block_assign
        (
            input clk,
            input a, 
            
            output y        
        );
    
    reg temp_one;
    reg temp_two;
    reg y_r;

    assign y = y_r;
    
    always @(posedge clk)
    begin
        temp_one <= a;
        temp_two <= temp_one;
        y_r <= temp_two;        
    end    
endmodule
// END OF timing_no_block_assign.v FILE ***************************************************

    
   