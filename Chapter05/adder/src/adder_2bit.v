//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : adder_2bit.v
// FUNCTION        : 1λȫ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************


module adder_2bit(
    input [1 : 0] din_one,  //��һ������
    input [1 : 0] din_two,  //�ڶ�������
    input cin,              //��λ����
    
    output [1 : 0] sum,     //�����
    output cout             //��λ���
    );
    
    wire cin_0bit;          //��λ�ӷ��Ľ�λ���

//ʵ����adder_1bitʵ�ֵ�λ�ӷ�    
    adder_1bit U1_low_bit(
        .din_one(din_one[0]),
        .din_two(din_two[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cin_0bit)
        );
    
//ʵ����adder_1bitʵ�ָ�λ�ӷ�       
    adder_1bit U2_high_bit(
        .din_one(din_one[1]),
        .din_two(din_two[1]),
        .cin(cin_0bit),
        .sum(sum[1]),
        .cout(cout)
        );
        

//����ģ��ʵ�������ʵ��2λȫ�Ӳ���    
endmodule
// END OF adder_2bit.v FILE ***************************************************

    
   