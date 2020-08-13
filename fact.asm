## Factorial in MIPS assembly
# by tasakos

		
	.globl main
	.data	
		inputMessage: .asciiz "Enter an integer:\n"
		message1: .asciiz "The factorial of number "
		message2: .asciiz " is "
	
	
	.text
main:
	#read integer
	la $a0, inputMessage
	li $v0, 4
	syscall	
	li $v0,5
	syscall
	add $t0,$v0,$0
	#Print the message1
	la $a0, message1
	li $v0 ,4
	syscall
	#Print the argument of factorial
	add $a0 ,$0, $t0
	li $v0 1
	syscall
	#Call procedure Factorial
	jal factorial
	#Keep the result of factorial to use later
	add $t1,$v0,$0
	#Print the message1
	la $a0, message2
	li $v0 ,4
	syscall 
	add $a0,$t1,$0
	li $v0 1
	syscall
	#Tell to OS that the Program ended
	li $v0, 10
	syscall

factorial:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0,$a0,1
	beq $t0,$0,else
	addi $v0,$0,1
	addi $sp,$sp,8
	jr $ra
	
else:
	addi $a0, $a0, -1
	jal factorial
	lw $ra,4($sp)
	lw $a0, 0($sp)
	addi $sp,$sp,8
	mul $v0,$a0,$v0
	jr $ra
