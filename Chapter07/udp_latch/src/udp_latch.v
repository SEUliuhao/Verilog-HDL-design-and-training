//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : udp_latch.v
// FUNCTION        : UDP实现电平触发的锁存器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
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

    
   