//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : assign_app_two.v
// FUNCTION        : 演示应用assign连续赋值语句实现双向端口的操作
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************

module assign_app_two(
    input din, //数据输入，往双向端口写的数据
    input wr,  //双向端口的读写控制信号,低电平为写，高电平为读
    
    output dout, //数据输出，从双向端口读到的数据
    
    inout data   //双向端口
    );
    
//应用assign连续赋值语句实现双端口的读写控制
//往双端口写数据
    assign data = (~wr)? din : 1'bz;
//从端口读数据
    assign dout = data;
//对从双向端口读出的数据需要根据wr信号再做一些判断。
//只有在wr为高的时候dout值才是双向端口data的值，否则dout值为din的值

endmodule
// END OF assign_app_two.v FILE *********************************************************     
