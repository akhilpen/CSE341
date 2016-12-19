
module full_adder;

reg a,b,c;

wire s,cout,w1,w2,w3,w4;

xor(w1,a,b);

xor(s,w1,c);

and(w2,a,c);

and(w3,b,c);

and(w4,a,b);

or(cout,w2,w3,w4);


  initial begin
   $monitor($time,"a =%b, b=%b, c=%b,cout=%b,s=%b",a,b,c,cout,s);
     #0 a=0; b=0; c=0;
     #10 a=0; b=0; c=1;
     #10 a=0; b=1; c=0;
#10 a=0; b=1; c=1;
#10 a=1; b=0; c=0;
#10 a=1; b=0; c=1;
#10 a=1; b=1; c=0;
#10 a=1; b=1; c=1;
  end
endmodule
