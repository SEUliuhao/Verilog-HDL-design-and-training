//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : timing_block_assign.v
// FUNCTION        : ʱ���·��������ֵӦ��ʾ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module timing_block_assign
        (
            input clk,
            input a, 
            
            output y        
        );
    
    reg temp1;
    reg temp2;
    reg y_r;

    assign y = y_r;
    
    always @(posedge clk)
    begin
        temp1 = a;
        temp2 = temp1;
        y_r = temp2;        
    end    
endmodule
// END OF timing_block_assign.v FILE ***************************************************

    
   