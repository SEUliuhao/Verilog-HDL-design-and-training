//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : shift_reg_tb.v
// FUNCTION        : shift_reg.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module shift_reg_tb;

    //定义激励源
    reg r_clk;
    reg r_d;
    
    
        
    //定义输出信号连线
    wire w_q;
    wire [7 : 0] w_data;
    
    //实例化设计模块，采用端口名称映射方式
    shift_reg  I_shift_reg
        (
            .i_clk(r_clk),   
            .i_d(r_d),
            .o_q(w_q),
            .o_data(w_data)
        );
        
    //产生时钟激励信号
    initial
    begin
        r_clk = 1'b0;    
        forever
           #10 r_clk = ~r_clk;
    end
      
    initial
    begin
        r_d = 1'b0; 
        forever
            #20 r_d = random(1) % 2; //通过随机系统函数，产生一个0、1的随机序列
    end
endmodule

// END OF shift_reg_tb.v FILE ***************************************************



