
caller:		addi 	$a0, $zero, 18		# initialize argument register $a0 with n = 18
#######		#addi 	$a1, $zero, 0x100100A0	# this instruction is treated as a pseudo instruction, replace it with the proper basic MIPS instructions
		lui	$a1, 4097
		ori	$a1, 160
		jal	fib_seq			# call fib_seq
next:		j	exit

##############################################################################
# This routine generates Fibonacci sequence fib(0), fib(1), fib(2), ... fib(n)
# and stores it into the data segment starting at memory address 0x100100A0
# which is pointed at by register $a1

fib_seq:
####################### Insert Your Code Here ################################
	
	addi $a0, $a0, 1
	addi $sp, $sp, -8
	sw   $ra, 4($sp)
	sw   $a0, 0($sp)
	add  $t0, $0, $a0
	add  $a0, $0, $0
LOOP:	beq  $a0, $t0, END
	jal FIB
	lw   $t0, 0($sp)
	sw   $v0, 0($a1)
	addi $a1, $a1, 4
	addi $a0, $a0, 1
	j LOOP

END:	lw   $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra


FIB:    addi $sp $sp, -12
        sw $a0, 8($sp)
        sw $ra, 4($sp)
        sw $t1, 0($sp)
        bne $a0, $0, ELSEIF #n==0, return $v0 = 0
        add $v0 $0, $0
        j EXIT
ELSEIF: addi $t0, $0, 1 #$t0 == 1 for comparison
        bne $t0, $a0, ELSE # if $a0 == 1, add to $v0 and EXIT
        add $v0, $0, $t0
        j EXIT
ELSE:   addi $a0, $a0, -1 #$a0 = n - 1
        jal FIB
        add $t1, $v0, $0 #save fib(n - 1) in $t1
        addi $a0, $a0, -1 #$a0 now = n - 2
        jal FIB #$v0 now has fib(n-1)
        add $v0, $v0, $t1 # $v0 = fib(n-1) + fib(n-2)
EXIT:	lw $a0, 8($sp)
        lw $ra, 4($sp)
        lw $t1, 0($sp)
        addi $sp, $sp, 12
        jr $ra




##############################################################################

exit:		
