//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : file_output_task.v
// FUNCTION        : 文件输出任务应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module file_output_task();

    reg [7 : 0] r_data;
    
    //定义文件的句柄
    integer fp_fdisplay;
    integer fp_fwrite;
    integer fp_fstrobe;
    integer fp_fmonitor;
    
    //打开相应的文件
    initial
    begin
        fp_fdisplay = $fopen("fdisplay.vec", "w+");
        fp_fwrite = $fopen("fwrite.vec", "w+");
        fp_fstrobe = $fopen("fstrobe.vec", "w+");
        fp_fmonitor = $fopen("fmonitor.vec", "w+");
    end
    
    //初始化r_data
    initial
    begin
            r_data = 8'd100;            
        #10
            r_data = 8'd150;            
        #20    
            r_data = 8'd80;
        #30    
            r_data = 8'd90;
        #40    
            r_data = 8'd66;
    end
    
    
    //输出信号到相应的文件
    initial
    begin
        $fdisplay(fp_fdisplay, "fdisplay: simulation_time =%4d, r_data = %d", $time, r_data);
        $fwrite(fp_fwrite, "fwrite: simulation_time =%4d, r_data = %b", $time, r_data);
        $fstrobe(fp_fstrobe, "fstrobe: simulation_time=%4d, r_data = %o", $time, r_data);
        $fmonitor(fp_fmonitor, "fmonitor: simulation_time=%4d, r_data = %h", $time, r_data);
        
    end
                             
endmodule
// END OF file_output_task.v FILE ***************************************************


  




