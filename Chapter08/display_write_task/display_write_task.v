//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : display_write_task.v
// FUNCTION        : ��ʾ��д����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module display_write_task();

    reg [7 : 0] r_data;
    reg [15*8 : 0] r_str;
    
    initial
    begin
        r_data = 8'd100;
        r_str = "I love Verilog!";
    end
     
    initial
    begin
        //��ʾ����֮������н�����
        $display(r_data); //û�и�ʽ˵����Ĭ��ʮ������ʾ
        $displayb(r_data); //û�и�ʽ˵����Ĭ�϶�������ʾ
        $displayo(r_data); //û�и�ʽ˵����Ĭ�ϰ˽�����ʾ
        $displayh(r_data); //û�и�ʽ˵����Ĭ��ʮ��������ʾ
        $display("r_data = %o", r_data); //�и�ʽ˵�����˽�����ʾ
        $displayb("r_data = %d", r_data); //�и�ʽ˵����ʮ������ʾ
        $displayo("r_data = %h", r_data); //�и�ʽ˵����ʮ��������ʾ
        $displayh("r_data = %b", r_data); //�и�ʽ˵����ʮ��������ʾ
        
        //д����֮��û���н�����
        $write(r_data); //û�и�ʽ˵����Ĭ��ʮ������ʾ
        $writeb(r_data); //û�и�ʽ˵����Ĭ�϶�������ʾ
        $writeo(r_data); //û�и�ʽ˵����Ĭ�ϰ˽�����ʾ
        $writeh(r_data); //û�и�ʽ˵����Ĭ��ʮ��������ʾ
        $write("r_data = %o", r_data); //�и�ʽ˵�����˽�����ʾ
        $writeb("r_data = %d", r_data); //�и�ʽ˵����ʮ������ʾ
        $writeo("r_data = %h", r_data); //�и�ʽ˵����ʮ��������ʾ
        $writeh("r_data = %b \n", r_data); //�и�ʽ˵����ʮ��������ʾ��Ϊ�������������ʾ���˻��з�
        
        $display("r_str = %s \n, \t, \\, \", \ooo, %%", r_str, 200); //��ʾ�ַ�����ת���ַ�
        $write("r_str = %s \n, \t, \\, \", \ooo, %%", r_str, 200);  //д�ַ�����ת���ַ�
    end   
                      
endmodule
// END OF display_write_task.v FILE ***************************************************


  

