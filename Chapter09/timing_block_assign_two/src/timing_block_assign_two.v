//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : timing_block_assign_two.v
// FUNCTION        : ʱ���·��������ֵӦ��ʾ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module timing_block_assign_two
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
        y_r = temp_two;
        temp_two = temp_one;
        temp_one = a;
    end    
endmodule
// END OF timing_block_assign_two.v FILE ***************************************************

    
   