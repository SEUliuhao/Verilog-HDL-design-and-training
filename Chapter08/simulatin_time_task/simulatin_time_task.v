`timescale 1ns/1ps
module simulation_time_task();

    initial
    begin
        $timeformat(-9, 3, "ns", 6);
        #1
        $display("Current time format(time) : %t", $time);
        $display("Current time format(stime) : %t", $stime);
        $display("Current time format(realtime) : %t", $realtime);
        #3.201
        $display("Current time format(time) : %t", $time);
        $display("Current time format(stime) : %t", $stime);
        $display("Current time format(realtime) : %t", $realtime);
    end    
    
endmodule

