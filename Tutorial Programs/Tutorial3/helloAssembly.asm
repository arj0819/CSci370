#.data section contains all of the data of the program
.data
	myMessage:		.asciiz "Hello, World!\n"
	myCharacter:	.byte 'm'
	newline:			.byte '\n'
	age:			.word 22
	PI:				.float 3.14
	myDouble:		.double 7.202
	zeroDouble:		.double 0.0
	
	number1:	.word 20
	number2: 	.word 8
	
	message: 	.asciiz "Hi everybody. \nMy name is Aaron.\n"

#.text section contains all of the instructions that the program needs
.text
	main:
	li $v0, 4
	la $a0, myMessage
	syscall
	
	li $v0, 4
	la $a0, myCharacter
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 1
	lw $a0, age
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0 2
	lwc1 $f12, PI
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	ldc1  $f2, myDouble
	ldc1  $f0, zeroDouble
	li 	  $v0, 3
	add.d $f12, $f2, $f0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	lw $t0, number1($zero)
	lw $t1, number2($zero)
	add $t2, $t0, $t1 #t2 = t0 + t1
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	lw $s0, number1	# s0 = 20
	lw $s1, number2 # s1 = 8
	sub $t0, $s0, $s1 #t0 = s0 - s1
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, message
	syscall
	
	
	
