//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : task_gen_clk_app.v
// FUNCTION        : ����ĵ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module task_gen_clk_app();
    
    reg r_clk;
    

//��������Ϊ20ns��ʱ���ź�
    task gen_20ns_clk;
        //��������ﶨ�� output r_clk,�������ʱֻ�ܷ��ص�ʱʱ�̵�ֵ
        //�����ܲ���Ԥ�ڵ�ʱ�Ӳ���
        forever
        begin
                r_clk = 0; //�����ģ��ȫ�ֱ���r_clk���и�ֵ����Բ���ʱ�Ӳ���
            #10 r_clk = 1;
            #10 r_clk = 0;
        end        
    endtask
    
    initial
    begin
      r_clk = 0;
      gen_20ns_clk();     
    end
    
      
    //��ӡ��������
    initial $monitor("$time = %d, r_clk = %b",  $time, r_clk);
endmodule
// END OF task_gen_clk_app.v FILE ***************************************************


  
