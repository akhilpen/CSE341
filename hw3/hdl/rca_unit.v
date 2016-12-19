`timescale 1ns/1ns
 module testbench(); 
   wire [15:0] x,y,s;    wire cin,cout; 
      testAdder test (x,y,s,cout,cin); 
      sixteenBitAdder adder (x,y,s,cout,cin); 
endmodule 
module testAdder(a,b,s,cout,cin);   
 input [15:0] s;   
 input cout;   
 output [15:0] a,b; 
output cin;
 reg [15:0] a,b; 
reg cin;
 initial 
begin 
   $monitor($time,,"a=%d,b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout); $display($time,,"a=%d, b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout);  
#20 a=12; b=0; cin=0;
#20 a=10000; b=7; cin=0; 
#20 a=1000; b=2000; cin=0; 
#20 a=300; b=700; cin=0; 
#20 a=2490; b=10; cin=0; 
#20 a=2; b=65000; cin=0; 
#20 a=65000; b=200; cin=0; 
#20 a=101; b=999; cin=0; 
#20 a=108; b=108; cin=0; 
#20 a=1009; b=56; cin=0; 


$display($time,,"a=%d, b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout);  
end
endmodule


module fulladder(a,b,c,s,cout);  
 input a,b,c;  
 output s,cout; 
  xor #1
      g1(w1, a, b),    
      g2(s, w1, c); 
  and #1
      g3(w2, c, b),  
    g4(w3, c, a),     
 g5(w4, a, b); 
  or #1
      g6(cout, w2, w3, w4); 
endmodule 
module sixteenBitAdder(x,y,s,cout,cin);   
 input [15:0] x,y;   
 output [15:0] s;   
 input cin; 
   output cout;   
 wire [14:0] c; 
fulladder f0 (x[0],y[0],cin,s[0],c[0]);
 fulladder f1 (x[1],y[1],c[0],s[1],c[1]); 
fulladder f2 (x[2],y[2],c[1],s[2],c[2]); 
fulladder f3 (x[3],y[3],c[2],s[3],c[3]); 

fulladder f4 (x[4],y[4],c[3],s[4],c[4]);
 fulladder f5 (x[5],y[5],c[4],s[5],c[5]); 
fulladder f6 (x[6],y[6],c[5],s[6],c[6]); 
fulladder f7 (x[7],y[7],c[6],s[7],c[7]); 
fulladder f8
 (x[8],y[8],c[7],s[8],c[8]);
 fulladder f9 (x[9],y[9],c[8],s[9],c[9]); 
fulladder f10
(x[10],y[10],c[9],s[10],c[10]); 
fulladder f11 (x[11],y[11],c[10],s[11],c[11]);
fulladder f12 (x[12],y[12],c[11],s[12],c[12]);
 fulladder f13 (x[13],y[13],c[12],s[13],c[13]); 
fulladder f14 (x[14],y[14],c[13],s[14],c[14]); 
fulladder f15 (x[15],y[15],c[14],s[15],cout); 
 endmodule 



