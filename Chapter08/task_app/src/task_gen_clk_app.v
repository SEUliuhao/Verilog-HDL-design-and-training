//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : task_gen_clk_app.v
// FUNCTION        : 任务的调用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module task_gen_clk_app();
    
    reg r_clk;
    

//产生周期为20ns的时钟信号
    task gen_20ns_clk;
        //如果在这里定义 output r_clk,任务调用时只能返回当时时刻的值
        //而不能产生预期的时钟波形
        forever
        begin
                r_clk = 0; //如果对模块全局变量r_clk进行赋值则可以产生时钟波形
            #10 r_clk = 1;
            #10 r_clk = 0;
        end        
    endtask
    
    initial
    begin
      r_clk = 0;
      gen_20ns_clk();     
    end
    
      
    //打印出仿真结果
    initial $monitor("$time = %d, r_clk = %b",  $time, r_clk);
endmodule
// END OF task_gen_clk_app.v FILE ***************************************************


  
