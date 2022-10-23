	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Choose an option for input:\n1. Console Input\n2. Random"
.LC1:
	.string	"%d"
.LC2:
	.string	"X = "
	.align 8
.LC3:
	.string	"Input length (0 < length <= %d): "
.LC4:
	.string	"Incorrect length = %d\n"
.LC5:
	.string	"A[%d] = "
.LC6:
	.string	"Array A: "
.LC7:
	.string	"%d "
.LC8:
	.string	"Incorrect input"
.LC9:
	.string	"r"
.LC10:
	.string	"input.txt"
.LC11:
	.string	"The time: %f\n"
.LC12:
	.string	"w"
.LC13:
	.string	"output.txt"
.LC14:
	.string	"Array B: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 896
	mov	DWORD PTR -884[rbp], edi
	mov	QWORD PTR -896[rbp], rsi
	cmp	DWORD PTR -884[rbp], 1
	jne	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rax, -876[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -872[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -876[rbp]
	cmp	eax, 1
	jne	.L3
	mov	esi, 100
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -868[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -868[rbp]
	test	eax, eax
	jle	.L4
	mov	eax, DWORD PTR -868[rbp]
	cmp	eax, 100
	jle	.L5
.L4:
	mov	eax, DWORD PTR -868[rbp]
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L29
.L5:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, -464[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -8[rbp], 1
.L7:
	mov	eax, DWORD PTR -868[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L8
	jmp	.L9
.L3:
	mov	eax, DWORD PTR -876[rbp]
	cmp	eax, 2
	jne	.L10
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -868[rbp], 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	DWORD PTR -868[rbp], eax
.L11:
	mov	eax, DWORD PTR -868[rbp]
	test	eax, eax
	jle	.L12
	mov	eax, DWORD PTR -868[rbp]
	cmp	eax, 100
	jg	.L12
	mov	DWORD PTR -12[rbp], 0
	jmp	.L13
.L15:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1518422781
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 6
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 99
	sub	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -464[rbp+rax*4], edx
	mov	eax, DWORD PTR -12[rbp]
	mov	edx, DWORD PTR -464[rbp+rax*4]
	movsx	rax, edx
	imul	rax, rax, -1840700269
	shr	rax, 32
	add	eax, edx
	sar	eax, 2
	mov	ecx, eax
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	mov	ecx, eax
	sal	ecx, 3
	sub	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	test	eax, eax
	jne	.L14
	mov	eax, r12d
	mov	eax, DWORD PTR -464[rbp+rax*4]
	neg	eax
	mov	edx, eax
	mov	eax, r12d
	mov	DWORD PTR -464[rbp+rax*4], edx
.L14:
	add	r12d, 1
.L13:
	mov	eax, DWORD PTR -868[rbp]
	cmp	r12d, eax
	jl	.L15
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0
	jmp	.L16
.L17:
	mov	eax, r12d
	mov	eax, DWORD PTR -464[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1
.L16:
	mov	eax, DWORD PTR -868[rbp]
	cmp	r12d, eax
	jl	.L17
	jmp	.L9
.L10:
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L9
.L2:
	cmp	DWORD PTR -884[rbp], 2
	jne	.L9
	mov	rax, QWORD PTR -896[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -872[rbp], eax
	lea	rsi, .LC9[rip]
	lea	rdi, .LC10[rip]
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -868[rbp]
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -868[rbp]
	test	eax, eax
	jle	.L18
	mov	eax, DWORD PTR -868[rbp]
	cmp	eax, 100
	jle	.L19
.L18:
	mov	eax, DWORD PTR -868[rbp]
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L29
.L19:
	mov	r12d, 0
	jmp	.L20
.L21:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	lea	rax, -464[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	r12d, 1
.L20:
	mov	eax, DWORD PTR -868[rbp]
	cmp	r12d, eax
	jl	.L21
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L9:
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	r12d, 0
	jmp	.L22
.L23:
	mov	edx, DWORD PTR -872[rbp]
	mov	esi, DWORD PTR -868[rbp]
	lea	rcx, -864[rbp]
	lea	rax, -464[rbp]
	mov	rdi, rax
	call	task@PLT
	mov	r12d, eax
	add	r12d, 1
.L22:
	cmp	DWORD PTR -24[rbp], 9999999
	jle	.L23
	mov	edi, 10
	call	putchar@PLT
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 1
	call	printf@PLT
	cmp	DWORD PTR -884[rbp], 2
	jne	.L24
	lea	rsi, .LC12[rip]
	lea	rdi, .LC13[rip]
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	rcx, rax
	mov	edx, 9
	mov	esi, 1
	lea	rdi, .LC14[rip]
	call	fwrite@PLT
	mov	r12d, 0
	jmp	.L25
.L26:
	mov	eax, r12d
	mov	edx, DWORD PTR -864[rbp+rax*4]
	mov	rax, QWORD PTR -64[rbp]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	r12d, 1
.L25:
	mov	eax, r12d
	cmp	eax, r12d
	jl	.L26
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L29
.L24:
	lea	rdi, .LC14[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0
	jmp	.L27
.L28:
	mov	eax, r12d
	mov	eax, DWORD PTR -864[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1
.L27:
	mov	eax, r12d
	cmp	eax, r12d
	jl	.L28
	mov	eax, 0
.L29:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
