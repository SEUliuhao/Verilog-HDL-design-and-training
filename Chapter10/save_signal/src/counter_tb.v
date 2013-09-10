//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : count_tb.v
// FUNCTION        : 计数器的仿真平台，信号保存的演示
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

`timescale 1ns/1ns

module counter_tb();
    
    reg rst_n;
    reg clk;
    
    wire [7 : 0] cnt;
    wire cout;
    
    integer fp_fmonitor; //定义一个文件句柄

//实例化计数器    
    counter I1_counter(
        .I_rst_n(rst_n),
        .I_clk(clk),
        .O_cnt(cnt),
        .O_cout(cout)
        );
    
    //初始化文件句柄
    initial
        fp_fmonitor = $fopen("fmonitor.vec", "w+"); 


    //初始化信号
    initial
    begin
        clk = 1'b0;
        rst_n = 1'b0;
        #4 rst_n = 1'b1;
    end
    
    //产生时钟信号
    always #1 clk <= ~clk;

    //打印与保存相关信号
    initial
    begin
        $monitor("simulation time:%d, cnt:%d,   cout:%d", $time, cnt, cout);
        $fmonitor(fp_fmonitor, "simulation time:%d, cnt:%d,   cout:%d", $time, cnt, cout);
    end
    
endmodule
// END OF counter_tb.v FILE ****************************************************


        
        