//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : mos_gate.v
// FUNCTION        : MOSԭ��ģ���ʵ����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module mos_gate(
    input din,
    input pctrl,
    input nctrl,
     
    output d_cmos,
    output d_pmos,
    output d_nmos,
    output d_rcmos,
    output d_rpmos,
    output d_rnmos
    );
    
    //ʵ����cmos��̬��ģ��
    cmos U1_cmos(d_cmos, din, nctrl, pctrl);

    //ʵ����pmos��̬��ģ��
    pmos U2_pmos(d_pmos, din, pctrl);

    //ʵ����nmos��̬��ģ��
    nmos U3_nmos(d_nmos, din, nctrl);

    //ʵ����rcmos��̬��ģ��
    rcmos U4_rcmos(d_rcmos, din, nctrl, pctrl);

    //ʵ����rpmos��̬��ģ��
    rpmos U5_rpmos(d_rpmos, din, pctrl);

    //ʵ����rnmos��̬��ģ��
    rnmos U6_rnmos(d_rnmos, din, nctrl);
    
endmodule
// END OF mos_gate.v FILE ***************************************************

    
   