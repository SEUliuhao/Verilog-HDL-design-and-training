//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : spi_slave.v
// FUNCTION        : SPI从端控制器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_slave
    (
        input i_rst_n,
        input i_clk, //这个时钟是uart波特率的16倍

        input [7 : 0] i_tx_data, //8位发送数据
        output o_tx_done , //发送数据完成
        output [7 : 0] o_rx_data, //8位接收数据
        output o_rx_done, //接收数据完成
        
        input i_spi_cs, //SPI片选信号，低有效
        input i_spi_clk, //SPI时钟信号
        input i_spi_mosi, //SPI主端输出，从端输入数据信号
        output o_spi_miso //SPI主端输入，从端输出数据信号
    );
    
    
    reg [7 : 0] r_rx_data;   
        
    reg [7 : 0] r_tx_shift;
    reg [7 : 0] r_rx_shift;
    
    reg r_spi_clk_buf;
    reg r_spi_clk_rising;
    reg r_spi_clk_falling;
    
    reg r_spi_cs_buf;
    reg r_spi_cs_rising;
    reg r_spi_cs_falling;
    reg r_spi_cs_rising_buf;

    
    
    assign o_spi_miso = (i_spi_cs == 1'b0)? r_tx_shift[7] : 1'bz;
    assign o_rx_done = r_spi_cs_rising_buf;
    assign o_tx_done = r_spi_cs_rising_buf;
    assign o_rx_data = r_rx_data;
    
//*********************************PROCESS**************************************
// FUNCTION        :提取片选信号的上升沿与下降沿
//******************************************************************************     

    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_cs_buf <= 1'b0;
            r_spi_cs_rising <= 1'b0;
            r_spi_cs_falling <= 1'b0;
            r_spi_cs_rising_buf <= 1'b0;
        end
        else
        begin
            r_spi_cs_buf <= i_spi_cs;
            r_spi_cs_rising <= i_spi_cs & (~r_spi_cs_buf);
            r_spi_cs_falling <= (~i_spi_cs) & r_spi_cs_buf;
            r_spi_cs_rising_buf <= r_spi_cs_rising;
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :提取时钟信号的上升沿与下降沿
//******************************************************************************     
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_clk_buf <= 1'b0;
            r_spi_clk_rising <= 1'b0;
            r_spi_clk_falling <= 1'b0;
        end
        else
        begin
            r_spi_clk_buf <= i_spi_clk;
            r_spi_clk_rising <= i_spi_clk & (~r_spi_clk_buf);
            r_spi_clk_falling <= (~i_spi_clk) & r_spi_clk_buf;
            
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :MISO，从端在时钟的下降沿发送数据，
//******************************************************************************     
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_tx_shift <= 8'b0;
        end
        else
        begin
            if(1'b1 == r_spi_cs_falling)
                r_tx_shift <= i_tx_data;
            else if(1'b1 == r_spi_clk_falling)
                r_tx_shift <= {r_tx_shift[6 : 0], 1'b0};    
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :MOSI,从端在时钟的上升沿接收数据
//******************************************************************************     
    
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
            r_rx_shift <= 8'b0;
        else
            if(1'b1 == r_spi_clk_rising)
                r_rx_shift <= {r_rx_shift[6 : 0], i_spi_mosi};
    end
    
//*********************************PROCESS**************************************
// FUNCTION        :MOSI,从端在片选信号的上升沿更新接收数据
//******************************************************************************     
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
            r_rx_data <= 8'b0;
        else
            if(1'b1 == r_spi_cs_rising)
                r_rx_data <= r_rx_shift;
    end
    
	    
endmodule
// END OF spi_slave.v FILE ***************************************************



