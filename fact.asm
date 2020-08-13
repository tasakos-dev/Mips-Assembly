	.globl main
	
	
	.text
main:
	addi $a0 ,$0, 3
	jal factorial
	add $a0,$v0,$0
	li $v0 1
	syscall
	li $v0, 10
	syscall

factorial:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0,$a0,1
	beq $t0,$0,Else
	addi $v0,$0,1
	addi $sp,$sp,8
	jr $ra
	
Else:
	addi $a0, $a0, -1
	jal factorial
	lw $ra,4($sp)
	lw $a0, 0($sp)
	addi $sp,$sp,8
	mul $v0,$a0,$v0
	jr $ra

	

		
		

		
	
	
