//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : function_app.v
// FUNCTION        : 函数的调用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module function_app();

    reg [15 : 0] data_one;
    reg [15 : 0] data_two;
    
    reg [4 : 0] num_one;
    reg [4 : 0] num_two;
    
    reg clr;

//计算输入数据1的个数
    function automatic [4 : 0] cal_num_one;
        input [15 : 0] data;
        
        
        integer i, j;
        begin
          if(clr == 1'b1) i =0;
          for(j = 0; j < 16; j = j + 1)
            if(data[j])
                i = i + 1;
          
          cal_num_one = i[4 : 0];
        end    
    endfunction
    
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
        clr = 1'b1;
        num_one = cal_num_one(data_one);
        num_two = cal_num_one(data_two);
        clr = 1'b0;
    #2  num_one = cal_num_one(data_one);
        num_two = cal_num_one(data_two);
    #2  num_one = cal_num_one(data_one);
        num_two = cal_num_one(data_two);
    #2  num_one = cal_num_one(data_one);
        num_two = cal_num_one(data_two);                   
    #2  num_one = cal_num_one(data_one);
        num_two = cal_num_one(data_two);
    end
    
    //打印出仿真结果
    initial $monitor("$time = %d, data_one = %b, num_one = %d, data_two = %b, num_two = %d",
                        $time, data_one, num_one, data_two, num_two);
                        
endmodule
// END OF function_app.v FILE ***************************************************


  
