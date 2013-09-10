//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : adder_4bit.v
// FUNCTION        : 1λȫ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************


module adder_4bit(
    input [3 : 0] din_one,  //��һ������
    input [3 : 0] din_two,  //�ڶ�������
    input cin,              //��λ����
    
    output [3 : 0] sum,     //�����
    output cout             //��λ���
    );
    
    wire cin_0bit;          //��λ�ӷ��Ľ�λ���

//ʵ����adder_1bitʵ�ֵ�λ�ӷ�    
    adder_2bit U1_low_bit(
        .din_one(din_one[1 : 0]),
        .din_two(din_two[1 : 0]),
        .cin(cin),
        .sum(sum[1 : 0]),
        .cout(cin_0bit)
        );
    
//ʵ����adder_1bitʵ�ָ�λ�ӷ�       
    adder_2bit U2_high_bit(
        .din_one(din_one[3 : 2]),
        .din_two(din_two[3 : 2]),
        .cin(cin_0bit),
        .sum(sum[3 : 2]),
        .cout(cout)
        );
        

//����ģ��ʵ�������ʵ��2λȫ�Ӳ���    
endmodule
// END OF adder_4bit.v FILE ***************************************************

    
   