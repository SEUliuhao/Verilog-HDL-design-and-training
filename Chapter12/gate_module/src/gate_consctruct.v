//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gate_consctruct.v
// FUNCTION        : 门电路建模，用结构化描述实现
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_consctruct
    (
        input i_a, //定义5个输入信号
        input i_b,
        input i_c,
        input i_d,
        input i_e,
        
        output o_y //定义一个输出信号
    );
    
    //定义门电路之间的连线信号
    wire w_and_o;
    wire w_or1_o;    
    wire w_xor_o;
    
    //根据图12-1的电路结构，按输入到输出的顺序进行实例化门电路模块
    and I_and(w_and_o, i_a, i_b);//实例化与门
    
    or I1_or(w_or1_o, i_c, i_d); //实例化第一个或门
    
    xor I_xor(w_xor_o, w_and_o, w_or1_o); //实例化异或门
    
    or I2_or(o_y, w_xor_o, i_e); //实例化第二个或门，完成建模    
    
endmodule

// END OF gate_consctruct.v FILE ***************************************************



