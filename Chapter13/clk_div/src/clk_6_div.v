//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : clk_6_div.v
// FUNCTION        : 对输入时钟进行6分频
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module clk_6_div
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        
        
        output  o_div_clk //脉冲输出
    );
    
    //定义输出信号o_data的缓存
    reg [1 : 0] r_cnt;
    reg r_div_clk;
    assign o_div_clk = r_div_clk;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 2'd0;
        else
            if(2'd2 == r_cnt)
                r_cnt <= 2'd0;
            else
                r_cnt <= r_cnt + 2'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_div_clk <= 1'b0;
        else
            if(2'd2 == r_cnt)
                r_div_clk <= ~r_div_clk;
	end
    
endmodule
// END OF clk_6_div.v FILE ***************************************************



