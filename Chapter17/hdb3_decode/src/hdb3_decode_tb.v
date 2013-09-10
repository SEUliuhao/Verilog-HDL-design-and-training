//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : hdb3_decode_tb.v
// FUNCTION        : HDB3译码模块测试平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module hdb3_decode_tb();      

    
    reg r_rst_n;
    reg r_clk;
    
    reg r_data;
    wire [1 : 0] w_hdb3_code;
    wire w_data;
    
       
//*********************************PROCESS**************************************
// FUNCTION        :初始化r_rst_n
//******************************************************************************     
    initial
    begin
            r_rst_n = 1'b0;
        #10 r_rst_n = 1'b1; 
    end

//*********************************PROCESS**************************************
// FUNCTION        :初始化r_clk,产生周期为2ns的时钟信号
//******************************************************************************     
    initial
    begin
            r_clk = 1'b0;
        forever
            #1  r_clk = ~r_clk;
    end

//*********************************PROCESS**************************************
// FUNCTION        :产生基带信号
//******************************************************************************     
    initial
    begin
            r_data = 1'b0;
        #10 r_data = 1'b1;    
        forever
        begin
        #2 r_data = 1'b0;
        #10 r_data = 1'b1; 
        #2 r_data = 1'b0;
        #10 r_data = 1'b1; 
        #2 r_data = 1'b0;        
        #10 r_data = 1'b1;
        #2 r_data = 1'b1;         
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :实例化hdb3_code模块
//******************************************************************************     
    hdb3_code I1_hdb3_code(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_data(r_data),
                        .o_hdb3_code(w_hdb3_code)
                      ); 
 
    hdb3_decode I1_hdb3_decode(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_hdb3_code(w_hdb3_code),
                        .o_data(w_data)
                      );                         
endmodule
// END OF hdb3_decode_tb.v FILE *********************************************************
                 
       
            
    
    
