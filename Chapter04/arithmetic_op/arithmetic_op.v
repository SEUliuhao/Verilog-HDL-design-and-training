//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : arithmetic_op.v
// FUNCTION        : 算术操作符应用举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module arithmetic_op
    (
                
    );
    
    //定义两个操作数
    reg [7 : 0] r_a; 
    reg [7 : 0] r_b;
    
    wire [8 : 0] w_sum;
    wire [7 : 0] w_sub;
    wire [15 : 0] w_mul;
    wire [7 : 0] w_quo;
    wire [7 : 0] w_mod;
    wire [31 : 0] w_pow;
    
    assign w_sum = r_a + r_b; //加法操作符
    assign w_sub = r_a - r_b; //减法操作符
    assign w_mul = r_a * r_b; //乘法操作符
    assign w_quo = r_a / r_b; //除法操作符
    assign w_mod = r_a % r_b; //取模操作符
    assign w_pow = r_a ** r_b; //乘方操作符
    
    initial
    begin
            r_a = 8'd7;
            r_b = 8'd3;
        #10 r_a = 8'd10;
            r_b = 8'd2;
        #10 r_a = 8'd10;
            r_b = 8'hx2;
        #10 r_a = 8'd8;
            r_b = 8'hz2;
        #10 r_a = 8'd19;
            r_b = 8'd4;
    end
    
    //打印出仿真结果
    initial $monitor("$time = %d, r_a = %d, r_b = %d, w_sum = %d, w_sub = %d, w_mul = %d, w_quo = %d, w_mod = %d,w_pow = %d",
                        $time, r_a, r_b, w_sum, w_sub, w_mul, w_quo, w_mod,w_pow);
                        
     
endmodule
// END OF arithmetic_op.v FILE ***************************************************




