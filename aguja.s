	.file	"aguja.c"
	.text
	.p2align 4
	.globl	move
	.type	move, @function
move:
.LFB23:
	.cfi_startproc
	movl	dir(%rip), %eax
	cmpl	$3, %eax
	je	.L2
	jg	.L3
	cmpl	$1, %eax
	je	.L4
	cmpl	$2, %eax
	jne	.L9
	addl	$1, c(%rip)
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	cmpl	$4, %eax
	jne	.L10
	subl	$1, c(%rip)
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	subl	$1, r(%rip)
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	addl	$1, r(%rip)
	ret
.L9:
	ret
	.cfi_endproc
.LFE23:
	.size	move, .-move
	.p2align 4
	.globl	pop
	.type	pop, @function
pop:
.LFB24:
	.cfi_startproc
	movslq	current(%rip), %rcx
	movl	4+null(%rip), %esi
	leaq	stack(%rip), %rdx
	movl	%esi, (%rdx,%rcx,4)
	movq	%rcx, %rax
	testl	%ecx, %ecx
	je	.L12
	subl	$1, %eax
	movl	%eax, current(%rip)
.L12:
	ret
	.cfi_endproc
.LFE24:
	.size	pop, .-pop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"\n%d:%s"
.LC2:
	.string	"^"
.LC3:
	.string	"dir: %d, d: %d \n"
.LC4:
	.string	"r: %d, c: %d\n"
.LC5:
	.string	"instruction: %d\n"
.LC6:
	.string	"stack: %d, current %d\n"
.LC7:
	.string	" %c"
