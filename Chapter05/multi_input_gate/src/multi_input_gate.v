//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : multi_input_gate.v
// FUNCTION        : 多输入门电路原语模块的实例化语句举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module multi_input_gate(
    input da,
    input db,
    input dc,

    
    output d_and,
    output d_nand,
    output d_or,
    output d_nor,
    output d_xor,
    output d_xnor
    );
    
    //实例化原语多输入与门模块
    and U1_and(d_and, da, db, dc);
    //实例化原语多输入与非门模块
    nand U2_nand(d_nand, da, db, dc);
    //实例化原语多输入或门模块
    or U1_or(d_or, da, db, dc);
    //实例化原语多输入与或非门模块
    nor U2_nor(d_nor, da, db, dc);
    //实例化原语多输入异或门模块
    xor U1_xor(d_xor, da, db, dc);
    //实例化原语多输入同或门模块
    xnor U2_xnor(d_xnor, da, db, dc);  

endmodule
// END OF multi_input_gate.v FILE **********************************************

    
   