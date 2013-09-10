//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : adder_4bit.v
// FUNCTION        : 1位全加器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************


module adder_4bit(
    input [3 : 0] din_one,  //第一个加数
    input [3 : 0] din_two,  //第二个加数
    input cin,              //进位输入
    
    output [3 : 0] sum,     //和输出
    output cout             //进位输出
    );
    
    wire cin_0bit;          //低位加法的进位输出

//实例化adder_1bit实现低位加法    
    adder_2bit U1_low_bit(
        .din_one(din_one[1 : 0]),
        .din_two(din_two[1 : 0]),
        .cin(cin),
        .sum(sum[1 : 0]),
        .cout(cin_0bit)
        );
    
//实例化adder_1bit实现高位加法       
    adder_2bit U2_high_bit(
        .din_one(din_one[3 : 2]),
        .din_two(din_two[3 : 2]),
        .cin(cin_0bit),
        .sum(sum[3 : 2]),
        .cout(cout)
        );
        

//利用模块实例化语句实现2位全加操作    
endmodule
// END OF adder_4bit.v FILE ***************************************************

    
   