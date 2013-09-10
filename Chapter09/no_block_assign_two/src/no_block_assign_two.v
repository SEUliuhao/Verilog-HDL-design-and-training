//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : no_block_assign_two.v
// FUNCTION        : ��������ֵӦ��ʾ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module no_block_assign_two
        (
            input a,
            input b,
            input c,
            input d,
            
            output y        
        );
    
    reg temp1;
    reg temp2;
    reg y_r;
    
    assign y = y_r;
    
    always @(a, b, c, d)
    begin
        temp1 <= a & b;
        temp2 <= d ^ c;
        y_r <= temp1 | temp2;
    end    
endmodule
// END OF no_block_assign_two.v FILE ***************************************************

    
   