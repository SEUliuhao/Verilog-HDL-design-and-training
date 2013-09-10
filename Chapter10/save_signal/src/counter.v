//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : count.v
// FUNCTION        : 周期参数化计数器建模
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module counter(
    input I_rst_n,
    input I_clk,
    
    output reg [7 : 0] O_cnt,//当前计数结果
    output reg O_cout //一个时钟周期宽度的进位信号
    );
    
    parameter PERIOD = 8'D15;

//*********************************PROCESS**************************************
// FUNCTION        :根据PERIOD大小实现周期计数功能
//******************************************************************************     
    always @(negedge I_rst_n, posedge I_clk)
    begin
        if(~I_rst_n)
        begin
            O_cout <= 1'b0;
            O_cnt <= 8'd0;
        end
        else
        begin
            if(PERIOD == O_cnt)
            begin
                O_cnt <= 8'd0;
                O_cout <= 1'b1;
            end
            else
            begin
                O_cnt <= O_cnt + 8'd1;
                O_cout <= 1'b0;
            end
        end
    end
endmodule

// END OF count.v FILE *********************************************************
                 
       
            
    
    