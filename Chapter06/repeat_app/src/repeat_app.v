//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : repeat_app.v
// FUNCTION        : forѭ�����Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


module repeat_app(        
        );
    
    integer i;
    integer num;
    reg [7 : 0] data;
   
    initial 
    begin
            i = 0;
            num = 0;
            data = 8'b01010101;
            
        #1   i = 0;
            num = 0;
            data = 8'b11001110'
    end
   
    alwaya(*)
    begin
        #1 repeat(8);
           begin
                if(data[i] == 1'b1)
                    num = num + 1;
                
                i = i + 1;                    
           end
    end
    
    
endmodule
// END OF repeat_app.v FILE ***************************************************

    
   