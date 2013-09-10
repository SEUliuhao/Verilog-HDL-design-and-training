//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : timer.v
// FUNCTION        : 计数器，实现0到9的计数，当计数到9时，
//                   输出一个时钟周期的脉冲，计数清零重要开始计数
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module timer
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        
        output [3 : 0] o_hour_h,
        output [3 : 0] o_hour_l,
        output [3 : 0] o_minut_h,
        output [3 : 0] o_minut_l,
        output [3 : 0] o_second_h,
        output [3 : 0] o_second_l
    );
    
    //定义输出信号o_data的缓存
    reg [3 : 0] r_hour_h,
    reg [3 : 0] r_hour_l,
    reg [3 : 0] r_minut_h,
    reg [3 : 0] r_minut_l,
    reg [3 : 0] r_second_h,
    reg [3 : 0] r_second_l
    
    
    assign o_hour_h = r_hour_h;
    assign o_hour_l = r_hour_l;
    assign o_minu_h = r_minu_h;
    assign o_minu_l = r_minu_l;
    assign o_second_h = r_second_h;
    assign o_second_l = r_second_l;    
    
    
    //
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_second_l <= 4'd0;
        else
            if(4'd9 == r_second_l)
                r_second_l <= 4'd0;
            else
                r_second_l <= r_second_l + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_minu_l <= 4'd0;
        else
            if(4'd9 == r_second_h && 4'd5 == r_second_h)
                if(4'd9 == r_minu_l)
                    r_minu_l <= 4'd0;
                elsif
                    r_minu_l <= r_minu_l + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_minu_h <= 4'd0;
        else
            if(4'd9 == r_second_h && 4'd5 == r_second_h && 4'd9 == r_minu_l)
                if(4'd5 == r_minu_h)
                    r_minu_h <= 4'd0;
                elsif
                    r_minu_h <= r_minu_h + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_hour_l <= 4'd0;
        else
            if(4'd9 == r_second_h && 4'd5 == r_second_h && 4'd9 == r_minu_l && 4'd5 == r_minu_h)
                if(4'd9 == r_hour_l)
                    r_hour_l <= 4'd0;
                elsif
                    r_hour_l <= r_hour_l + 4'd1;
	end
	
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_hour_h <= 4'd0;
        else
            if(4'd9 == r_second_h && 4'd5 == r_second_h && 4'd9 == r_minu_l && 4'd5 == r_minu_h && 4'd3 == r_hour_l)
            begin
                if(4'd2 == r_hour_h )
                    r_hour_h <= 4'd0;
            end
            else 
            begin
                if(4'd9 == r_second_h && 4'd5 == r_second_h && 4'd9 == r_minu_l && 4'd5 == r_minu_h && 4'd9 == r_hour_l)
                    r_hour_h <= r_hour_h + 4'd1;
            end
	end

    
endmodule
// END OF timer.v FILE ***************************************************



