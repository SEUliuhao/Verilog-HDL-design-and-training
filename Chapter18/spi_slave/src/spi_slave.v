//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : spi_slave.v
// FUNCTION        : SPI�Ӷ˿�����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_slave
    (
        input i_rst_n,
        input i_clk, //���ʱ����uart�����ʵ�16��

        input [7 : 0] i_tx_data, //8λ��������
        output o_tx_done , //�����������
        output [7 : 0] o_rx_data, //8λ��������
        output o_rx_done, //�����������
        
        input i_spi_cs, //SPIƬѡ�źţ�����Ч
        input i_spi_clk, //SPIʱ���ź�
        input i_spi_mosi, //SPI����������Ӷ����������ź�
        output o_spi_miso //SPI�������룬�Ӷ���������ź�
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
// FUNCTION        :��ȡƬѡ�źŵ����������½���
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
// FUNCTION        :��ȡʱ���źŵ����������½���
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
// FUNCTION        :MISO���Ӷ���ʱ�ӵ��½��ط������ݣ�
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
// FUNCTION        :MOSI,�Ӷ���ʱ�ӵ������ؽ�������
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
// FUNCTION        :MOSI,�Ӷ���Ƭѡ�źŵ������ظ��½�������
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



