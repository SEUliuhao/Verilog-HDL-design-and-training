//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : spi_slave_tb.v
// FUNCTION        : CRC���뷽ʽһģ�����ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_slave_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg [7 : 0] r_stx_data; //�Ӷ�д����
    reg [7 : 0] r_mtx_data; //���˷�������
    
    reg r_spi_cs;       //SPIƬѡ�ź� 
    reg r_spi_clk;      //SPIʱ���ź� 
    wire w_spi_mosi;     //SPI��������Ӷ������ź�
    
    wire w_tx_done;     //SPI�Ӷ˷�����������ź� 
    wire w_rx_done;     //SPI�Ӷ˽�����������ź� 
    wire w_spi_miso;    //SPI�Ӷ�������������ź� 
    wire [7 : 0] w_srx_data;    //SPI�Ӷ˽��յ�������
    

    assign w_spi_mosi = r_mtx_data[7];
       
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
// FUNCTION        :��������SPI�ź�
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
// FUNCTION        :��ʼ��r_data
//******************************************************************************     
    initial
    begin
            r_stx_data = 8'b0;
        forever
            #270  r_stx_data = $random() % 256;
    end

//*********************************PROCESS**************************************
// FUNCTION        :ʵ����CRC����ģ��spi_slave
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
                 
       
            
    
    
