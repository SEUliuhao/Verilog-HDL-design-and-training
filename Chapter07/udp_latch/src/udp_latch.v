//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : udp_latch.v
// FUNCTION        : UDPʵ�ֵ�ƽ������������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


primitive udp_latch(q, data, enable);       
    
    output q;
    
    input data;
    input enable;
    
    initial
        q = 0;
    
    table
        
    //  data    enable  :   q(current)  :   q(next)
        ?       0       :   ?           :   -
        0       1       :   ?           :   0
        1       1       :   ?           :   1

     endtable
endprimitive
    
endmodule
// END OF udp_latch.v FILE ***************************************************

    
   