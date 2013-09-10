//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : spi_slave_tb.v
// FUNCTION        : CRC编码方式一模块测试平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_slave_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg [7 : 0] r_stx_data; //从端写数据
    reg [7 : 0] r_mtx_data; //主端发送数据
    
    reg r_spi_cs;       //SPI片选信号 
    reg r_spi_clk;      //SPI时钟信号 
    wire w_spi_mosi;     //SPI主端输出从端输入信号
    
    wire w_tx_done;     //SPI从端发送数据完成信号 
    wire w_rx_done;     //SPI从端接收数据完成信号 
    wire w_spi_miso;    //SPI从端输出主端输入信号 
    wire [7 : 0] w_srx_data;    //SPI从端接收到的数据
    

    assign w_spi_mosi = r_mtx_data[7];
       
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
// FUNCTION        :产生主端SPI信号
//******************************************************************************     
    initial
    begin
            r_spi_cs = 1'b1;
            r_spi_clk = 1'b0;
        forever
        begin
            r_mtx_data = $random() % 256;
            #100
            r_spi_cs = 1'b0;
            repeat(8)
            begin
                #10            
                r_spi_clk = 1'b1;
                #10            
                r_spi_clk = 1'b0;
                r_mtx_data = {r_mtx_data[6 : 0],1'b0};
            end
            #10
            r_spi_cs = 1'b1;
        end
    end
    
//*********************************PROCESS**************************************
// FUNCTION        :初始化r_data
//******************************************************************************     
    initial
    begin
            r_stx_data = 8'b0;
        forever
            #270  r_stx_data = $random() % 256;
    end

//*********************************PROCESS**************************************
// FUNCTION        :实例化CRC编码模块spi_slave
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
                        .i_spi_mosi(r_mtx_data[7]),
                        .o_spi_miso(w_spi_miso)
                      );    
endmodule
// END OF data_encrypt.v FILE *********************************************************
                 
       
            
    
    
