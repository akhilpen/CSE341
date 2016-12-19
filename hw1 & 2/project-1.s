.data
v:	 .half 3
w:	 .half 15
x:	 .half 231
y:	 .half 100
z:	 .half 25
blank:	 .space 2
postfix:	 .space 120
exp:	 .asciiz "v=3*x-y+17"

	.text
main:
	addi $sp,$sp,-120         #creating a stack
	lui $s1,0x1000            #point s1 to beginning of expression
	ori $s1,$s1,0x0086
	lui $s0,0x1000            #point s0 to beginning of postfix
	ori $s0,$s0,0x000c
	lui $s3,0x1000            #point s3 to beginning of postfix
	ori $s3,$s0,0x000c
	j exploop                 #jump to begnning of exploop
	add $0,$0,$0

addsub:	                  #set the prioity of addition/subtraction
	addi $v0,$0,1            #set priority to 1
	add $0,$0,$0             #nop
	jr $ra                   #jump back to operator
	add $0,$0,$0             #nop

array:
	sw $a0,0($s0)
	lw $t3,0($s0)
	add $0,$0,$0
	add $0,$0,$0
	addi $s0,$s0,4
	jr $ra
	add $0,$0,$0

array1:
	sw $s5,0($s0)
	addi $s0,$s0,4
	j character
	add $0,$0,$0

ascii:
	add $s5,$0,$0
	j asci
asc:
	add $t3,$0,$0
mularray:
	add $t3,$t3,$s5
	addi $t4,$t4,-1
	bne $t4,0,mularray
	add $0,$0,$0
	add $s5,$0,$t3
asci:
	addi $t4,$0,10
	addi $a0,$a0,-48
	add $s5,$s5,$a0
	lb $s2,($s1)              #first bit of exp
	add $0,$0,$0
	add $0,$0,$0
	addi $s1,$s1,1
	add $a0,$0,$s2            #passing first bit as argument
	addi $t3,$0,47


	slt $t8, $t3, $a0
	beq $t8,0, array1
	add $0,$0,$0

	addi $t3,$0,58

	slt $t8, $a0, $t3
	beq $t8,0, array1

	add $0,$0,$0
	j asc
	add $0,$0,$0

character:
	beq $a0,118,vv
	add $0,$0,$0     #nop
	beq $a0,119,wv
	add $0,$0,$0     #nop
	beq $a0,120,xv
	add $0,$0,$0     #nop
	beq $a0,121,yv
	add $0,$0,$0     #nop
	beq $a0,122,zv
	add $0,$0,$0     #nop
	beq $a0,42,checkstack
	add $0,$0,$0     #nop
	beq $a0,43,checkstack
	add $0,$0,$0     #nop
	beq $a0,45,checkstack
	add $0,$0,$0     #nop
	beq $a0,47,checkstack
	add $0,$0,$0     #nop
	beq $a0,94,checkstack
	add $0,$0,$0     #nop
	beq $a0,37,checkstack
	add $0,$0,$0     #nop
	beq $a0,40,push
	add $0,$0,$0     #nop
	beq $a0,41,rightparan
	add $0,$0,$0
	beq $a0,0,expend
	j ascii
	add $0,$0,$0

checkstack:
	lw $t0,0($sp)
	add $0,$0,$0     #nop
	add $0,$0,$0
	beq $t0,0,push       #empty stack
	add $0,$0,$0     #nop
	bne $t0,0,precedence
	add $0,$0,$0     #nop

exploop:
	lb $s2,($s1) #first bit of exp
	add $0,$0,$0
	add $0,$0,$0
	addi $s1,$s1,1
	add $a0,$0,$s2   #passing first bit as argument
	beq $s2,0,expend
	add $0,$0,$0     #nop
	jal character
	add $0,$0,$0     #nop
	j exploop
	add $0,$0,$0     #nop

expend:
	jal pop
	add $0,$0,$0     #nop
	add $a0,$v1,$0
	jal array
	add $0,$0,$0     #nop
	bne $a0,0,expend
	add $0,$0,$0     #nop
	j postmain
	add $0,$0,$0     #nop

exponent:
	addi $v0,,$0,3
	add $0,$0,$0     #nop
	jr $ra
	add $0,$0,$0     #nop

lowprecedence:
	addi $sp,$sp,4
	jal push
	add $0,$0,$0
	j exploop
	add $0,$0,$0

muldivmod:
	addi $v0,,$0,2
	add $0,$0,$0     #nop
	jr $ra
	add $0,$0,$0     #nop

operator:
	beq $a2,94,exponent
	add $0,$0,$0     #nop
	beq $a2,42,muldivmod
	add $0,$0,$0     #nop
	beq $a2,43,addsub
	add $0,$0,$0     #nop
	beq $a2,45,addsub
	add $0,$0,$0     #nop
	beq $a2,47,muldivmod
	add $0,$0,$0     #nop
	beq $a2,37,muldivmod
	add $0,$0,$0     #nop
	beq $a2,0,zero
	add $0,$0,$0     #nop
	beq $a2,40,zero
	add $0,$0,$0     #nop

