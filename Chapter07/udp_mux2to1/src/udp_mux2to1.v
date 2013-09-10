//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : udp_mux2to1.v
// FUNCTION        : UDPʵ��2ѡ1ԭ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


primitive udp_mux2to1(y, a, b, sel);       
    
    output y;
    
    input a;
    input b;
    input sel;
    
    
    table
        
    //  a   b   sel :   y
        0   ?   1   :   0
        1   ?   1   :   1
        ?   0   1   :   0
        ?   1   1   :   1  
        0   0   x   :   0
        1   1   x   :   1         
     endtable
endprimitive
    
endmodule
// END OF udp_mux2to1.v FILE ***************************************************

    
   