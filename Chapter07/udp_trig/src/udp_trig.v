//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : udp_trig.v
// FUNCTION        : UDPʵ��D������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


primitive udp_trig(q, clk, d);       
    
    output q;
    
    input clk;
    input d;
    
    initial
        q = 0;
    
    table
        
    //  clk     d    :   q(current)  :   q(next)
        r       0    :   ?           :   0      //ʱ�����������ݸ���
        r       1    :   ?           :   1
        (0x)    1    :   1           :   1
        (0x)    0    :   0           :   0
        n       ?    :   ?           :   -      //����ʱ���½���
        ?       (??) :   ?           :   -      //����ʱ�ӵ�ƽ�ȶ�ʱ�����ݱ仯
     endtable
endprimitive
    
// END OF udp_trig.v FILE ***************************************************

    
   