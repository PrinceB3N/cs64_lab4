# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here
prompt: .asciiz "Enter a number:\n"
factorial: .asciiz "Factorial of "
appendfactorial: .asciiz " is:\n"
#Text Area (i.e. instructions)
.text
main:
	
	# TODO: Write your code here
	li $v0, 4
	la $a0, prompt
	syscall
	
	#getiterations
	li $v0, 5
	syscall
	move $t0, $v0
	#t1=output
	li $t1, 1

	#t2 = iteration tracker
	li $t2, 2
loop:	
	#check if break out loop
	bgt $t2, $t0, exit

	#multiply t1 with iteration tracker and store it
	mult $t1, $t2
	mflo $t1

	#increment t2
	addi $t2, $t2, 1
	j loop
exit:
	li $v0, 4
	la $a0, factorial
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, appendfactorial
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
