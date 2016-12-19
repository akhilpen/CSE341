.text
	#dividend= t0
	#divisor= t1
	#quotient= t4
	#reminder= t3

main:
	lui $a0,0x1001 #prompt for dividend input
	addi $v0,$0,4
	syscall

	addi $v0,$0,5          #input dividend from the user
	syscall

	add $t0,$0,$v0      #t0 =dividend
	add $t3,$0,$v0      #moving dividend to reminder $t3

	addi $a0,$a0,16    #prompt for divisor input
	addi $v0,$0,4
	syscall

	addi $v0,$0,5          #input divisor from the user
	syscall

	add $t1,$0,$v0      #moving divisor to t1
	sll $t1,$t1,16     #adjusting the divisor

	addi $t4,$0,0          #quotient
	addi $t6,$0,0          #initiaising counter

loop:
	addi $t6,$t6,1    #counting
	sub  $t3,$t3,$t1  #subtracting divisor from dividend/reminder
	bgtz $t3,more    #checking if reaminder is greater or equal to 0
        add $0, $0, $0 
less:
	add $t3,$t3,$t1   #adjusting reminder by adding divisor
	sll $t4,$t4,1     #shift quotient left by 1 bit
	srl $t1,$t1,1     #shift divisor right by 1 bit
        slt $t7,$t6,17
	beq $t7, $0,loop
	#blt $t6,17,loop    #the loop should run for 16 times
	add $0, $0, $0    #nop
	j end             #jump to end if loop hasnt run for 16 times

more:
	sll $t4,$t4,1     #shift quotient left by 1 bit
	or   $t4,1        #set the rightmost bit to 1
	srl $t1,$t1,1     #shift divisor right by 1 bit
        slt $t7,$t6,17
	beq $t7, $0,loop
	#blt $t6,17,loop    #the loop should run for 16 times
        add $0,$0, $0
	#nop
	j end             #jump to end if loop hasnt run for 16 times

end:
	addi $a0,$a0,16   #quotient prompt
	add $a1,$0,$a0
	addi $v0,$0,4
	syscall


	add $a0,$0,$t4      #moving quotient to a0
	addi $v0,$0,1          #displaying quotient
	syscall

	add $a0,$0,$a1   #reminder prompt
        addi $v0, $0, 4
	#li $v0,4
	syscall

	add $a0,$0,$t3      #moving reminder to a0
	addi $v0,$0,1          #displaying reminder
	syscall


	j main

	.data
dividend:	 .asciiz "Enter dividend\n"
divisor:	 .asciiz "Enter divisor\n"
reminder:	 .asciiz "\nThe reminder is:\n"
quotient:	 .asciiz "\nThe quotient is:\n"
space:	 .asciiz "\n"
	
