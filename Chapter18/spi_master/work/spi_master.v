//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : spi_master.v
// FUNCTION        : SPI主端数据通信模块
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************

`timescale 1ns/1ns

module spi_master
    (
        input i_rst_n,
        input i_clk, //这个时钟是uart波特率的16倍

        input i_spi_tx_rx, //启动SPI发送或接收数据
        input [7 : 0] i_tx_data, //8位发送数据
        output o_tx_done , //发送数据完成
        output [7 : 0] o_rx_data, //8位接收数据
        output o_rx_done, //接收数据完成
        
        input i_spi_cs, //SPI片选信号，低有效
        input i_spi_clk, //SPI时钟信号
        input i_spi_miso, //SPI主端输入，从端输出数据信号
        output o_spi_mosi, //SPI主端输出，从端输入数据信号        
        output o_spi_busy //SPI忙信号，为高时表示SPI正在发送或接收数据
    );
    
    
    reg r_spi_ss;
    reg r_spi_clk;
    reg r_spi_busy;
    
    reg r_spi_tx_rx_buf;
    reg r_spi_tx_rx_rising;
    reg [4 : 0] r_spi_ss_cnt;
    
    reg [4 : 0] r_div_cnt;  //分频计数器
    reg r_div_clk;          //分频时钟
    
    
    assign o_spi_ss = r_spi_ss;
    assign o_spi_clk = r_spi_clk;
    assign o_spi_busy = r_spi_busy;
    
//*********************************PROCESS**************************************
// FUNCTION        :实例化SPI从端模块spi_slave
//******************************************************************************     
    spi_slave I1_spi_slave(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_tx_data(r_stx_data),
                        .o_tx_done(w_tx_done),
                        .o_rx_data(w_srx_data),
                        .o_rx_done(w_rx_done),
                        .i_spi_cs(r_spi_cs),
                        .i_spi_clk(r_spi_clk),
                        .i_spi_mosi(i_spi_miso),
                        .o_spi_miso(w_spi_mosi)
                      );  
                      
    always @(posedge i_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_div_cnt <= 4'b0;
            r_div_clk <= 1'b0;
        end
        else
        begin
            r_div_cnt <= r_div_cnt + 4'b1;
            r_div_clk <= r_div_cnt[3];
        end
    end
    
    always @(posedge r_div_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_spi_tx_rx_buf <= 1'b0;
            r_spi_tx_rx_rising <= 1'b0;
        end
        else
        begin
            r_spi_tx_rx_buf <= i_spi_tx_rx;
            r_spi_tx_rx_rising <= i_spi_tx_rx & (~r_spi_tx_rx_buf);
        end
    end
    
    always @(posedge r_div_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_spi_busy <= 1'b0;
        end
        else
        begin
            if(1'b1 == r_spi_tx_rx_rising)
                r_spi_busy <= 1'b1;
            else if(5'd16 <= r_spi_ss_cnt)
                r_spi_busy <= 1'b0;            
        end
    end
    
    always @(posedge r_div_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_spi_ss_cnt <= 5'b0;
        end
        else
        begin
            if(1'b1 == r_spi_busy)
                r_spi_ss_cnt <= r_spi_ss_cnt + 5'b1; 
            else
                r_spi_ss_cnt <= 5'b0;           
        end
    end
    
    always @(posedge r_div_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_div_clk <= 1'b1;
        end
        else
        begin
            if(1'b1 == r_spi_busy)
                r_div_clk <= r_spi_ss_cnt[0];
            else
                r_div_clk <= 1'b1;            
        end
    end
    
    always @(posedge r_div_clk, negedge r_rst_n) 
    begin
        if(1'b0 == r_rst_n)
        begin
            r_spi_ss <= 1'b1;
        end
        else
        begin
            r_spi_ss <= ~r_spi_busy;          
        end
    end
    	    
endmodule
// END OF spi_master.v FILE ***************************************************



