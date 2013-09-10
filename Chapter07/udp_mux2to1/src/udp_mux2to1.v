//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : udp_mux2to1.v
// FUNCTION        : UDP实现2选1原语
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
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

    
   