.LC8:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	movabsq	$12884901892, %rdx
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1800, %rsp
	.cfi_def_cfa_offset 1856
	movq	8(%rsi), %rdi
	leaq	.LC0(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 1784(%rsp)
	movabsq	$4294967298, %rax
	movq	%rdx, 24(%rsp)
	leaq	496(%rsp), %rbp
	movq	%rdx, 32(%rsp)
	movq	$3, 80(%rsp)
	movq	$1, 88(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rax, 40(%rsp)
	movabsq	$17179869187, %rax
	movq	%rax, 48(%rsp)
	movabsq	$8589934593, %rax
	movq	%rax, 56(%rsp)
	movabsq	$17179869184, %rax
	movq	%rax, 64(%rsp)
	movabsq	$8589934592, %rax
	movq	%rax, 72(%rsp)
	call	fopen@PLT
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%r13, %rdi
	movq	%r14, %rdx
	movl	$128, %esi
	movl	%r13d, %ebx
	salq	$7, %rdi
	addq	$1, %r13
	addq	%rbp, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L17
	leaq	.L28(%rip), %r13
	leaq	.LC1(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L77:
	cmpq	$0, 16(%r12)
	jne	.L100
.L18:
	movl	c(%rip), %esi
	movslq	r(%rip), %rax
	cmpl	$-1, %esi
	je	.L101
	cmpl	%eax, %ebx
	je	.L80
.L25:
	movq	%rax, %rdx
	movslq	%esi, %rcx
	salq	$7, %rdx
	leaq	1792(%rdx), %rdi
	leaq	(%rsp,%rdi), %rdx
	movzbl	-1296(%rcx,%rdx), %ecx
	leal	-10(%rcx), %edx
	cmpb	$116, %dl
	ja	.L26
	movzbl	%dl, %edx
	movslq	0(%r13,%rdx,4), %rdx
	addq	%r13, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L28:
	.long	.L58-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L51-.L28
	.long	.L57-.L28
	.long	.L56-.L28
	.long	.L55-.L28
	.long	.L54-.L28
	.long	.L53-.L28
	.long	.L84-.L28
	.long	.L26-.L28
	.long	.L51-.L28
	.long	.L50-.L28
	.long	.L49-.L28
	.long	.L48-.L28
	.long	.L47-.L28
	.long	.L46-.L28
	.long	.L45-.L28
	.long	.L44-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L43-.L28
	.long	.L42-.L28
	.long	.L41-.L28
	.long	.L40-.L28
	.long	.L39-.L28
	.long	.L38-.L28
	.long	.L37-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L36-.L28
	.long	.L35-.L28
	.long	.L26-.L28
	.long	.L34-.L28
	.long	.L33-.L28
	.long	.L32-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L31-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L30-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L26-.L28
	.long	.L29-.L28
	.long	.L26-.L28
	.long	.L99-.L28
	.section	.text.startup
.L40:
	movslq	current(%rip), %rdx
	leaq	stack(%rip), %r8
	leal	-1(%rdx), %eax
	cltq
	movl	(%r8,%rax,4), %ecx
	cmpl	%ecx, (%r8,%rdx,4)
	sete	%dl
	movzbl	%dl, %edx
	movl	%edx, (%r8,%rax,4)
.L99:
	xorl	%eax, %eax
	call	pop
	.p2align 4,,10
	.p2align 3
.L51:
	movl	$1, %edi
	call	move
	cmpl	$1, dir(%rip)
	jne	.L77
	cmpl	$-1, r(%rip)
	jne	.L77
	leal	-1(%rbx), %eax
	movl	%eax, r(%rip)
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L101:
	movslq	%eax, %rcx
	salq	$7, %rcx
	cmpb	$10, 495(%rsp,%rcx)
	je	.L22
	addq	%rbp, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%edx, %esi
	addq	$1, %rdx
	cmpb	$10, -1(%rcx,%rdx)
	jne	.L23
	movl	%esi, c(%rip)
.L22:
	cmpl	%eax, %ebx
	jne	.L58
	movl	c(%rip), %esi
.L80:
	movl	$0, r(%rip)
	xorl	%eax, %eax
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L100:
	movl	$1, %edi
	xorl	%r14d, %r14d
	call	sleep@PLT
	movslq	r(%rip), %rdx
	xorl	%eax, %eax
	movq	%r15, %rdi
	movq	%rdx, %rsi
	salq	$7, %rdx
	addq	%rbp, %rdx
	call	printf@PLT
	cmpl	$-1, c(%rip)
	jl	.L20
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$32, %edi
	call	putchar@PLT
	movl	%r14d, %eax
	addl	$1, %r14d
	cmpl	%eax, c(%rip)
	jge	.L19
.L20:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	d(%rip), %edx
	movl	dir(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdi
	call	printf@PLT
	movl	c(%rip), %edx
	movl	r(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdi
	call	printf@PLT
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	leaq	.LC5(%rip), %rdi
	salq	$7, %rax
	addq	$1792, %rax
	addq	%rsp, %rax
	movsbl	-1296(%rdx,%rax), %esi
	xorl	%eax, %eax
	call	printf@PLT
	movslq	current(%rip), %rax
	leaq	stack(%rip), %r8
	leaq	.LC6(%rip), %rdi
	movl	(%r8,%rax,4), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L18
.L26:
	movl	current(%rip), %eax
	movsbl	%cl, %esi
	leal	-48(%rsi), %edx
	addl	$1, %eax
	cmpb	$58, %cl
	jle	.L71
	leal	-61(%rsi), %edx
	cmpb	$90, %cl
	jg	.L71
	leal	-55(%rsi), %edx
.L71:
	leaq	stack(%rip), %r8
	movslq	%eax, %rcx
	movl	%edx, (%r8,%rcx,4)
	movl	%eax, current(%rip)
	jmp	.L51
.L29:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cltq
	movl	64(%rsp,%rax,4), %eax
	movl	%eax, dir(%rip)
	jmp	.L51
.L30:
	movl	$3, dir(%rip)
	jmp	.L51
.L31:
	movl	current(%rip), %edx
	leaq	stack(%rip), %r8
	leal	1(%rdx), %eax
	movslq	%eax, %rcx
	movl	%edx, (%r8,%rcx,4)
	movl	%eax, current(%rip)
	jmp	.L51
.L32:
	movslq	current(%rip), %rax
	leaq	stack(%rip), %r8
	movl	(%r8,%rax,4), %edi
	call	putchar@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L33:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cltq
	movl	80(%rsp,%rax,4), %eax
	movl	%eax, dir(%rip)
	jmp	.L51
.L34:
	movl	$1, dir(%rip)
	jmp	.L51
.L35:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cltq
	movl	32(%rsp,%rax,4), %eax
	movl	%eax, dir(%rip)
	jmp	.L51
.L36:
	movl	current(%rip), %eax
	testl	%eax, %eax
	js	.L51
	leaq	stack(%rip), %r8
	movslq	%eax, %rdi
	leaq	96(%rsp), %r9
	leaq	(%r8,%rdi,4), %rax
	movq	%r9, %rdx
	leaq	-4(%r8), %rsi
	.p2align 4,,10
	.p2align 3
.L68:
	movl	(%rax), %ecx
	subq	$4, %rax
	addq	$4, %rdx
	movl	%ecx, -4(%rdx)
	cmpq	%rax, %rsi
	jne	.L68
	leaq	4(,%rdi,4), %rdx
	movq	%r9, %rsi
	movq	%r8, %rdi
	call	memcpy@PLT
	jmp	.L51
.L37:
	leaq	12(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	cmpl	$58, %eax
	jle	.L102
	movl	current(%rip), %ecx
	leaq	stack(%rip), %r8
	leal	1(%rcx), %edx
	movslq	%edx, %rdx
	cmpl	$91, %eax
	jg	.L67
	subl	$55, %eax
	movl	%eax, (%r8,%rdx,4)
.L66:
	addl	$1, current(%rip)
	jmp	.L51
.L38:
	movslq	current(%rip), %rax
	leaq	stack(%rip), %r8
	cmpl	$0, (%r8,%rax,4)
	jne	.L99
	movl	$1, %edi
	call	move
	jmp	.L99
.L39:
	movl	$2, dir(%rip)
	jmp	.L51
.L41:
	movl	$4, dir(%rip)
	jmp	.L51
.L42:
	movl	$1, %edi
	call	move
	cmpl	$1, dir(%rip)
	je	.L103
.L76:
	movq	1784(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L104
	addq	$1800, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L43:
	.cfi_restore_state
	movslq	current(%rip), %rax
	leaq	stack(%rip), %r8
	movl	(%r8,%rax,4), %ecx
	leal	1(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, current(%rip)
	movl	%ecx, (%r8,%rax,4)
	jmp	.L51
.L44:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cltq
	movl	16(%rsp,%rax,4), %eax
	movl	%eax, dir(%rip)
	jmp	.L51
.L45:
	movslq	current(%rip), %rax
	cmpl	$1, %eax
	jg	.L105
.L52:
	leaq	stack(%rip), %r8
	leaq	.LC8(%rip), %rdi
	movl	(%r8,%rax,4), %esi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L46:
	movslq	current(%rip), %rdx
	leaq	stack(%rip), %r8
	leal	-1(%rdx), %eax
	cltq
	movl	(%r8,%rax,4), %ecx
	subl	(%r8,%rdx,4), %ecx
	movl	%ecx, (%r8,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L47:
	movslq	current(%rip), %rsi
	leaq	stack(%rip), %r8
	leal	-1(%rsi), %ecx
	movslq	%ecx, %rcx
	movl	(%r8,%rcx,4), %eax
	cltd
	idivl	(%r8,%rsi,4)
	movl	%eax, (%r8,%rcx,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L48:
	movslq	current(%rip), %rdx
	leaq	stack(%rip), %r8
	leal	-1(%rdx), %eax
	movl	(%r8,%rdx,4), %edx
	cltq
	addl	%edx, (%r8,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L49:
	movslq	current(%rip), %rdx
	leaq	stack(%rip), %r8
	leal	-1(%rdx), %eax
	movl	(%r8,%rdx,4), %edx
	cltq
	imull	(%r8,%rax,4), %edx
	movl	%edx, (%r8,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L50:
	cmpl	$2, dir(%rip)
	jne	.L51
	leal	-1(%rsi), %edx
	salq	$7, %rax
	movslq	%edx, %rdx
	addq	%rbp, %rax
.L62:
	movl	%edx, %ecx
	subq	$1, %rdx
	cmpb	$40, 1(%rax,%rdx)
	jne	.L62
	movl	%ecx, c(%rip)
	jmp	.L51
.L53:
	movslq	current(%rip), %rax
	leaq	stack(%rip), %r8
	leal	-1(%rax), %ecx
	movl	(%r8,%rax,4), %eax
	movslq	%ecx, %rcx
	cltd
	idivl	(%r8,%rcx,4)
	xorl	%eax, %eax
	movl	%edx, (%r8,%rcx,4)
	call	pop
	jmp	.L51
.L54:
	movslq	current(%rip), %rcx
	leaq	stack(%rip), %r8
	movq	%rcx, %rax
	movl	(%r8,%rcx,4), %esi
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	%eax, current(%rip)
	movl	(%r8,%rdx,4), %edi
	movl	%edi, (%r8,%rcx,4)
	movl	%esi, (%r8,%rdx,4)
	jmp	.L51
.L55:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cltq
	movl	48(%rsp,%rax,4), %eax
	movl	%eax, dir(%rip)
	jmp	.L51
.L56:
	movl	$1, %edi
	call	move
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	salq	$7, %rax
	addq	$1792, %rax
	addq	%rsp, %rax
	movsbl	-1296(%rdx,%rax), %eax
	cmpb	$34, %al
	je	.L51
	leaq	stack(%rip), %r8
	.p2align 4,,10
	.p2align 3
.L69:
	movl	current(%rip), %ecx
	movl	$1, %edi
	leal	1(%rcx), %edx
	movslq	%edx, %rcx
	movl	%edx, current(%rip)
	movl	%eax, (%r8,%rcx,4)
	call	move
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	salq	$7, %rax
	addq	$1792, %rax
	addq	%rsp, %rax
	movsbl	-1296(%rdx,%rax), %eax
	cmpb	$34, %al
	jne	.L69
	jmp	.L51
.L57:
	movl	$1, %edi
	call	move
	jmp	.L51
.L58:
	cmpl	$2, dir(%rip)
	jne	.L51
	movl	$-1, c(%rip)
	jmp	.L51
.L102:
	movl	current(%rip), %ecx
	leaq	stack(%rip), %r8
	subl	$48, %eax
	leal	1(%rcx), %edx
	movslq	%edx, %rdx
	movl	%eax, (%r8,%rdx,4)
	jmp	.L66
.L105:
	movslq	%eax, %rdx
	subl	$1, %eax
	leaq	stack(%rip), %r8
	cltq
	movl	(%r8,%rdx,4), %edx
	movl	(%r8,%rax,4), %eax
	movl	%edx, r(%rip)
	movl	%eax, c(%rip)
	xorl	%eax, %eax
	call	pop
	xorl	%eax, %eax
	call	pop
	jmp	.L51
.L103:
	cmpl	$-1, r(%rip)
	jne	.L76
	subl	$1, %ebx
	movl	%ebx, r(%rip)
	jmp	.L76
.L84:
	movslq	current(%rip), %rax
	jmp	.L52
.L67:
	subl	$61, %eax
	movl	%eax, (%r8,%rdx,4)
	jmp	.L66
.L104:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.globl	dir
	.data
	.align 4
	.type	dir, @object
	.size	dir, 4
dir:
	.long	2
	.globl	d
	.align 4
	.type	d, @object
	.size	d, 4
d:
	.long	1
	.globl	r
	.bss
	.align 4
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.globl	c
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	current
	.align 4
	.type	current, @object
	.size	current, 4
current:
	.zero	4
	.globl	null
	.align 4
	.type	null, @object
	.size	null, 4
null:
	.zero	4
	.globl	stack
	.align 32
	.type	stack, @object
	.size	stack, 396
stack:
	.zero	396
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
