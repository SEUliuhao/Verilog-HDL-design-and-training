//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : count_tb.v
// FUNCTION        : �������ķ���ƽ̨���źű������ʾ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

`timescale 1ns/1ns

module counter_tb();
    
    reg rst_n;
    reg clk;
    
    wire [7 : 0] cnt;
    wire cout;
    
    integer fp_fmonitor; //����һ���ļ����

//ʵ����������    
    counter I1_counter(
        .I_rst_n(rst_n),
        .I_clk(clk),
        .O_cnt(cnt),
        .O_cout(cout)
        );
    
    //��ʼ���ļ����
    initial
        fp_fmonitor = $fopen("fmonitor.vec", "w+"); 


    //��ʼ���ź�
    initial
    begin
        clk = 1'b0;
        rst_n = 1'b0;
        #4 rst_n = 1'b1;
    end
    
    //����ʱ���ź�
    always #1 clk <= ~clk;

    //��ӡ�뱣������ź�
    initial
    begin
        $monitor("simulation time:%d, cnt:%d,   cout:%d", $time, cnt, cout);
        $fmonitor(fp_fmonitor, "simulation time:%d, cnt:%d,   cout:%d", $time, cnt, cout);
    end
    
endmodule
// END OF counter_tb.v FILE ****************************************************


        
        