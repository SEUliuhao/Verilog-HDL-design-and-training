//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : spi_ss_clk_generator.v
// FUNCTION        : SPI����Ƭѡ��ʱ���źŲ�����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module spi_ss_clk_generator
    (
        input i_reset_n,
        input i_clk, //
        input i_tx_rx, //���ͻ���������ź�
        
        output o_spi_ss, //SPIƬѡ�ź�
        output o_spi_clk, //SPIʱ���ź�
        output o_spi_busy //SPIæ�źţ�Ϊ��ʱ��ʾSPI���ڷ��ͻ��������
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



