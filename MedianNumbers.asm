# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

next:	.asciiz "Enter the next number:\n"

median:	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here
	li $v0,4
	la $a0,next
	syscall

	li $v0,5
	syscall
	move $t0,$v0

	li $v0, 4
	la $a0, next
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	blt $t0, $t1, lastcompare
	#else switch t0, t1 
	move $t6, $t1
	move $t1, $t0
	move $t0, $t6

lastcompare:
	li $v0, 4
	la $a0, next
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 4
	la $a0, median
	syscall

	blt $t2, $t0, firstmedian
	blt $t1, $t2, secondmedian
	j thirdmedian
firstmedian:
	li $v0, 1
	move $a0, $t0
	syscall
	j exit
secondmedian:
	li $v0, 1
	move $a0, $t1
	syscall
	j exit
thirdmedian:
	li $v0, 1
	move $a0, $t2
	syscall
exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
