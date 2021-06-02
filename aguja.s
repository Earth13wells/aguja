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
	.string	"instruction: %c\n"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$1312, %rsp
	.cfi_def_cfa_offset 1360
	movq	8(%rsi), %rdi
	leaq	.LC0(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 1304(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r14
	call	fopen@PLT
	movq	%r14, %rbx
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbx, %rdi
	movq	%rbp, %rdx
	movl	$128, %esi
	subq	$-128, %rbx
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L17
	cmpq	$0, 16(%r12)
	leaq	.L23(%rip), %r13
	leaq	stack(%rip), %rbp
	jne	.L125
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	r(%rip), %rcx
	movslq	c(%rip), %rsi
	leaq	1312(%rsp), %rbx
	movq	%rcx, %rax
	movq	%rsi, %rdx
	salq	$7, %rax
	addq	%rbx, %rax
	movzbl	-1296(%rsi,%rax), %esi
	leal	-10(%rsi), %eax
	cmpb	$116, %al
	ja	.L21
	movzbl	%al, %eax
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L23:
	.long	.L52-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L45-.L23
	.long	.L51-.L23
	.long	.L50-.L23
	.long	.L49-.L23
	.long	.L48-.L23
	.long	.L47-.L23
	.long	.L80-.L23
	.long	.L21-.L23
	.long	.L45-.L23
	.long	.L44-.L23
	.long	.L43-.L23
	.long	.L42-.L23
	.long	.L41-.L23
	.long	.L40-.L23
	.long	.L39-.L23
	.long	.L38-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L37-.L23
	.long	.L36-.L23
	.long	.L35-.L23
	.long	.L34-.L23
	.long	.L33-.L23
	.long	.L32-.L23
	.long	.L31-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L30-.L23
	.long	.L21-.L23
	.long	.L29-.L23
	.long	.L28-.L23
	.long	.L27-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L26-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L25-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L21-.L23
	.long	.L24-.L23
	.long	.L21-.L23
	.long	.L122-.L23
	.section	.text.startup
	.p2align 4,,10
	.p2align 3
.L126:
	movl	current(%rip), %ecx
	leal	1(%rcx), %edx
	movslq	%edx, %rcx
	movl	%edx, current(%rip)
	movl	%eax, 0(%rbp,%rcx,4)
.L50:
	movl	$1, %edi
	leaq	1312(%rsp), %rcx
	call	move
	movslq	r(%rip), %rax
	movslq	c(%rip), %rdx
	salq	$7, %rax
	addq	%rcx, %rax
	movsbl	-1296(%rdx,%rax), %eax
	cmpb	$34, %al
	jne	.L126
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$1, %edi
	call	move
.L129:
	cmpq	$0, 16(%r12)
	je	.L18
.L125:
	movl	$1, %edi
	xorl	%ebx, %ebx
	call	sleep@PLT
	movslq	r(%rip), %rdx
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdi
	movq	%rdx, %rsi
	salq	$7, %rdx
	addq	%r14, %rdx
	call	printf@PLT
	cmpl	$-1, c(%rip)
	jl	.L20
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$32, %edi
	call	putchar@PLT
	movl	%ebx, %eax
	addl	$1, %ebx
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
	leaq	1312(%rsp), %rcx
	leaq	.LC5(%rip), %rdi
	salq	$7, %rax
	addq	%rcx, %rax
	movsbl	-1296(%rdx,%rax), %esi
	xorl	%eax, %eax
	call	printf@PLT
	movslq	current(%rip), %rax
	leaq	.LC6(%rip), %rdi
	movl	0(%rbp,%rax,4), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L18
.L36:
	movl	$1, %edi
	call	move
	movq	1304(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L127
	addq	$1312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L32:
	.cfi_restore_state
	movslq	current(%rip), %rax
	cmpl	$0, 0(%rbp,%rax,4)
	je	.L128
.L122:
	xorl	%eax, %eax
	movl	$1, %edi
	call	pop
	call	move
	jmp	.L129
.L30:
	movl	dir(%rip), %eax
	cmpl	$3, %eax
	je	.L33
	jg	.L55
	cmpl	$1, %eax
	je	.L35
	cmpl	$2, %eax
	jne	.L45
.L25:
	movl	$3, dir(%rip)
	jmp	.L45
.L49:
	movl	dir(%rip), %eax
	cmpl	$3, %eax
	je	.L29
	jg	.L124
	cmpl	$1, %eax
	je	.L25
	cmpl	$2, %eax
	jne	.L45
.L35:
	movl	$4, dir(%rip)
	jmp	.L45
.L38:
	movl	dir(%rip), %eax
	cmpl	$3, %eax
	je	.L35
	jg	.L54
	cmpl	$1, %eax
	je	.L33
	cmpl	$2, %eax
	jne	.L45
.L29:
	movl	$1, dir(%rip)
	jmp	.L45
.L24:
	movl	dir(%rip), %eax
	cmpl	$2, %eax
	je	.L35
.L124:
	cmpl	$4, %eax
	jne	.L45
.L33:
	movl	$2, dir(%rip)
	jmp	.L45
.L21:
	movl	current(%rip), %eax
	leal	1(%rax), %edx
	movsbl	%sil, %eax
	movslq	%edx, %rcx
	subl	$48, %eax
	movl	%edx, current(%rip)
	movl	%eax, 0(%rbp,%rcx,4)
	jmp	.L45
.L26:
	movl	current(%rip), %edx
	leal	1(%rdx), %eax
	movslq	%eax, %rcx
	movl	%eax, current(%rip)
	movl	%edx, 0(%rbp,%rcx,4)
	jmp	.L45
.L27:
	movslq	current(%rip), %rax
	movl	0(%rbp,%rax,4), %edi
	call	putchar@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L28:
	movl	dir(%rip), %eax
	cmpl	$1, %eax
	je	.L25
	cmpl	$3, %eax
	je	.L29
	jmp	.L45
.L55:
	cmpl	$4, %eax
	je	.L29
	jmp	.L45
.L31:
	leaq	12(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	current(%rip), %eax
	movl	12(%rsp), %ecx
	addl	$1, %eax
	movslq	%eax, %rdx
	movl	%eax, current(%rip)
	movl	%ecx, 0(%rbp,%rdx,4)
	jmp	.L45
.L34:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	cltq
	movl	0(%rbp,%rax,4), %ecx
	cmpl	%ecx, 0(%rbp,%rdx,4)
	je	.L130
	movl	$0, 0(%rbp,%rax,4)
	jmp	.L122
.L37:
	movslq	current(%rip), %rax
	movl	0(%rbp,%rax,4), %ecx
	leal	1(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, current(%rip)
	movl	%ecx, 0(%rbp,%rax,4)
	jmp	.L45
.L54:
	cmpl	$4, %eax
	je	.L25
	jmp	.L45
.L39:
	movslq	current(%rip), %rax
	cmpl	$1, %eax
	jg	.L131
.L46:
	movl	0(%rbp,%rax,4), %esi
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L40:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	cltq
	movl	0(%rbp,%rax,4), %ecx
	subl	0(%rbp,%rdx,4), %ecx
	movl	%ecx, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L41:
	movslq	current(%rip), %rdi
	leal	-1(%rdi), %ecx
	movslq	%ecx, %rcx
	movl	0(%rbp,%rcx,4), %eax
	cltd
	idivl	0(%rbp,%rdi,4)
	movl	%eax, 0(%rbp,%rcx,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L42:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	movl	0(%rbp,%rdx,4), %edx
	cltq
	addl	%edx, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L43:
	movslq	current(%rip), %rdx
	leal	-1(%rdx), %eax
	movl	0(%rbp,%rdx,4), %edx
	cltq
	imull	0(%rbp,%rax,4), %edx
	movl	%edx, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L44:
	movl	$2, dir(%rip)
	leal	-1(%rdx), %eax
	salq	$7, %rcx
	cltq
	leaq	(%r14,%rcx), %rdx
	.p2align 4,,10
	.p2align 3
.L53:
	movl	%eax, %ecx
	subq	$1, %rax
	cmpb	$40, 1(%rdx,%rax)
	jne	.L53
	movl	%ecx, c(%rip)
	jmp	.L45
.L47:
	movslq	current(%rip), %rax
	leal	-1(%rax), %ecx
	movl	0(%rbp,%rax,4), %eax
	movslq	%ecx, %rcx
	cltd
	idivl	0(%rbp,%rcx,4)
	xorl	%eax, %eax
	movl	%edx, 0(%rbp,%rcx,4)
	call	pop
	jmp	.L45
.L48:
	movslq	current(%rip), %rcx
	movq	%rcx, %rax
	movl	0(%rbp,%rcx,4), %esi
	subl	$1, %eax
	movslq	%eax, %rdx
	movl	%eax, current(%rip)
	movl	0(%rbp,%rdx,4), %edi
	movl	%edi, 0(%rbp,%rcx,4)
	movl	%esi, 0(%rbp,%rdx,4)
	jmp	.L45
.L51:
	movl	$1, %edi
	call	move
	jmp	.L45
.L52:
	subl	$1, %edx
	movl	%edx, c(%rip)
	jmp	.L45
.L131:
	movslq	%eax, %rdx
	subl	$1, %eax
	cltq
	movl	0(%rbp,%rdx,4), %edx
	movl	0(%rbp,%rax,4), %eax
	movl	%edx, r(%rip)
	movl	%eax, c(%rip)
	xorl	%eax, %eax
	call	pop
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L130:
	movl	$1, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	call	pop
	jmp	.L45
.L128:
	movl	$1, %edi
	call	move
	jmp	.L122
.L80:
	movslq	current(%rip), %rax
	jmp	.L46
.L127:
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
	.size	stack, 4000
stack:
	.zero	4000
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
