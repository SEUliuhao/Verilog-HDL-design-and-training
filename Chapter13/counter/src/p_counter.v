//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : p_counter.v
// FUNCTION        : 参数化的计数器，计数周期与计数的位宽数都可以参数化
//                   
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module p_counter
    #(
        parameter PERIOD = 12,//参数化周期
        parameter CNT_WIDTH = 4 //参数化计数器的位宽   
    )
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        
        
        output  o_cout, //脉冲输出
        output [CNT_WIDTH-1 : 0]  o_cnt //计数器当前值输出
    );
    
    //定义输出信号o_data的缓存
    reg [CNT_WIDTH-1 : 0] r_cnt;
    
    assign o_cout = ((PERIOD - 1) == r_cnt)? 1'b1 : 1'b0; //用？：语句实现脉冲信号输出
    assign o_cnt = r_cnt;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 0;
        else
            if((PERIOD - 1) == r_cnt)
                r_cnt <= 0;
            else
                r_cnt <= r_cnt + 1;
	end
    
endmodule
// END OF p_counter.v FILE ***************************************************



