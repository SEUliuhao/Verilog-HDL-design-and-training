//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gate_beh_tb.v
// FUNCTION        : 门电路建模仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_beh_tb;

    //定义激励源
    reg r_a;
    reg r_b;
    reg r_c;
    reg r_d;
    reg r_e;
    
    reg [4 : 0] r_cnt;
    
        
    //定义输出信号连线
    wire w_y;
    
    //实例化设计模块，采用端口名称映射方式
    gate_beh  I_gate_beh
        (
            .i_a(r_a),
            .i_b(r_b),
            .i_c(r_c),
            .i_d(r_d),
            .i_e(r_e),
            .o_y(w_y)
        );
        
    //产生激励信号
    initial
    begin
       r_cnt = 5'd0;
       forever
           #2 r_cnt = r_cnt + 5'd1;
    end
    
    //更新gate_consctruct的输入信号的值
    always @(r_cnt)
    begin
        r_a = r_cnt[0];
        r_b = r_cnt[1];
        r_c = r_cnt[2];
        r_d = r_cnt[3];
        r_e = r_cnt[4];
    end
      
endmodule

// END OF gate_beh_tb.v FILE ***************************************************



