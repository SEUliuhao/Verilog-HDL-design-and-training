`timescale 1ns/1ps
module printtimescale_task();

    initial
    begin
        $printtimescale(printtimescale_task);
        $timeformat(-9, 3, "ns", 6);
        $display("Current time format : %t", $realtime);
        #1.201
        $display("Current time format : %t", $realtime);
    end    
    
endmodule
