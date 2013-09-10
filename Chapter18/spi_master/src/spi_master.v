//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : spi_master.v
// FUNCTION        : SPI��������ͨ��ģ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************

`timescale 1ns/1ns

module spi_master
    (
        input i_rst_n,
        input i_clk, 

        input i_spi_tx_rx, //����SPI���ͻ��������
        input [7 : 0] i_tx_data, //8λ��������
        output o_tx_done , //�����������
        output [7 : 0] o_rx_data, //8λ��������
        output o_rx_done, //�����������
        
        output o_spi_cs, //SPIƬѡ�źţ�����Ч
        output o_spi_clk, //SPIʱ���ź�
        input i_spi_miso, //SPI�������룬�Ӷ���������ź�
        output o_spi_mosi, //SPI����������Ӷ����������ź�        
        output o_spi_busy //SPIæ�źţ�Ϊ��ʱ��ʾSPI���ڷ��ͻ��������
    );
    
    
    reg r_spi_cs;
    reg r_spi_clk;
    reg r_spi_busy;
    
    reg r_spi_tx_rx_buf;
    reg r_spi_tx_rx_rising;
    reg [4 : 0] r_spi_cs_cnt;
    
    reg [4 : 0] r_div_cnt;  //��Ƶ������
    reg r_div_clk;          //��Ƶʱ��
    
    
    assign o_spi_cs = r_spi_cs;
    assign o_spi_clk = r_spi_clk;
    assign o_spi_busy = r_spi_busy;
    
//*********************************PROCESS**************************************
// FUNCTION        :ʵ����SPI�Ӷ�ģ��spi_slave
//******************************************************************************     
    spi_slave I1_spi_slave(
                        .i_rst_n(i_rst_n),
                        .i_clk(i_clk),
                        .i_tx_data(i_tx_data),
                        .o_tx_done(o_tx_done),
                        .o_rx_data(o_rx_data),
                        .o_rx_done(o_rx_done),
                        .i_spi_cs(r_spi_cs),
                        .i_spi_clk(r_spi_clk),
                        .i_spi_mosi(i_spi_miso),
                        .o_spi_miso(o_spi_mosi)
                      );  
//*********************************PROCESS**************************************
// FUNCTION        :������Ƶʱ��
//******************************************************************************     
                      
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_div_cnt <= 4'd0;
            r_div_clk <= 1'b0;
        end
        else
        begin
            r_div_cnt <= r_div_cnt + 4'd1;
            r_div_clk <= r_div_cnt[3];
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :����SPI���˷��ͻ���������źŵ�������
//******************************************************************************     
    always @(posedge r_div_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
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

//*********************************PROCESS**************************************
// FUNCTION        :����SPI��������ͨ��æ�ź�
//******************************************************************************     
    always @(posedge r_div_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_busy <= 1'b0;
        end
        else
        begin
            if(1'b1 == r_spi_tx_rx_rising)
                r_spi_busy <= 1'b1;
            else if(5'd16 <= r_spi_cs_cnt)
                r_spi_busy <= 1'b0;            
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :SPI�������ݴ���æ������
//******************************************************************************     
    always @(posedge r_div_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_cs_cnt <= 5'b0;
        end
        else
        begin
            if(1'b1 == r_spi_busy)
                r_spi_cs_cnt <= r_spi_cs_cnt + 5'b1; 
            else
                r_spi_cs_cnt <= 5'b0;           
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :����SPIʱ���ź�
//******************************************************************************     
    always @(posedge r_div_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_clk <= 1'b1;
        end
        else
        begin
            if(1'b1 == r_spi_busy)
                r_spi_clk <= r_spi_cs_cnt[0];
            else
                r_spi_clk <= 1'b1;            
        end
    end

//*********************************PROCESS**************************************
// FUNCTION        :����SPIƬѡ�ź�
//******************************************************************************     
    always @(posedge r_div_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_spi_cs <= 1'b1;
        end
        else
        begin
            r_spi_cs <= ~r_spi_busy;          
        end
    end
    	    
endmodule
// END OF spi_master.v FILE ***************************************************



