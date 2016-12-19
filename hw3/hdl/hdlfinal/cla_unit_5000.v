`timescale 1ns/1ns
module testbench();
 wire [15:0]x,y,s;
wire p,g;
 wire cin;
 wire co;
 testPfa test (x,y,s,cin,co);
 adder16 pfa1 (co,s,p,g,x,y,cin);
endmodule

module testPfa (a,b,s,cin,co);
 input [15:0] s,p,g;
 input co;
 output [15:0] a,b;
 output cin;
 reg [15:0] a,b;
 reg cin;
integer i;
 initial
  begin
  $monitor($time,,"a=%d, b=%d, cin=%b, s=%d,co=%b",a,b,cin,s,co);
 $display($time,,"a=%d, b=%d, cin=%b, s=%d,co=%b",a,b,cin,s,co);
for(i=0;i<5000;i=i+1)
  begin
 #70 a=$random;b=$random;cin=$random;
    end
  end
endmodule

module pfa(
   output  p, g, s,
 input   a, b, cin);
   xor #1 sumer(s, a, b, cin);
   xor #1 proper(p, a, b);
   and #1 gener(g, a, b);
endmodule
module cla(output   p_up, g_up,output [3:0]  cout,input  [3:0]  p, g,input cin);
and #1 (p_up, p[0],p[1],p[2],p[3]);
   wire p3g2, p3p2g1, p3p2p1g0, p3p2p1p0cin;
 and #1 (p3g2,p[3],g[2]);
   and #1(p3p2g1,p[3],p[2],g[1]);
   and #1(p3p2p1g0,p[3],p[2],p[1],g[0]);

   and #1(p3p2p1p0cin,p[3],p[2],p[1],p[0],cin);
or #1 (g_up,g[3],p3g2,p3p2g1,p3p2p1g0);


   or#1 (cout[3],g[3],p3g2,p3p2g1,p3p2p1g0,p3p2p1p0cin);

   wire p2g1,p2p1g0,p2p1p0cin,p1g0,p1p0cin,p0cin;

   and #1(p2g1,p[2],g[1]);
   and #1(p2p1g0,p[2],p[1],g[0]);
   and #1(p2p1p0cin,p[2],p[1],p[0],cin);
   and #1(p1g0,p[1],g[0]);
 and #1(p1p0cin,p[1],p[0],cin);
   and #1(p0cin,p[0],cin);

or #1(cout[2], g[2],p2g1,p2p1g0,p2p1p0cin);

or #1 (cout[1],g[1],p1g0,p1p0cin);


   or #1 (cout[0],g[0],p0cin);
endmodule

module adder4_cla(output co,output [3:0] s,output p_up,g_up,input [3:0] a,b, input cin);

   wire [3:0] p,g;
   wire [3:0] carry;
   pfa add0(p[0],g[0],s[0],a[0],b[0],cin);
   pfa add1(p[1],g[1],s[1],a[1],b[1],carry[0]);
   pfa add2(p[2],g[2],s[2],a[2],b[2],carry[1]);
   pfa add3(p[3],g[3],s[3],a[3],b[3],carry[2]);
 cla localcla(p_up,g_up,carry,p,g,cin);
assign co=carry[3];
endmodule
module adder16(output co,output [15:0] s,output p_up,g_up,input [15:0] a,b, input cin);

   wire [3:0] p,g;
   wire [3:0] c;

adder4_cla  ad1(c[0],s[3:0],p[0],g[0],a[3:0],b[3:0],cin);
adder4_cla  ad2(c[1],s[7:4],p[1],g[1],a[7:4],b[7:4],c[0]);

adder4_cla  ad3(c[2],s[11:8],p[2],g[2],a[11:8],b[11:8],c[1]);

adder4_cla  ad4(co,s[15:12],p[3],g[3],a[15:12],b[15:12],c[2]);


 cla localcla(p_up,g_up,c,p,g,cin);

endmodule




