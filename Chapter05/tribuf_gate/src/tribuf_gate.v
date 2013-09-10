//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : tribuf_gate.v
// FUNCTION        : �������ŵ�·ԭ��ģ���ʵ����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module tribuf_gate(
    input din,
    input ctrl,
    
    output d_bufif0,
    output d_bufif1,
    output d_notif0,
    output d_notif1
    );
    
    //ʵ����bufif0��̬��ģ��
    bufif0 U1_bufif0(d_bufif0, din, ctrl);

    //ʵ����bufif1��̬��ģ��
    bufif1 U1_bufif1(d_bufif1, din, ctrl);

    //ʵ����notif0��̬��ģ��
    notif0 U1_notif0(d_notif0, din, ctrl);

    //ʵ����notif1��̬��ģ��
    notif1 U1_notif1(d_notif1, din, ctrl);
    
endmodule
// END OF tribuf_gate.v FILE ***************************************************

    
   