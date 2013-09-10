//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : assign_app_one.v
// FUNCTION        : assign������ֵ���Ӧ�þ���һ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************

module assign_app_one(
  input [7 : 0] da,
  input [7 : 0] db,
  
  output [7 : 0] sum,
  output cout,
  
  output [7 : 0] d_and,
  output [7 : 0] d_not,
  output do
  );

 
  assign do = da[0];  
  
  assign d_not = ~da;  
  
  assign d_and = da & db;  
  
  assign {cout, sum} = da + db;
  
endmodule
// END OF parallel_adder.v FILE *********************************************************     
