//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : timer.v
// FUNCTION        : ��������ʵ��0��9�ļ�������������9ʱ��
//                   ���һ��ʱ�����ڵ����壬����������Ҫ��ʼ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module timer
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        
        input i_adjust,//����������ѭ�������롢�֡�ʱ
        input i_increment, //������Ϊ�֡�ʱ����һ�μ�1��������Ϊ��ʱ����һ������
        
        output [3 : 0] o_hour_h,
        output [3 : 0] o_hour_l,
        output [3 : 0] o_minut_h,
        output [3 : 0] o_minut_l,
        output [3 : 0] o_second_h,
        output [3 : 0] o_second_l,
        output [1 : 0] o_adjust_cnt
    );
    
    //��������ź�o_data�Ļ���
    reg [3 : 0] r_hour_h;
    reg [3 : 0] r_hour_l;
    reg [3 : 0] r_minut_h;
    reg [3 : 0] r_minut_l;
    reg [3 : 0] r_second_h;
    reg [3 : 0] r_second_l;
    
    reg r_adjust;
    reg r_adjust_falling;
    reg r_increment;
    reg r_increment_falling;
    reg [1 : 0] r_adjust_cnt;
    
    
    assign o_hour_h = r_hour_h;
    assign o_hour_l = r_hour_l;
    assign o_minut_h = r_minut_h;
    assign o_minut_l = r_minut_l;
    assign o_second_h = r_second_h;
    assign o_second_l = r_second_l; 
    assign o_adjust_cnt = r_adjust_cnt;  
    
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_increment <= 1'b0;
            r_increment_falling <= 1'b0;
        end
        else
        begin
            r_increment <= i_increment;
            r_increment_falling <= r_increment & (~i_increment);
        end
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_adjust_cnt <= 2'd0;
        else
            if(1'b1 == r_adjust_falling) 
                r_adjust_cnt <= r_adjust_cnt + 1'b1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_adjust <= 1'b0;
            r_adjust_falling <= 1'b0;
        end
        else
        begin
            r_adjust <= i_adjust;
            r_adjust_falling <= r_adjust & (~i_adjust);
        end
	end
	
    //
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_second_l <= 4'd0;
        else
            if((2'b01 == r_adjust_cnt) && (1'b1 == r_increment_falling))
                r_second_l <= 4'd0;
            else if(4'd9 == r_second_l)
                    r_second_l <= 4'd0;
                else
                    r_second_l <= r_second_l + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_second_h <= 4'd0;
        else
            if((2'b01 == r_adjust_cnt) && (1'b1 == r_increment_falling))
                r_second_h <= 4'd0;
            else if(4'd9 == r_second_l)
    				if(4'd5 == r_second_h)
    					r_second_h <= 4'd0;
    				else
    					r_second_h <= r_second_h + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_minut_l <= 4'd0;
        else
            
            if((2'b10 == r_adjust_cnt) && (1'b1 == r_increment_falling))
                r_minut_l <= r_minut_l + 4'd1;
            else if(4'd9 == r_second_l && 4'd5 == r_second_h)
                    if(4'd9 == r_minut_l)
                        r_minut_l <= 4'd0;
                    else
                        r_minut_l <= r_minut_l + 4'd1;
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_minut_h <= 4'd0;
        else
            if((2'b10 == r_adjust_cnt) && (1'b1 == r_increment_falling) && (4'd9 == r_minut_l))
            begin
                if(4'd5 == r_minut_h)
                    r_minut_h <= 4'd0;
                else
                    r_minut_h <= r_minut_h + 4'd1;
            end
            else if(4'd9 == r_second_l && 4'd5 == r_second_h && 4'd9 == r_minut_l)
            begin
                if(4'd5 == r_minut_h)
                    r_minut_h <= 4'd0;
                else
                    r_minut_h <= r_minut_h + 4'd1;
            end
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_hour_l <= 4'd0;
        else
            if((2'b11 == r_adjust_cnt) && (1'b1 == r_increment_falling))
            begin   
                    if(4'd9 == r_hour_l || (4'd3 == r_hour_l && 4'd2 == r_hour_h))
                        r_hour_l <= 4'd0;
                    else
                        r_hour_l <= r_hour_l + 4'd1;
            end
            else if(4'd9 == r_second_l && 4'd5 == r_second_h && 4'd9 == r_minut_l && 4'd5 == r_minut_h)
            begin   
                    if(4'd9 == r_hour_l)
                        r_hour_l <= 4'd0;
                    else
                        r_hour_l <= r_hour_l + 4'd1;
            end
	end
	
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_hour_h <= 4'd0;
        else
            if((2'b11 == r_adjust_cnt) && (1'b1 == r_increment_falling))
            begin
                if(4'd2 == r_hour_h && 4'd3 == r_hour_l)
                    r_hour_h <= 4'd0;
                else if(4'd9 == r_hour_l)
                    r_hour_h <= r_hour_h + 4'd1;
            end
            else if(4'd9 == r_second_l && 4'd5 == r_second_h && 4'd9 == r_minut_l && 4'd5 == r_minut_h && 4'd3 == r_hour_l)
            begin
                if(4'd2 == r_hour_h )
                    r_hour_h <= 4'd0;
            end
            else 
            begin
                if(4'd9 == r_second_l && 4'd5 == r_second_h && 4'd9 == r_minut_l && 4'd5 == r_minut_h && 4'd9 == r_hour_l)
                    r_hour_h <= r_hour_h + 4'd1;
            end
	end

    
endmodule
// END OF timer.v FILE ***************************************************