push:	              #pushing onto stack
	addi $sp,$sp,4
	sw $a0,0($sp)
	jr $ra
	add $0,$0,$0     #nop

precedence:
	jal pop
	add $0,$0,$0     #nop
	add $a2,$0,$v1
	jal operator   # gets precedence
	add $0,$0,$0
	add $t5,$0,$v0
	add $a2,$0,$a0     #precedence of input charecter
	jal operator
	add $0,$0,$0
	add $t6,$0,$v0
	slt $t3, $t5, $t6
	bne $t3,0,lowprecedence
	add $0,$0,$0     #nop
	 # high precedence
	sw $v1,0($s0)
	addi $s0,$s0,4
	j precedence
	add $0,$0,$0

pop:
	lw $v1,0($sp)
	add $0,$0,$0     #nop
	add $0,$0,$0
	addi $sp,$sp,-4
	jr $ra
	add $0,$0,$0     #nop

rightparan:
	jal pop
	add $0,$0,$0     #nop
	add $t7,$v1,$0
	beq $t7,40,exploop
	add $0,$0,$0     #nop
	add $a0,$0,$t7
	jal array
	add $0,$0,$0     #nop
	j rightparan
	add $0,$0,$0     #nop

zero:
	addi $v0,$0,0
	add $0,$0,$0     #nop
	jr $ra
	add $0,$0,$0

postmain:
	lw $a0,0($s3)
	add $0,$0,$0     #nop
	add $0,$0,$0
	addi $s3,$s3,4
	jal newcharecter
	add $0,$0,$0     #nop
	bne $a0,0,postmain
	add $0,$0,$0     #nop
	j end
	add $0,$0,$0     #nop

newcharecter:
	beq $a0,42,operation
	add $0,$0,$0     #nop
	beq $a0,43,operation
	add $0,$0,$0     #nop
	beq $a0,45,operation
	add $0,$0,$0     #nop
	beq $a0,47,operation
	add $0,$0,$0     #nop
	beq $a0,94,operation
	add $0,$0,$0     #nop
	beq $a0,37,operation
	add $0,$0,$0     #nop
	beq $a0,0,end
	add $0,$0,$0     #nop
	j push
	add $0,$0,$0

variable:
	beq $a0,118,vv
	add $0,$0,$0     #nop
	beq $a0,119,wv
	add $0,$0,$0     #nop
	beq $a0,120,xv
	add $0,$0,$0     #nop
	beq $a0,121,yv
	add $0,$0,$0     #nop
	beq $a0,122,zv
	add $0,$0,$0     #nop

vv:
	lui $t2,0x1000
	ori $t2,$t2,0x0000
	#la $t2,v
	add $0,$0,$0     #nop
	lhu $a0,($t2)
	add $0,$0,$0
	add $0,$0,$0
	j array
	add $0,$0,$0     #nop

wv:
	lui $t2,0x1000
	ori $t2,$t2,0x0002
	#la $t2,w
	add $0,$0,$0     #nop
	lhu $a0,($t2)
	add $0,$0,$0
	add $0,$0,$0
	j array
	add $0,$0,$0     #nop

xv:
	lui $t2,0x1000
	ori $t2,$t2,0x0004
	#la $t2,x
	add $0,$0,$0     #nop
	lhu $a0,($t2)
	add $0,$0,$0
	add $0,$0,$0
	j array
	add $0,$0,$0     #nop

yv:
	lui $t2,0x1000
	ori $t2,$t2,0x0006
	#la $t2,y
	add $0,$0,$0     #nop
	lhu $a0,($t2)
	add $0,$0,$0
	add $0,$0,$0
	j array
	add $0,$0,$0     #nop

zv:
	lui $t2,0x1000
	ori $t2,$t2,0x0008
	#la $t2,z
	add $0,$0,$0     #nop
	lhu $a0,($t2)
	add $0,$0,$0
	add $0,$0,$0
	j array
	add $0,$0,$0     #nop

operation:
	jal pop
	add $0,$0,$0     #nop
	add $a1,$0,$v1
	jal pop
	add $0,$0,$0     #nop
	add $a2,$0,$v1
	beq $a0,42,multiply
	add $0,$0,$0     #nop
	beq $a0,43,addition
	add $0,$0,$0     #nop
	beq $a0,45,subtraction
	add $0,$0,$0     #nop
	beq $a0,47,divison
	add $0,$0,$0     #nop
	beq $a0,94,expo
	add $0,$0,$0     #nop
	beq $a0,37,modulus
	add $0,$0,$0     #nop

multiply:
	add $t3,$0,$0
multi:
	add $t3,$t3,$a2
	addi $a1,$a1,-1
	bne $a1,0,multi
	add $a0,$0,$t3
	jal push
	add $0,$0,$0     #nop
	j postmain
	add $0,$0,$0

