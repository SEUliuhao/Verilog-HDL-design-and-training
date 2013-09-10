//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : spi_ss_clk_generator.v
// FUNCTION        : SPI主端片选与时钟信号产生器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_ss_clk_generator
    (
        input i_reset_n,
        input i_clk, //
        input i_tx_rx, //发送或接收数据信号
        
        output o_spi_ss, //SPI片选信号
        output o_spi_clk, //SPI时钟信号
        output o_spi_busy //SPI忙信号，为高时表示SPI正在发送或接收数据
    );
    
    reg r_spi_ss;
    reg r_spi_clk;
    reg r_spi_busy;
    
    reg r_tx_rx_buf;
    reg r_tx_rx_rising;
    reg [4 : 0] r_spi_ss_cnt;
    
    
    assign o_spi_ss = r_spi_ss;
    assign o_spi_clk = r_spi_clk;
    assign o_spi_busy = r_spi_busy;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_tx_rx_buf <= 1'b0;
            r_tx_rx_rising <= 1'b0;
        end
        else
        begin
            r_tx_rx_buf <= i_tx_rx;
            r_tx_rx_rising <= i_tx_rx & (~r_tx_rx_buf);
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_spi_busy <= 1'b0;
        end
        else
        begin
            if(1'b1 == r_tx_rx_rising)
                r_spi_busy <= 1'b1;
            else if(5'd16 <= r_spi_ss_cnt)
                r_spi_busy <= 1'b0;            
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
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
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_spi_clk <= 1'b1;
        end
        else
        begin
            if(1'b1 == r_spi_busy)
                r_spi_clk <= r_spi_ss_cnt[0];
            else
                r_spi_clk <= 1'b1;            
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_spi_ss <= 1'b1;
        end
        else
        begin
            r_spi_ss <= ~r_spi_busy;          
        end
    end
    	    
endmodule
// END OF spi_ss_clk_generator.v FILE ***************************************************



