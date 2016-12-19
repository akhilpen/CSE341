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
integer i;
 initial
begin
   $monitor($time,,"a=%d,b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout); $display($time,,"a=%d, b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout);
$display($time,,"a=%d, b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout);
for(i=0;i<5000;i=i+1)
begin
 #20 a=$random; b=$random; cin=$random;
end


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
fourBitAdder ff0 (x[3:0],y[3:0],cin,s[3:0],c[0]);
 fourBitAdder ff1 (x[7:4],y[7:4],c[0],s[7:4],c[1]);
fourBitAdder ff2 (x[11:8],y[11:8],c[1],s[11:8],c[2]);
fourBitAdder ff3 (x[15:12],y[15:12],c[2],s[15:12],cout);

endmodule

module fourBitAdder(a,b,cin,s,cout);
input [3:0] a,b;
output [3:0] s;
input cin;
output cout;
wire [2:0] c;

fulladder f0 (a[0],b[0],cin,s[0],c[0]);
 fulladder f1 (a[1],b[1],c[0],s[1],c[1]);
fulladder f2 (a[2],b[2],c[1],s[2],c[2]);
fulladder f3 (a[3],b[3],c[2],s[3],cout);

endmodule



