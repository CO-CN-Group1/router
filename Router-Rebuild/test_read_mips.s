	.file	1 ""
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	li	$2,-1157627904			# 0xffffffffbb000000
	ori	$2,$2,0x1ff
	movz	$31,$31,$0
	sw	$2,8($fp)
$L3:
	nop
$L2:
	lw	$2,8($fp)
	nop
	lbu	$2,0($2)
	nop
	andi	$2,$2,0x00ff
	beq	$2,$0,$L2
	nop

	li	$2,-1157627904			# 0xffffffffbb000000
	ori	$2,$2,0x1fc
	sw	$2,12($fp)
	li	$2,-1157627904			# 0xffffffffbb000000
	ori	$2,$2,0x1fd
	sw	$2,16($fp)
	li	$2,-1157627904			# 0xffffffffbb000000
	ori	$2,$2,0x1fe
	sw	$2,20($fp)
	lw	$2,8($fp)
	nop
	sb	$0,0($2)
	b	$L3
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"