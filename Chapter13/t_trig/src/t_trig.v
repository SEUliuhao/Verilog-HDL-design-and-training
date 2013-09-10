//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : t_trig.v
// FUNCTION        : 锁存器建模
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module t_trig
    (
        input i_clk, //时钟能信号
        input i_t, //数据输入 
        
        output  o_q, //jk触发器正输出
        output  o_qb //jk触发器负输出
    );
    
    //定义输出信号o_data的缓存
    reg  r_q;
    
    assign o_q = r_q; //通过assign连续赋值语句更新编码输出
    assign o_qb = ~r_q;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk) 
    begin 
        if(1'b1 == i_t)
            r_q <= ~r_q;
        else
            r_q <= r_q;              
	end
    
endmodule
// END OF t_trig.v FILE ***************************************************



