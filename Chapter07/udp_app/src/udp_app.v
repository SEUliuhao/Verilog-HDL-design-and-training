//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : udp_app.v
// FUNCTION        : UDP的实例化应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module udp_app(
            );
    reg a;
    reg b;
    reg sel;
    wire y;            
    reg d;
    wire q_latch;
    wire q_trig;
    reg clk;
    
    initial
    begin
            a = 0;
            b = 1;
            sel = 0;
        #2  a = 0;
            b = 1;
            sel = 1;
        #2  a = 1;
            b = 0;
            sel = 1;
        #2  a = 1;
            b = 0;
            sel = 0;
    end
    
    always
        #1 clk = ~clk;
    
    
    udp_mux2to1 i1_udp_mux2to1(y, a, b, sel);
    
    udp_latch   i2_udp_latch(q_latch, a, sel);
    
    udp_trig    i3_udp_trig(q_trigh, clk, a);
    
// END OF udp_app.v FILE ***************************************************

    
   