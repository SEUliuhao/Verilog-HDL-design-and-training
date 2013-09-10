//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : assign_app_one.v
// FUNCTION        : assign连续赋值语句应用举例一
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
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
