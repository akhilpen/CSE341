Xai Akhil Pendyala
CSE 341 Project 2
November 30, 2015
1.	Circuit diagrams of both adders down to the gate level. 
Zero Delay Model: 
 
4 bit ripple carry adder
 
     									  Single Full Adder
 
 							Full Adder zoomed in
 
Gate cost of Adder: Total number of gates + number of inputs = 6 + 3 = 9
Critical Path Delay: 1 + 1 + 1 = 3s  (Shown above in the full adder diagram)

16-bit Carry lookahead adder:
 
4 Bit Carry Lookahead Adder Zoomed in
 
								       Single Partial Full Adder
                                             Partial Full Adder zoomed in
 
Gate cost of Adder: Total number of gates + number of inputs = 3 + 3 = 6
Critical Path Delay: 1 + 1 = 2s (Shown above in the partial full adder) 

2.	Functional simulation results:
Zero delay simulation results for 16-bit ripple carry adder:
0 a=    x, b=    x, c=x, s=    z, cout=z
0 a=    x, b=    x, c=x, s=    z, cout=z
0 a=    x,b=    x, c=x, s=    x, cout=x
20 a=13604,b=24193, c=1, s=37798, cout=0
40 a=22115,b=31501, c=1, s=53617, cout=0
60 a=33893,b=21010, c=1, s=54904, cout=0
80 a=52493,b=61814, c=1, s=48772, cout=1
100 a=22509,b=63372, c=1, s=20346, cout=1
120 a= 9414,b=33989, c=0, s=43403, cout=0
140 a=63461,b=29303, c=0, s=27228, cout=1
160 a=56207,b=27122, c=0, s=17793, cout=1
180 a=31464,b=20165, c=0, s=51629, cout=0
200 a=10429,b=22573, c=1, s=33003, cout=0
Zero delay simulation results for 16-bit carry lookahead adder:
0 a=    x, b=    x, cin=x, s=    z,co=z
0 a=    x, b=    x, cin=x, s=    x,co=x
70 a=13604, b=24193, cin=1, s=37798,co=0
140 a=22115, b=31501, cin=1, s=53617,co=0
210 a=33893, b=21010, cin=1, s=54904,co=0
280 a=52493, b=61814, cin=1, s=48772,co=1
350 a=22509, b=63372, cin=1, s=20346,co=1
420 a= 9414, b=33989, cin=0, s=43403,co=0
490 a=63461, b=29303, cin=0, s=27228,co=1
560 a=56207, b=27122, cin=0, s=17793,co=1
630 a=31464, b=20165, cin=0, s=51629,co=0
700 a=10429, b=22573, cin=1, s=33003,co=0

3.	Temporal Dependency: 
Ripple Carry Adder:
 
 
The temporal dependency for the ripple carry adder seems to be 7s,,5s,2s,. The average temporal dependency for Ripple Carry Adder seems to be 4.67s. 





