//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : task_app.v
// FUNCTION        : 任务的调用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module task_app();

    reg [15 : 0] data_one;
    reg [15 : 0] data_two;
    
    reg [4 : 0] num_one;
    reg [4 : 0] num_two;

//计算输入数据1的个数
    task cal_num_one;
        input [15 : 0] data;
        output [4 : 0] num;
        
        integer i, j;
        begin
          i = 0;
          for(j = 0; j < 16; j = j + 1)
            if(data[j])
                i = i + 1;
          
          num = i[4 : 0];
        end    
    endtask
    
    initial
    begin
        data_one = 1;
        data_two = ~data_one;
     #2 data_one = 3;
        data_two = ~data_one;
     #2 data_one = 100;
        data_two = ~data_one;
     #2 data_one = 10001;
        data_two = ~data_one;
    end
    
    initial
    begin
        cal_num_one(data_one, num_one);
        cal_num_one(data_two, num_two);
    #2  cal_num_one(data_one, num_one);
        cal_num_one(data_two, num_two);
    #2  cal_num_one(data_one, num_one);
        cal_num_one(data_two, num_two);
    #2  cal_num_one(data_one, num_one);
        cal_num_one(data_two, num_two);                   
    #2  cal_num_one(data_one, num_one);
        cal_num_one(data_two, num_two);
    end
    
    //打印出仿真结果
    initial $monitor("$time = %d, data_one = %b, num_one = %d, data_two = %b, num_two = %d",
                        $time, data_one, num_one, data_two, num_two);
endmodule
// END OF task_app.v FILE ***************************************************


  
