
caller:		addi 	$a0, $zero, 30		# initialize argument register $a0 with n = 18
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
	sw   $zero, 0($a1) #fib[0] = 0
	addi $t0, $0, 1
	addi $a1, $a1, 4 # $a1 = fib[1]
	sw   $t0, 0($a1)
	addi $a1, $a1, 4 #$a1 = fib[2], now do normal computation where fib[ i ] = fib[ i - 1] + fib[ i - 2 ]
	addi $t0, $t0, 1 #$t0 = 2
LOOP:	beq  $t0, $a0, EXIT #while t0 != a1, compute fib numbers
	lw   $t1, -4($a1) # $t1 = fib[ i - 1 ]
	lw   $t2, -8($a1) # $t1 = fib[ i - 2 ]
	add  $t3, $t1, $t2 # $t3 = fib[ i - 1 ] + fib[ i - 2 ]
	sw   $t3, 0($a1)
	addi $t0, $t0, 1 #increment t0 
	addi $a1, $a1, 4
	
	j LOOP

EXIT:	jr $ra

##############################################################################

exit:		
