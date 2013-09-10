//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : display_write_task.v
// FUNCTION        : 显示与写任务应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module display_write_task();

    reg [7 : 0] r_data;
    reg [15*8 : 0] r_str;
    
    initial
    begin
        r_data = 8'd100;
        r_str = "I love Verilog!";
    end
     
    initial
    begin
        //显示任务之后会有行结束符
        $display(r_data); //没有格式说明按默认十进制显示
        $displayb(r_data); //没有格式说明按默认二进制显示
        $displayo(r_data); //没有格式说明按默认八进制显示
        $displayh(r_data); //没有格式说明按默认十六进制显示
        $display("r_data = %o", r_data); //有格式说明按八进制显示
        $displayb("r_data = %d", r_data); //有格式说明按十进制显示
        $displayo("r_data = %h", r_data); //有格式说明按十六进制显示
        $displayh("r_data = %b", r_data); //有格式说明按十六进制显示
        
        //写任务之后没有行结束符
        $write(r_data); //没有格式说明按默认十进制显示
        $writeb(r_data); //没有格式说明按默认二进制显示
        $writeo(r_data); //没有格式说明按默认八进制显示
        $writeh(r_data); //没有格式说明按默认十六进制显示
        $write("r_data = %o", r_data); //有格式说明按八进制显示
        $writeb("r_data = %d", r_data); //有格式说明按十进制显示
        $writeo("r_data = %h", r_data); //有格式说明按十六进制显示
        $writeh("r_data = %b \n", r_data); //有格式说明按十六进制显示，为了区别下面的显示加了换行符
        
        $display("r_str = %s \n, \t, \\, \", \ooo, %%", r_str, 200); //显示字符串与转义字符
        $write("r_str = %s \n, \t, \\, \", \ooo, %%", r_str, 200);  //写字符串与转义字符
    end   
                      
endmodule
// END OF display_write_task.v FILE ***************************************************


  

