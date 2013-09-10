//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : mos_gate.v
// FUNCTION        : MOS原语模块的实例化语句举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
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
    
    //实例化cmos三态门模块
    cmos U1_cmos(d_cmos, din, nctrl, pctrl);

    //实例化pmos三态门模块
    pmos U2_pmos(d_pmos, din, pctrl);

    //实例化nmos三态门模块
    nmos U3_nmos(d_nmos, din, nctrl);

    //实例化rcmos三态门模块
    rcmos U4_rcmos(d_rcmos, din, nctrl, pctrl);

    //实例化rpmos三态门模块
    rpmos U5_rpmos(d_rpmos, din, pctrl);

    //实例化rnmos三态门模块
    rnmos U6_rnmos(d_rnmos, din, nctrl);
    
endmodule
// END OF mos_gate.v FILE ***************************************************

    
   