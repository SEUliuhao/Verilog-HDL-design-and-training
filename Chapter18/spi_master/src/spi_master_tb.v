//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : spi_master_tb.v
// FUNCTION        : CRC���뷽ʽһģ�����ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


`timescale 1ns/1ns

module spi_master_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg [7 : 0] r_stx_data; //�Ӷ˷�������
    reg [7 : 0] r_mtx_data; //���˷�������
    reg r_spi_tx_rx;        //SPI���˷��ͽ��������ź�
    
    wire w_spi_cs;       //SPIƬѡ�ź� 
    wire w_spi_clk;      //SPIʱ���ź� 
    wire w_spi_mosi;     //SPI��������Ӷ������ź�
    wire w_spi_miso;    //SPI�Ӷ�������������ź� 
    
    wire w_slave_tx_done;     //SPI�Ӷ˷�����������ź� 
    wire w_slave_rx_done;     //SPI�Ӷ˽�����������ź� 
    wire w_master_tx_done;     //SPI���˷�����������ź� 
    wire w_master_rx_done;     //SPI���˽�����������ź� 
    wire [7 : 0] w_srx_data;    //SPI�Ӷ˽��յ�������
    wire [7 : 0] w_mrx_data;    //SPI���˽��յ�������
    
    wire w_spi_busy; //SPI����æ�ź�
    

     
//*********************************PROCESS**************************************
// FUNCTION        :��ʼ��r_rst_n
//******************************************************************************     
    initial
    begin
            r_rst_n = 1'b0;
        #10 r_rst_n = 1'b1; 
    end

//*********************************PROCESS**************************************
// FUNCTION        :��ʼ��r_clk,��������Ϊ2ns��ʱ���ź�
//******************************************************************************     
    initial
    begin
            r_clk = 1'b0;
        forever
            #1  r_clk = ~r_clk;
    end

//*********************************PROCESS**************************************
// FUNCTION        :�������˷��ͽ��������ź�r_spi_tx_rx
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
// FUNCTION        :ʵ����SPI�Ӷ�ģ��spi_master
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
// FUNCTION        :ʵ����SPI����ģ��spi_master
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
                 
       
            
    
    
