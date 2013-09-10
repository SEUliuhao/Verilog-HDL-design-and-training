//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : uart_tx.v
// FUNCTION        : UART数据发送器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module uart_tx
    (
        input i_reset_n,
        input i_clk, //这个时钟是uart波特率的16倍
        input i_tx_start,
        input [7 : 0] i_data, //待发送的8位数据
        
        output o_tx, //uart串行数据输出，低位在先，高位在后
        output o_tx_done  //高为uart串行数据发送完毕，低为正在发送数据
        
    );
    
    reg [10 : 0] r_tx_shift;
    reg r_tx_done;
    
    
    reg r_tx_start_buf;
    reg r_tx_start_rising;
    
    reg [3 : 0] r_16_cnt;//时钟信号的16分频，即为波特率
    reg [3 : 0] r_shift_cnt; //移位计数器，移完11位，即发送完一帧数据，这里不讨论奇偶检验位
    
    reg [1 : 0] r_state;
    parameter IDLE = 2'b00;
    parameter SEND_DATA = 2'b01;
    parameter SEND_DONE = 2'b10;
    
    
    assign o_tx = r_tx_shift[0];
    assign o_tx_done = r_tx_done;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_tx_start_buf <= 1'b0;
            r_tx_start_rising <= 1'b0;
        end
        else
        begin
            r_tx_start_buf <= i_tx_start;
            r_tx_start_rising <= i_tx_start & (~r_tx_start_buf);
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_state <= IDLE;
            r_tx_shift <= 11'h7ff;
            r_tx_done <= 1'b1;
        end
        else
        begin
            case(r_state)
                IDLE:
                    begin
                        r_16_cnt <= 4'b0;
                        r_shift_cnt <= 4'b0;
                                                
                        if(1'b1 == r_tx_start_rising)
                        begin
                            r_state <= SEND_DATA;
                            r_tx_shift <= {1'b1, i_data, 1'b0, 1'b1};
                            r_tx_done <= 1'b1;
                        end
                        else
                        begin
                            r_state <= IDLE;
                            r_tx_shift <= 11'h7ff;
                            r_tx_done <= 1'b0;
                        end
                    end
                SEND_DATA:
                    begin
                        r_tx_done <= 1'b0;
                        if(4'hf == r_16_cnt)
                        begin
                            r_16_cnt <= 4'b0;
                            if(4'd10 == r_shift_cnt)
                            begin
                                r_shift_cnt <= 4'b0;
                                r_state <= SEND_DONE;
                                r_tx_shift <= {1'b1, r_tx_shift[10 : 1]};
                            end
                            else
                            begin
                                r_shift_cnt <= r_shift_cnt + 4'b1;
                                r_state <= SEND_DATA;
                                r_tx_shift <= {1'b1, r_tx_shift[10 : 1]};
                            end
                        end
                        else
                        begin
                            r_16_cnt <= r_16_cnt + 4'b1;
                        end
                    end
                SEND_DONE:
                    begin
                        r_state <= IDLE;
                        r_tx_shift <= 11'h7ff;
                        r_tx_done <= 1'b1;
                    end 
            endcase
        end
    end
	    
endmodule
// END OF uart_tx.v FILE ***************************************************



