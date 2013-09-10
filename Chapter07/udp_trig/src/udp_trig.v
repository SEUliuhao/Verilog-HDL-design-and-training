//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : udp_trig.v
// FUNCTION        : UDP实现D触发器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************


primitive udp_trig(q, clk, d);       
    
    output q;
    
    input clk;
    input d;
    
    initial
        q = 0;
    
    table
        
    //  clk     d    :   q(current)  :   q(next)
        r       0    :   ?           :   0      //时钟上升沿数据更新
        r       1    :   ?           :   1
        (0x)    1    :   1           :   1
        (0x)    0    :   0           :   0
        n       ?    :   ?           :   -      //忽略时钟下降沿
        ?       (??) :   ?           :   -      //忽略时钟电平稳定时的数据变化
     endtable
endprimitive
    
// END OF udp_trig.v FILE ***************************************************

    
   