Carry lookahead adder:
0 a=    x, b=    x, cin=x, s=    z,co=z
0 a=    x, b=    x, cin=x, s=    x,co=x
70 a=    4, b=    9, cin=0, s=    x,co=x
71 a=    4, b=    9, cin=0, s=    X,co=x
73 a=    4, b=    9, cin=0, s=    X,co=0
74 a=    4, b=    9, cin=0, s=    X,co=0
75 a=    4, b=    9, cin=0, s=   13,co=0
140 a=    3, b=    2, cin=0, s=   13,co=0
141 a=    3, b=    2, cin=0, s=    1,co=0
143 a=    3, b=    2, cin=0, s=    5,co=0
210 a=    4, b=    9, cin=0, s=    5,co=0
211 a=    4, b=    9, cin=0, s=    9,co=0
213 a=    4, b=    9, cin=0, s=   13,co=0
280 a= 7562, b=   65, cin=0, s=   13,co=0
281 a= 7562, b=   65, cin=0, s= 7627,co=0
350 a=    4, b=    9, cin=0, s= 7627,co=0
351 a=    4, b=    9, cin=0, s=   13,co=0
420 a=54372, b=   43, cin=0, s=   13,co=0
421 a=54372, b=   43, cin=0, s=54351,co=0
423 a=54372, b=   43, cin=0, s=54287,co=0
424 a=54372, b=   43, cin=0, s=54415,co=0
490 a= 6341, b=   76, cin=0, s=54415,co=0
491 a= 6341, b=   76, cin=0, s= 6217,co=0
493 a= 6341, b=   76, cin=0, s= 6145,co=0
494 a= 6341, b=   76, cin=0, s=    X,co=0
495 a= 6341, b=   76, cin=0, s= 6417,co=0
560 a=    4, b=    9, cin=0, s= 6417,co=0
561 a=    4, b=    9, cin=0, s=  405,co=0
563 a=    4, b=    9, cin=0, s=  285,co=0
564 a=    4, b=    9, cin=0, s=    X,co=0
565 a=    4, b=    9, cin=0, s=   13,co=0
630 a= 2015, b=37419, cin=0, s=   13,co=0
631 a= 2015, b=37419, cin=0, s=38388,co=0
633 a= 2015, b=37419, cin=0, s=    X,co=0
634 a= 2015, b=37419, cin=0, s=39402,co=0
635 a= 2015, b=37419, cin=0, s=    X,co=0
636 a= 2015, b=37419, cin=0, s=38922,co=0
637 a= 2015, b=37419, cin=0, s=    X,co=0
638 a= 2015, b=37419, cin=0, s=39434,co=0
700 a=    4, b=    9, cin=0, s=39434,co=0
701 a=    4, b=    9, cin=0, s= 4083,co=0
703 a=    4, b=    9, cin=0, s=    X,co=0
704 a=    4, b=    9, cin=0, s=    X,co=0
705 a=    4, b=    9, cin=0, s=   13,co=0
The temporal dependency for the carry lookahead adder seems to be 5s,3s,1s. The average temporal dependency for Carry lookahead Adder seems to be 3s. 



4.	Analysis of Average Delay across 5,000 randomly selected inputs: 
Ripple Carry Adder:
  
 
 
 
 
 
 
 

The highlighted simulation results show the addition of some random numbers. The average delay across the selected sample of the 5000 results were 9s, 7s, 11s, 5s, 7s, 9s, 7s, 3s, 7s, 7s, 7s, 7s, 13s, 6s, 5s, 9s, 12s. The average delay was 7.70s which was almost the double of the critical path delay which was 3s. 
I have achieved the 5000 simulation results by writing a for loop that started a 0 and went up to 5000 and created 5000 random numbers. I used the $random function in Verilog and in the for loop I made a = $random and b = $random and left my c to be constant. By doing this I have achieved 5000 random inputs which I then simulated and put the results into a text file. I then randomly selected some of the results starting at 300s, then 1000s, 3000s, 5000s, 7000s, 9000s. I then calculated the delay and averaged them together for both the adder.  

