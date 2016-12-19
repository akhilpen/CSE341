.text

	#dividend= t0
	#divisor= t1
	#quotient= t4
	#reminder= t3

main:
	la $a0,0x10010000   #prompt for dividend input
	li $v0,4
	syscall

	li $v0,5          #input dividend from the user
	syscall

	move $t0,$v0      #t0 =dividend
	move $t3,$v0      #moving dividend to reminder $t3

	la $a0,0x10010011   #prompt for divisor input
	li $v0,4
	syscall

	li $v0,5          #input divisor from the user
	syscall

	move $t1,$v0      #moving divisor to t1
	sll $t1,$t1,16     #adjusting the divisor

	li $t4,0          #quotient
	li $t6,0          #initiaising counter

loop:
	addi $t6,$t6,1    #counting
	sub  $t3,$t3,$t1  #subtracting divisor from dividend/reminder
	bge $t3,0,more    #checking if reaminder is greater or equal to 0

less:
	add $t3,$t3,$t1   #adjusting reminder by adding divisor
	sll $t4,$t4,1     #shift quotient left by 1 bit
	srl $t1,$t1,1     #shift divisor right by 1 bit
	blt $t6,17,loop    #the loop should run for 16 times
	nop
	j end             #jump to end if loop hasnt run for 16 times

more:
	sll $t4,$t4,1     #shift quotient left by 1 bit
	or   $t4,1        #set the rightmost bit to 1
	srl $t1,$t1,1     #shift divisor right by 1 bit
	blt $t6,17,loop    #the loop should run for 16 times
	nop
	j end             #jump to end if loop hasnt run for 416times

end:
	la $a0,0x10010034   #quotient prompt
	li $v0,4
	syscall

	la $a0,space      #creates new line
	li $v0,4
	syscall

	move $a0,$t4      #moving quotient to a0
	li $v0,1          #displaying quotient
	syscall

	la $a0,0x10010022   #reminder prompt
	li $v0,4
	syscall



	move $a0,$t3      #moving reminder to a0
	li $v0,1          #displaying reminder
	syscall





	j main

	.data
dividend:	 .asciiz "Enter dividend:\n"
divisor:	 .asciiz "Enter divisor:\n"
reminder:	 .asciiz "\nThe reminder is: "
quotient:	 .asciiz "The quotient is: "
space:	 .asciiz "\n"
	
