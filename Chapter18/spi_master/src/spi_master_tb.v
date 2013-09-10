//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : spi_master_tb.v
// FUNCTION        : CRC编码方式一模块测试平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************


`timescale 1ns/1ns

module spi_master_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg [7 : 0] r_stx_data; //从端发送数据
    reg [7 : 0] r_mtx_data; //主端发送数据
    reg r_spi_tx_rx;        //SPI主端发送接收数据信号
    
    wire w_spi_cs;       //SPI片选信号 
    wire w_spi_clk;      //SPI时钟信号 
    wire w_spi_mosi;     //SPI主端输出从端输入信号
    wire w_spi_miso;    //SPI从端输出主端输入信号 
    
    wire w_slave_tx_done;     //SPI从端发送数据完成信号 
    wire w_slave_rx_done;     //SPI从端接收数据完成信号 
    wire w_master_tx_done;     //SPI主端发送数据完成信号 
    wire w_master_rx_done;     //SPI主端接收数据完成信号 
    wire [7 : 0] w_srx_data;    //SPI从端接收到的数据
    wire [7 : 0] w_mrx_data;    //SPI主端接收到的数据
    
    wire w_spi_busy; //SPI主端忙信号
    

     
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
// FUNCTION        :产生主端发送接收数据信号r_spi_tx_rx
//******************************************************************************     
    initial
    begin
        r_spi_tx_rx = 1'b0;
        r_mtx_data = 8'd0;
        r_stx_data = 8'd0;
        forever
        begin
            #300
            r_mtx_data = $random() % 256;
            r_stx_data = $random() % 256;
            r_spi_tx_rx = 1'b1;
            #100 
            r_spi_tx_rx = 1'b0;
                   
        end
    end


//*********************************PROCESS**************************************
// FUNCTION        :实例化SPI从端模块spi_master
//******************************************************************************     
    spi_slave I1_spi_slave(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_tx_data(r_stx_data),
                        .o_tx_done(w_slave_tx_done),
                        .o_rx_data(w_srx_data),
                        .o_rx_done(w_slave_rx_done),
                        .i_spi_cs(w_spi_cs),
                        .i_spi_clk(w_spi_clk),
                        .i_spi_mosi(w_spi_mosi),
                        .o_spi_miso(w_spi_miso)
                      ); 

//*********************************PROCESS**************************************
// FUNCTION        :实例化SPI主端模块spi_master
//******************************************************************************     
    spi_master I1_spi_master(
                        .i_rst_n(r_rst_n),
                        .i_clk(r_clk),
                        .i_spi_tx_rx(r_spi_tx_rx),
                        .i_tx_data(r_mtx_data),
                        .o_tx_done(w_master_tx_done),
                        .o_rx_data(w_mrx_data),
                        .o_rx_done(w_master_rx_done),
                        .o_spi_cs(w_spi_cs),
                        .o_spi_clk(w_spi_clk),
                        .i_spi_miso(w_spi_miso),
                        .o_spi_mosi(w_spi_mosi),
                        .o_spi_busy(w_spi_busy)
                      );                
                     
                                               
endmodule
// END OF spi_master_tb.v FILE *********************************************************
                 
       
            
    
    
