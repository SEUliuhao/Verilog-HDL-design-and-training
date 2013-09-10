//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : strobe_task.v
// FUNCTION        : 选通监测任务应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module strobe_task();

    reg [7 : 0] r_data;
    reg [15*8 : 0] r_str;
    
    initial
    begin
            r_data = 8'd100;
            r_str = "I love Verilog!";
            $display("display: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            $strobe("strobe: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            
            r_data = 8'd10;
            r_str = "I love FPGA!";
            $displayb("displayb: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            $strobeb("strobeb: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
        #10
            r_data = 8'd150;
            r_str = "I love Verilog!";
            $displayo("displayo: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            $strobeo("strobeo: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            
            r_data = 8'd80;
            r_str = "I love FPGA!";
            $displayh("strobeh: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
            $strobeh("strobeb: simulaion time: %d : %d, %b, %s", $time, r_data, r_data, r_str);
    end
     
                         
endmodule
// END OF strobe_task.v FILE ***************************************************


  


