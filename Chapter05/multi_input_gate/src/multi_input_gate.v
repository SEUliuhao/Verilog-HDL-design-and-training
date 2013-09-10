//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : multi_input_gate.v
// FUNCTION        : �������ŵ�·ԭ��ģ���ʵ����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module multi_input_gate(
    input da,
    input db,
    input dc,

    
    output d_and,
    output d_nand,
    output d_or,
    output d_nor,
    output d_xor,
    output d_xnor
    );
    
    //ʵ����ԭ�����������ģ��
    and U1_and(d_and, da, db, dc);
    //ʵ����ԭ������������ģ��
    nand U2_nand(d_nand, da, db, dc);
    //ʵ����ԭ����������ģ��
    or U1_or(d_or, da, db, dc);
    //ʵ����ԭ�������������ģ��
    nor U2_nor(d_nor, da, db, dc);
    //ʵ����ԭ������������ģ��
    xor U1_xor(d_xor, da, db, dc);
    //ʵ����ԭ�������ͬ����ģ��
    xnor U2_xnor(d_xnor, da, db, dc);  

endmodule
// END OF multi_input_gate.v FILE **********************************************

    
   