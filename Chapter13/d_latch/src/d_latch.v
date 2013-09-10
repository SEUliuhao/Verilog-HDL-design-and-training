//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : d_latch.v
// FUNCTION        : 锁存器建模
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_latch
    (
        input i_enable, //使能信号
        input i_d, //数据输入 
        
        output  o_q //锁存信号输出
    );
    
    //定义输出信号o_data的缓存
    reg  r_q;
    
    assign o_q = r_q; //通过assign连续赋值语句更新编码输出
   
    //对输入信号进行锁存
    always @(i_enable, i_d) //这里为电平敏感事件
    begin 
        if(1'b1 == i_enable)                  
   	        r_q <= i_d; //时序电路建模，采用非阻塞赋值语句
	end
    
endmodule
// END OF d_latch.v FILE ***************************************************



