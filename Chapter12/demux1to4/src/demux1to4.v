//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : demux1to4.v
// FUNCTION        : 4-1的数据选择器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module demux1to4
    (
        input i_data,
        input [1 : 0] i_sel, //2位的选择信号 
        
        output o_a, //第一路数据输出
        output o_b, //第二路数据输出 
        output o_c, //第三路数据输出
        output o_d //第四路数据输出        
    );
    
    //定义输出信号o_data的缓存
    reg  r_a;
    reg  r_b;
    reg  r_c;
    reg  r_d;
    
    assign o_a = r_a; //通过assign连续赋值语句更新编码输出
    assign o_b = r_b;
    assign o_c = r_c;
    assign o_d = r_d;
    
    //当选择信号的值为00时，把输入数据i_data分配到第一路输出端口
    //否则第一路输出为0
    always @(*)
    begin
   	    if(i_sel == 2'b00)
   	        r_a = i_data;
   	    else
   	        r_a = 1'b0;
	end
	
	//当选择信号的值为01时，把输入数据i_data分配到第二路输出端口
    //否则第二路输出为0
    always @(*)
    begin
   	    if(i_sel == 2'b01)
   	        r_b = i_data;
   	    else
   	        r_b = 1'b0;
	end
	
	//当选择信号的值为10时，把输入数据i_data分配到第三路输出端口
    //否则第三路输出为0
    always @(*)
    begin
   	    if(i_sel == 2'b10)
   	        r_c = i_data;
   	    else
   	        r_c = 1'b0;
	end
	
	//当选择信号的值为11时，把输入数据i_data分配到第四路输出端口
    //否则第四路输出为0
    always @(*)
    begin
   	    if(i_sel == 2'b11)
   	        r_d = i_data;
   	    else
   	        r_d = 1'b0;
	end
    
endmodule

// END OF demux1to4.v FILE ***************************************************



