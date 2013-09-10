//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : adder_1bit.v
// FUNCTION        : 1λȫ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************

module adder_1bit(
    input din_one, //��һ������
    input din_two, //�ڶ�������
    input cin,     //��λ����
    
    output sum,    //�����
    output cout    //��λ���
    );
    

//����������ֵ���ʵ��ȫ�Ӳ���    
   assign sum = din_one ^ din_two ^ cin;
   assign cout = (din_one & din_two) | (din_two & cin) | (din_one & cin);    
endmodule
// END OF adder_1bit.v FILE ***************************************************

    
   