Carry lookahead adder:
350 a=22509, b=63372, cin=1, s=48772,co=1
351 a=22509, b=63372, cin=1, s= 8862,co=1
352 a=22509, b=63372, cin=1, s= 8862,co=0
353 a=22509, b=63372, cin=1, s=    X,co=1
354 a=22509, b=63372, cin=1, s=20346,co=1
700 a=10429, b=22573, cin=1, s=51629,co=0
701 a=10429, b=22573, cin=1, s=36113,co=0
703 a=10429, b=22573, cin=1, s=    X,co=0
704 a=10429, b=22573, cin=1, s=32971,co=0
705 a=10429, b=22573, cin=1, s=    X,co=0
706 a=10429, b=22573, cin=1, s=33003,co=0
770 a=25187, b=34570, cin=0, s=33003,co=0
771 a=25187, b=34570, cin=0, s= 5395,co=0
773 a=25187, b=34570, cin=0, s=    X,co=0
774 a=25187, b=34570, cin=0, s=59757,co=0
2030 a=49367, b=64593, cin=0, s=27090,co=0
2031 a=49367, b=64593, cin=0, s=20628,co=0
2032 a=49367, b=64593, cin=0, s=20628,co=1
2033 a=49367, b=64593, cin=0, s=    X,co=1
2034 a=49367, b=64593, cin=0, s=    X,co=1
2035 a=49367, b=64593, cin=0, s=48424,co=1
2100 a=32524, b=52930, cin=0, s=48424,co=1
2101 a=32524, b=52930, cin=0, s=12384,co=1
2102 a=32524, b=52930, cin=0, s=12384,co=0
2103 a=32524, b=52930, cin=0, s=    X,co=1
2104 a=32524, b=52930, cin=0, s=    X,co=1
2105 a=32524, b=52930, cin=0, s=    X,co=1
2106 a=32524, b=52930, cin=0, s=    X,co=1
2107 a=32524, b=52930, cin=0, s=19918,co=1
2170 a=23159, b=60733, cin=0, s=19918,co=1
2171 a=23159, b=60733, cin=0, s=19274,co=1
2173 a=23159, b=60733, cin=0, s=18208,co=1
2174 a=23159, b=60733, cin=0, s=    X,co=1
2175 a=23159, b=60733, cin=0, s=18356,co=1
2240 a=  126, b=33133, cin=1, s=18356,co=1
2241 a=  126, b=33133, cin=1, s=29164,co=1
2243 a=  126, b=33133, cin=1, s=    X,co=0
2244 a=  126, b=33133, cin=1, s=33260,co=0
2310 a=36639, b=63187, cin=1, s=33260,co=0
2311 a=36639, b=63187, cin=1, s=31027,co=0
2312 a=36639, b=63187, cin=1, s=31027,co=1
2313 a=36639, b=63187, cin=1, s=    X,co=1
2314 a=36639, b=63187, cin=1, s=    X,co=1
2315 a=36639, b=63187, cin=1, s=26099,co=1
2316 a=36639, b=63187, cin=1, s=    X,co=1
2317 a=36639, b=63187, cin=1, s=34291,co=1
2380 a=34936, b=22875, cin=1, s=34291,co=1
2381 a=34936, b=22875, cin=1, s=11548,co=1
2382 a=34936, b=22875, cin=1, s=11548,co=0
2383 a=34936, b=22875, cin=1, s= 8602,co=0
2384 a=34936, b=22875, cin=1, s=57812,co=0
2450 a=44607, b=44842, cin=0, s=57812,co=0
2451 a=44607, b=44842, cin=0, s=12771,co=0
2452 a=44607, b=44842, cin=0, s=12771,co=1
2453 a=44607, b=44842, cin=0, s=32065,co=1
2454 a=44607, b=44842, cin=0, s=23913,co=1
2520 a=14470, b= 3214, cin=0, s=23913,co=1
2521 a=14470, b= 3214, cin=0, s=26740,co=1
2522 a=14470, b= 3214, cin=0, s=26740,co=0
2523 a=14470, b= 3214, cin=0, s=    X,co=0
2524 a=14470, b= 3214, cin=0, s=    X,co=0
2525 a=14470, b= 3214, cin=0, s=17684,co=0
2590 a=39418, b=48166, cin=1, s=17684,co=0
2591 a=39418, b=48166, cin=1, s=21697,co=0
2592 a=39418, b=48166, cin=1, s=21697,co=1
2593 a=39418, b=48166, cin=1, s=    X,co=1
2594 a=39418, b=48166, cin=1, s=    X,co=1
2595 a=39418, b=48166, cin=1, s=    X,co=1
2597 a=39418, b=48166, cin=1, s=22049,co=1
2660 a=46243, b=43055, cin=1, s=22049,co=1
2661 a=46243, b=43055, cin=1, s=28529,co=1
2663 a=46243, b=43055, cin=1, s=    X,co=1
2664 a=46243, b=43055, cin=1, s=    X,co=1
2665 a=46243, b=43055, cin=1, s=    X,co=1
2666 a=46243, b=43055, cin=1, s=23763,co=1
2730 a=22111, b= 3396, cin=1, s=23763,co=1
2731 a=22111, b= 3396, cin=1, s= 6980,co=1
2732 a=22111, b= 3396, cin=1, s= 6980,co=0
2733 a=22111, b= 3396, cin=1, s=21378,co=0
2734 a=22111, b= 3396, cin=1, s=    X,co=0
2735 a=22111, b= 3396, cin=1, s=17316,co=0
2736 a=22111, b= 3396, cin=1, s=    X,co=0
2737 a=22111, b= 3396, cin=1, s=25508,co=0
2800 a=14027, b= 6886, cin=0, s=25508,co=0
2801 a=14027, b= 6886, cin=0, s= 5267,co=0
2803 a=14027, b= 6886, cin=0, s=    X,co=0
2804 a=14027, b= 6886, cin=0, s=20913,co=0
2870 a=49449, b=58093, cin=0, s=20913,co=0
2871 a=49449, b=58093, cin=0, s=24152,co=0
2872 a=49449, b=58093, cin=0, s=24152,co=1
2873 a=49449, b=58093, cin=0, s=    X,co=1
2874 a=49449, b=58093, cin=0, s=    X,co=1
2875 a=49449, b=58093, cin=0, s=    X,co=1
2877 a=49449, b=58093, cin=0, s=42006,co=1
2940 a=46693, b=58037, cin=1, s=42006,co=1
2941 a=46693, b=58037, cin=1, s=54019,co=1
2943 a=46693, b=58037, cin=1, s=    X,co=1
2944 a=46693, b=58037, cin=1, s=39227,co=1
2945 a=46693, b=58037, cin=1, s=    X,co=1
2946 a=46693, b=58037, cin=1, s=39195,co=1
11060 a=44521, b=35723, cin=1, s=31963,co=1
11061 a=44521, b=35723, cin=1, s=10347,co=1
11063 a=44521, b=35723, cin=1, s=    X,co=1
11064 a=44521, b=35723, cin=1, s=14709,co=1
11130 a=35803, b=17024, cin=0, s=14709,co=1
11131 a=35803, b=17024, cin=0, s=54861,co=1
11132 a=35803, b=17024, cin=0, s=54861,co=0
11133 a=35803, b=17024, cin=0, s=    X,co=0
11134 a=35803, b=17024, cin=0, s=52859,co=0
11135 a=35803, b=17024, cin=0, s=    X,co=0
11136 a=35803, b=17024, cin=0, s=52827,co=0
11200 a=56005, b=64048, cin=1, s=52827,co=0
11201 a=56005, b=64048, cin=1, s=10228,co=0
11202 a=56005, b=64048, cin=1, s=10228,co=1
11203 a=56005, b=64048, cin=1, s=    X,co=1
11204 a=56005, b=64048, cin=1, s=54518,co=1
11270 a=55910, b=47535, cin=1, s=54518,co=1
11271 a=55910, b=47535, cin=1, s=38858,co=1
11273 a=55910, b=47535, cin=1, s= 4998,co=1
11274 a=55910, b=47535, cin=1, s=    X,co=1
11275 a=55910, b=47535, cin=1, s=37398,co=1
11276 a=55910, b=47535, cin=1, s=    X,co=1
11277 a=55910, b=47535, cin=1, s=37910,co=1
11340 a=45048, b=44038, cin=1, s=37910,co=1
11341 a=45048, b=44038, cin=1, s=62497,co=1
11343 a=45048, b=44038, cin=1, s=56429,co=1
11344 a=45048, b=44038, cin=1, s=    X,co=1
11345 a=45048, b=44038, cin=1, s=23583,co=1
11346 a=45048, b=44038, cin=1, s=    X,co=1
11347 a=45048, b=44038, cin=1, s=24063,co=1
11348 a=45048, b=44038, cin=1, s=    X,co=1
11349 a=45048, b=44038, cin=1, s=23551,co=1
11410 a=14305, b=31893, cin=0, s=23551,co=1
11411 a=14305, b=31893, cin=0, s= 4980,co=1
11412 a=14305, b=31893, cin=0, s= 4980,co=0
11413 a=14305, b=31893, cin=0, s=    X,co=0
11414 a=14305, b=31893, cin=0, s=    X,co=0
11415 a=14305, b=31893, cin=0, s=    X,co=0
11416 a=14305, b=31893, cin=0, s=46198,co=0
11480 a=19808, b=24293, cin=0, s=46198,co=0
11481 a=19808, b=24293, cin=0, s=60551,co=0
11483 a=19808, b=24293, cin=0, s=    X,co=0
11484 a=19808, b=24293, cin=0, s=    X,co=0
11485 a=19808, b=24293, cin=0, s=    X,co=0
11487 a=19808, b=24293, cin=0, s=44101,co=0
11550 a=32100, b=14121, cin=1, s=44101,co=0
11551 a=32100, b=14121, cin=1, s=62860,co=0
11553 a=32100, b=14121, cin=1, s=    X,co=0
11554 a=32100, b=14121, cin=1, s=    X,co=0
11555 a=32100, b=14121, cin=1, s=46222,co=0
11620 a=21111, b= 5486, cin=1, s=46222,co=0
11621 a=21111, b= 5486, cin=1, s=47578,co=0
11623 a=21111, b= 5486, cin=1, s=62422,co=0
11624 a=21111, b= 5486, cin=1, s=    X,co=0
11625 a=21111, b= 5486, cin=1, s=26566,co=0
11626 a=21111, b= 5486, cin=1, s=    X,co=0
11627 a=21111, b= 5486, cin=1, s=26598,co=0
11690 a=47573, b=54632, cin=0, s=26598,co=0
11691 a=47573, b=54632, cin=0, s=19523,co=0
11692 a=47573, b=54632, cin=0, s=19523,co=1
11693 a=47573, b=54632, cin=0, s=19981,co=1
11694 a=47573, b=54632, cin=0, s=    X,co=1
11695 a=47573, b=54632, cin=0, s=36701,co=1
11696 a=47573, b=54632, cin=0, s=    X,co=1
11697 a=47573, b=54632, cin=0, s=36669,co=1
11760 a=  170, b=49935, cin=1, s=36669,co=1
11761 a=  170, b=49935, cin=1, s= 8228,co=1
11762 a=  170, b=49935, cin=1, s= 8228,co=0
11763 a=  170, b=49935, cin=1, s=    X,co=0
11764 a=  170, b=49935, cin=1, s=    X,co=0
11765 a=  170, b=49935, cin=1, s=50618,co=0
11766 a=  170, b=49935, cin=1, s=    X,co=0
11767 a=  170, b=49935, cin=1, s=50106,co=0
11830 a=48253, b=38286, cin=0, s=50106,co=0
11831 a=48253, b=38286, cin=0, s=10733,co=0
11832 a=48253, b=38286, cin=0, s=10733,co=1
11833 a=48253, b=38286, cin=0, s=  491,co=1
11834 a=48253, b=38286, cin=0, s=    X,co=1
11835 a=48253, b=38286, cin=0, s=20491,co=1
11836 a=48253, b=38286, cin=0, s=    X,co=1
11837 a=48253, b=38286, cin=0, s=21003,co=1
11900 a=19772, b=59049, cin=1, s=21003,co=1
11901 a=19772, b=59049, cin=1, s=53356,co=1
11902 a=19772, b=59049, cin=1, s=53356,co=0
11903 a=19772, b=59049, cin=1, s=28770,co=1
11904 a=19772, b=59049, cin=1, s=    X,co=1
11905 a=19772, b=59049, cin=1, s=13798,co=1
11906 a=19772, b=59049, cin=1, s=    X,co=1
11907 a=19772, b=59049, cin=1, s=13286,co=1
11970 a=53339, b=15535, cin=0, s=13286,co=1
11971 a=53339, b=15535, cin=0, s=29830,co=1
11973 a=53339, b=15535, cin=0, s=56514,co=1
11974 a=53339, b=15535, cin=0, s=    X,co=1
11975 a=53339, b=15535, cin=0, s= 3338,co=1

The highlighted simulation results show the addition of some random numbers. The average delay across the selected sample of the 5000 results were 4s, 5s, 6s, 7s, 9s. The average delay was 6.2s which was almost the thrice of the critical path delay which was 2s. 


I have achieved the 5000 simulation results by writing a for loop that started a 0 and went up to 5000 and created 5000 random numbers. I used the $random function in Verilog and in the for loop I made a = $random and b = $random and left my c to be constant. By doing this I have achieved 5000 random inputs which I then simulated and put the results into a text file. I then randomly selected some of the results starting at 300s, then 700s, 2000s, 11000s. I then calculated the delay and averaged them together for both the adder.  



