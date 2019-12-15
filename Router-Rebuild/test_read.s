	.file	"test_read.cpp"
	.text
	.section	.rodata
.LC0:
	.string	"has packet"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$3137339903, %eax
	movq	%rax, -32(%rbp)
.L3:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	sete	%al
	testb	%al, %al
	je	.L2
	jmp	.L3
.L2:
	movl	$3137339900, %eax
	movq	%rax, -24(%rbp)
	movl	$3137339901, %eax
	movq	%rax, -16(%rbp)
	movl	$3137339902, %eax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