expo:
	addi $t2,$a1,-1
	add $t1,$0,$a2
expon:
	mult $a2,$t1
	mflo $t1
	addi $t2,$t2,-1
	bne $t2,0,expon
	add $0,$0,$0
	mflo $a0
	jal push
	add $0,$0,$0     #nop
	j postmain
	add $0,$0,$0

addition:
	add $a0,$a1,$a2
	jal push
	add $0,$0,$0     #nop
	j postmain
	add $0,$0,$0

subtraction:
	sub $a0,$a2,$a1
	jal push
	add $0,$0,$0
	j postmain
	add $0,$0,$00

divison:
	add $t3,$0,$a2
	add  $t1,$0,$a1         #moving divisor to t1
	sll  $t1,$t1,16         #adjusting the divisor
	add  $t4,$0,$0          #quotient
	addi $t6,$0,17          #initiaising counter to 17
loop:
	addi $t6,$t6,-1         #counting
	sub  $t3,$t3,$t1        #subtracting divisor from dividend/reminder
	bgez $t3,more           #checking if reaminder is greater or equal to 0
	and  $0,$0,$0           #nop
less:
	add  $t3,$t3,$t1       #adjusting reminder by adding divisor
	sll  $t4,$t4,1         #shift quotient left by 1 bit
	srl  $t1,$t1,1         #shift divisor right by 1 bit
	bgtz $t6,loop          #run the loop for 16 times
	add  $0,$0,$0          #nop
	j    divisionend               #jump to end after 16 loops
	and  $0,$0,$0          #nop
more:
	sll  $t4,$t4,1         #shift quotient left by 1 bit
	or   $t4,1             #set the rightmost bit to 1
	srl  $t1,$t1,1         #shift divisor right by 1 bit
	bgtz $t6,loop          #run the loop for 16 times
	add  $0,$0,$0          #nop
	j    divisionend               #jump to end after 16 loops
	and  $0,$0,$0
divisionend:
	add $a0,$0,$t4
	jal push
	add $0,$0,$0
	j postmain
	add $0,$0,$0

modulus:
	add $t3,$0,$a2      #dividend/reminder
	add  $t1,$0,$a1         #moving divisor to t1
	sll  $t1,$t1,16         #adjusting the divisor
	add  $t4,$0,$0          #quotient
	addi $t6,$0,17          #initiaising counter to 17
modloop:
	addi $t6,$t6,-1         #counting
	sub  $t3,$t3,$t1        #subtracting divisor from dividend/reminder
	bgez $t3,modmore           #checking if reaminder is greater or equal to 0
	and  $0,$0,$0           #nop
modless:
	add  $t3,$t3,$t1       #adjusting reminder by adding divisor
	sll  $t4,$t4,1         #shift quotient left by 1 bit
	srl  $t1,$t1,1         #shift divisor right by 1 bit
	bgtz $t6,modloop          #run the loop for 16 times
	add  $0,$0,$0          #nop
	j    modend               #jump to end after 16 loops
	and  $0,$0,$0          #nop
modmore:
	sll  $t4,$t4,1         #shift quotient left by 1 bit
	or   $t4,1             #set the rightmost bit to 1
	srl  $t1,$t1,1         #shift divisor right by 1 bit
	bgtz $t6,modloop          #run the loop for 16 times
	add  $0,$0,$0          #nop
	j    modend               #jump to end after 16 loops
	and  $0,$0,$0
modend:
	add $a0,$0,$t3
	jal push
	add $0,$0,$0
	j postmain
	add $0,$0,$0

end:
	lhu $a3,($sp)
	add $0,$0,$0
	add $0,$0,$0
	lui $s1,0x1000 #loding the address of first variable
	ori $s1,$s1,0x0084

	beq $a0,118,vs       #if v jump to array
	add $0,$0,$0     #nop
	beq $a0,119,ws       #if w jump to array
	add $0,$0,$0     #nop
	beq $a0,120,xs       #if x jump to array
	add $0,$0,$0     #nop
	beq $a0,121,ys       #if y jump to array
	add $0,$0,$0     #nop
	beq $a0,122,zs      #if z jump to array
	add $0,$0,$0     #nop


ws:
	lui $t2,0x1000
	ori $t2,$t2,0x0000
	sh  $a3,0($t2)
	j final

vs:
	lui $t2,0x1000
	ori $t2,$t2,0x0002
	sh  $a3,0($t2)
	j final

xs:
	lui $t2,0x1000
	ori $t2,$t2,0x0004
	sh  $a3,0($t2)
	j final
ys:
	lui $t2,0x1000
	ori $t2,$t2,0x0006
	sh  $a3,0($t2)
	j final

zs:
	lui $t2,0x1000
	ori $t2,$t2,0x0008
	sh  $a3,0($t2)
	j final
final:
	add $v0,$0,10
	syscall
