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
	.string	"--------------------------"
.LC2:
	.string	"dir: %d, d: %d \n"
.LC3:
	.string	"r: %d, c: %d\n"
.LC4:
	.string	"instruction: %c\n"
.LC5:
	.string	"stack: %d, current %d\n"
.LC6:
	.string	" %c"
.LC7:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$1320, %rsp
	.cfi_def_cfa_offset 1360
	movq	8(%rsi), %rdi
	leaq	.LC0(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 1304(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r13
	call	fopen@PLT
	movq	%r13, %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	$128, %esi
	subq	$-128, %rbx
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L17
	leaq	.L21(%rip), %r12
	leaq	stack(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L55:
	cmpq	$0, 16(%rbp)
	je	.L18
	movl	$1, %edi
	call	sleep@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	d(%rip), %edx
	movl	dir(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdi
	call	printf@PLT
	movl	c(%rip), %edx
	movl	r(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdi
	call	printf@PLT
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	leaq	1312(%rsp), %rcx
	leaq	.LC4(%rip), %rdi
	salq	$7, %rax
	addq	%rcx, %rax
	movsbl	-1296(%rdx,%rax), %esi
	xorl	%eax, %eax
	call	printf@PLT
	movslq	current(%rip), %rax
	leaq	.LC5(%rip), %rdi
	movl	(%rbx,%rax,4), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	printf@PLT
.L18:
	movslq	r(%rip), %rcx
	movslq	c(%rip), %rsi
	leaq	1312(%rsp), %rdi
	movq	%rcx, %rax
	movq	%rsi, %rdx
	salq	$7, %rax
	addq	%rdi, %rax
	movsbl	-1296(%rsi,%rax), %esi
	leal	-10(%rsi), %eax
	cmpb	$116, %al
	ja	.L19
	movzbl	%al, %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L49-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L48-.L21
	.long	.L47-.L21
	.long	.L46-.L21
	.long	.L45-.L21
	.long	.L44-.L21
	.long	.L43-.L21
	.long	.L60-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L41-.L21
	.long	.L40-.L21
	.long	.L39-.L21
	.long	.L38-.L21
	.long	.L37-.L21
	.long	.L36-.L21
	.long	.L28-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L35-.L21
	.long	.L34-.L21
	.long	.L33-.L21
	.long	.L32-.L21
	.long	.L31-.L21
	.long	.L30-.L21
	.long	.L29-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L28-.L21
	.long	.L19-.L21
	.long	.L27-.L21
	.long	.L26-.L21
	.long	.L25-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L24-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L23-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L19-.L21
	.long	.L22-.L21
	.long	.L19-.L21
	.long	.L72-.L21
	.section	.text.startup
	.p2align 4,,10
	.p2align 3
.L73:
	movl	current(%rip), %ecx
	leal	1(%rcx), %edx
	movslq	%edx, %rcx
	movl	%edx, current(%rip)
	movl	%eax, (%rbx,%rcx,4)
.L46:
	movl	$1, %edi
	leaq	1312(%rsp), %rcx
	call	move
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	salq	$7, %rax
	addq	%rcx, %rax
	movsbl	-1296(%rdx,%rax), %eax
	cmpb	$34, %al
	jne	.L73
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$1, %edi
	call	move
	jmp	.L55
.L28:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cmpl	$3, %eax
	ja	.L48
.L23:
	movl	$3, dir(%rip)
	jmp	.L48
.L34:
	movl	$1, %edi
	call	move
	movq	1304(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L74
	addq	$1320, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L30:
	.cfi_restore_state
	movslq	current(%rip), %rax
	cmpl	$0, (%rbx,%rax,4)
	je	.L75
.L72:
	xorl	%eax, %eax
	movl	$1, %edi
	call	pop
	call	move
	jmp	.L55
.L19:
	movl	current(%rip), %eax
	subl	$48, %esi
	addl	$1, %eax
	movslq	%eax, %rdx
	movl	%esi, (%rbx,%rdx,4)
	movl	%eax, current(%rip)
	jmp	.L48
.L26:
	movl	dir(%rip), %eax
	andl	$-3, %eax
	subl	$1, %eax
	jne	.L48
.L27:
	movl	$1, dir(%rip)
	jmp	.L48
.L45:
	movl	dir(%rip), %eax
	subl	$1, %eax
	cmpl	$3, %eax
	ja	.L48
.L31:
	movl	$2, dir(%rip)
	jmp	.L48
.L29:
	leaq	12(%rsp), %rsi
	leaq	.LC6(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	current(%rip), %eax
	movl	12(%rsp), %ecx
	addl	$1, %eax
	movslq	%eax, %rdx
	movl	%eax, current(%rip)
	movl	%ecx, (%rbx,%rdx,4)
	jmp	.L48
.L22:
	movl	dir(%rip), %eax
	subl	$2, %eax
	andl	$-3, %eax
	jne	.L48
	jmp	.L23
.L24:
	movl	current(%rip), %edx
	leal	1(%rdx), %eax
	movslq	%eax, %rcx
	movl	%eax, current(%rip)
	movl	%edx, (%rbx,%rcx,4)
	jmp	.L48
.L25:
	movslq	current(%rip), %rax
	movl	(%rbx,%rax,4), %edi
	call	putchar@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L32:
	movslq	current(%rip), %rax
	leal	-1(%rax), %edx
	movslq	%edx, %rdx
	movl	(%rbx,%rdx,4), %ecx
	cmpl	%ecx, (%rbx,%rax,4)
	je	.L76
	movl	$0, (%rbx,%rdx,4)
	jmp	.L72
.L33:
	movl	$4, dir(%rip)
	jmp	.L48
.L35:
	movslq	current(%rip), %rax
	movl	(%rbx,%rax,4), %ecx
	leal	1(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, current(%rip)
	movl	%ecx, (%rbx,%rax,4)
	jmp	.L48
.L36:
	movslq	current(%rip), %rax
	cmpl	$1, %eax
	jg	.L77
.L42:
	movl	(%rbx,%rax,4), %esi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L37:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	cltq
	movl	(%rbx,%rax,4), %ecx
	subl	(%rbx,%rdx,4), %ecx
	movl	%ecx, (%rbx,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L38:
	movslq	current(%rip), %rdi
	leal	-1(%rdi), %ecx
	movslq	%ecx, %rcx
	movl	(%rbx,%rcx,4), %eax
	cltd
	idivl	(%rbx,%rdi,4)
	movl	%eax, (%rbx,%rcx,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L39:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	movl	(%rbx,%rdx,4), %edx
	cltq
	addl	%edx, (%rbx,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L40:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	movl	(%rbx,%rdx,4), %edx
	cltq
	imull	(%rbx,%rax,4), %edx
	movl	%edx, (%rbx,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L41:
	movl	$2, dir(%rip)
	subl	$1, %edx
	salq	$7, %rcx
	movslq	%edx, %rdx
	addq	%r13, %rcx
	.p2align 4,,10
	.p2align 3
.L50:
	movl	%edx, %eax
	subq	$1, %rdx
	cmpb	$40, 1(%rcx,%rdx)
	jne	.L50
	movl	%eax, c(%rip)
	jmp	.L48
.L43:
	movslq	current(%rip), %rax
	leal	-1(%rax), %ecx
	movl	(%rbx,%rax,4), %eax
	movslq	%ecx, %rcx
	cltd
	idivl	(%rbx,%rcx,4)
	xorl	%eax, %eax
	movl	%edx, (%rbx,%rcx,4)
	call	pop
	jmp	.L48
.L44:
	movslq	current(%rip), %rcx
	movq	%rcx, %rax
	movl	(%rbx,%rcx,4), %esi
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	(%rbx,%rdx,4), %edi
	movl	%edi, (%rbx,%rcx,4)
	movl	%esi, (%rbx,%rdx,4)
	movl	%eax, current(%rip)
	jmp	.L48
.L47:
	movl	$1, %edi
	call	move
	jmp	.L48
.L49:
	subl	$1, %edx
	movl	%edx, c(%rip)
	jmp	.L48
.L77:
	movslq	%eax, %rdx
	subl	$1, %eax
	cltq
	movl	(%rbx,%rdx,4), %edx
	movl	(%rbx,%rax,4), %eax
	movl	%edx, r(%rip)
	movl	%eax, c(%rip)
	xorl	%eax, %eax
	call	pop
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L76:
	movl	$1, (%rbx,%rdx,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L48
.L75:
	movl	$1, %edi
	call	move
	jmp	.L72
.L60:
	movslq	current(%rip), %rax
	jmp	.L42
.L74:
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
	.size	stack, 400
stack:
	.zero	400
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
