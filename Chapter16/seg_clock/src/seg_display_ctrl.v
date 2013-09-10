//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : seg_display_ctrl.v
// FUNCTION        : 控制1组8个数码管的显示,显示效果如下，分别是时-分-秒
//                    _  _   _  _   _  _  
//                   |_||_|_|_||_|_|_||_|
//                   |_||_| |_||_| |_||_| 
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seg_display_ctrl
    (
        input r_rst_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        input [3 : 0] i_hour_h,     //时钟高位
        input [3 : 0] i_hour_l,     //时钟低位
        input [3 : 0] i_minut_h,    //分钟高位
        input [3 : 0] i_minut_l,    //分钟低位
        input [3 : 0] i_second_h,   //秒钟高位
        input [3 : 0] i_second_l,   //秒钟低位        
        
        
        output [7 : 0] o_seg_control, //脉冲输出
        output [7 : 0] o_seg_display //计数器当前值输出
    );
    
    //定义输出信号o_data的缓存
    reg [3 : 0] r_display_data;
    reg [2 : 0] r_cnt;
    reg [7 : 0] r_seg_control;
    wire w_dp;
    wire [6 : 0] w_seg_display;
    
    seg_display  I_seg_display
        (
            .i_data(r_display_data), 
            .i_dp(1'b1),           
            .o_seg(w_seg_display[6:0]),
            .o_dp(w_dp)
        );
    assign o_seg_display = {w_dp, w_seg_display};
    assign o_seg_control = r_seg_control;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
            r_cnt <= 3'd0;
        else
            r_cnt <= r_cnt + 3'd1;
	end
	
	always @(*) 
    begin
        case(r_cnt)
            3'd0: r_display_data =  i_second_l; 
            3'd1: r_display_data =  i_second_h; 
            3'd2: r_display_data =  4'hA;           //显示‘-’
            3'd3: r_display_data =  i_minut_l; 
            3'd4: r_display_data =  i_minut_h; 
            3'd5: r_display_data =  4'hA;           //显示‘-’
            3'd6: r_display_data =  i_hour_l; 
            3'd7: r_display_data =  i_hour_h; 
            default: r_display_data =  4'hA;        //显示‘-’
        endcase
	end
	
	always @(*) 
    begin
        case(r_cnt)
            3'd0: r_seg_control = 8'b01111111;
            3'd1: r_seg_control = 8'b10111111;
            3'd2: r_seg_control = 8'b11011111;
            3'd3: r_seg_control = 8'b11101111; 
            3'd4: r_seg_control = 8'b11110111;
            3'd5: r_seg_control = 8'b11111011;
            3'd6: r_seg_control = 8'b11111101;
            3'd7: r_seg_control = 8'b11111110;
            default: r_seg_control = 8'b11111111;
        endcase
	end
    
endmodule
// END OF seg_display_ctrl.v FILE ***************************************************



