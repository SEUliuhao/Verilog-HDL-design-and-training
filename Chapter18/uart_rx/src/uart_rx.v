//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : uart_rx.v
// FUNCTION        : UART���ݽ�����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module uart_rx
    (
        input i_reset_n,
        input i_clk, //���ʱ����uart�����ʵ�16��
        input i_rx, //uart�����������룬��λ���ȣ���λ�ں�
        
        output [7 : 0] o_data, //�����͵�8λ����
        output o_data_rdy  //��Ϊuart�������ݽ���һ֡������ϣ���ʾ��˿���ȡ����
                           //��Ϊ���ڽ������ݻ���û������
    );
    
    reg [8 : 0] r_rx_shift;
    reg [7 : 0] r_data;
    reg r_rx_done;
    
    
    reg r_rx_data_buf;
    reg r_rx_data_falling;
    
    reg [3 : 0] r_16_cnt;//ʱ���źŵ�16��Ƶ����Ϊ������
    reg [3 : 0] r_shift_cnt; //��λ������������11λ����������һ֡���ݣ����ﲻ������ż����λ
    
    reg [1 : 0] r_state;
    parameter IDLE = 2'b00;
    parameter RECEIVE_DATA = 2'b01;
    parameter RECEIVE_DONE = 2'b10;
    
    
    assign o_data = r_data;
    assign o_data_rdy = r_rx_done;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_data <= 8'b0;
        end
        else
        begin
            if(RECEIVE_DONE == r_state)
                r_data <= r_rx_shift[8 : 1];
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_rx_data_buf <= 1'b0;
            r_rx_data_falling <= 1'b0;
        end
        else
        begin
            r_rx_data_buf <= i_rx;
            r_rx_data_falling <= r_rx_data_buf & (~i_rx);
        end
    end
    
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_state <= IDLE;
            r_rx_shift <= 9'h1ff;
            r_rx_done <= 1'b1;
            r_16_cnt <= 4'b0;
            r_shift_cnt <= 4'b0;
        end
        else
        begin
            case(r_state)
                IDLE:
                    begin
                        r_16_cnt <= 4'b0;
                        r_shift_cnt <= 4'b0;
                                                
                        if(1'b1 == r_rx_data_falling)
                        begin
                            r_state <= RECEIVE_DATA;
                            r_rx_done <= 1'b0;
                        end
                        else
                        begin
                            r_state <= IDLE;
                            r_rx_done <= 1'b0;
                        end
                    end
                RECEIVE_DATA:
                    begin
                        r_rx_done <= 1'b0;
                        if(4'h7 == r_16_cnt)
                        begin
                            r_16_cnt <= 4'b0;
                            if(4'd10 == r_shift_cnt)
                            begin
                                if(1'b1 == i_rx)
                                begin
                                    r_shift_cnt <= 4'b0;
                                    r_state <= RECEIVE_DONE;
                                end
                                else
                                begin
                                    r_shift_cnt <= 4'b0;
                                    r_state <= IDLE;
                                end
                            end
                            else
                            begin
                                r_shift_cnt <= r_shift_cnt + 4'b1;
                                r_state <= RECEIVE_DATA;
                                r_rx_shift <= {i_rx, r_rx_shift[8 : 1]};
                            end
                        end
                        else
                        begin
                            r_16_cnt <= r_16_cnt + 4'b1;
                        end
                    end
                RECEIVE_DONE:
                    begin
                        r_state <= IDLE;
                        r_rx_done <= 1'b1;
                    end 
            endcase
        end
    end
	    
endmodule
// END OF uart_rx.v FILE ***************************************************


