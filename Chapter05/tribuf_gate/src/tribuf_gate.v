//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : tribuf_gate.v
// FUNCTION        : 多输入门电路原语模块的实例化语句举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
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
    
    //实例化bufif0三态门模块
    bufif0 U1_bufif0(d_bufif0, din, ctrl);

    //实例化bufif1三态门模块
    bufif1 U1_bufif1(d_bufif1, din, ctrl);

    //实例化notif0三态门模块
    notif0 U1_notif0(d_notif0, din, ctrl);

    //实例化notif1三态门模块
    notif1 U1_notif1(d_notif1, din, ctrl);
    
endmodule
// END OF tribuf_gate.v FILE ***************************************************

    
   