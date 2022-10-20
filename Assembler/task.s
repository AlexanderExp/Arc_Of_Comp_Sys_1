	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # Передаваемый массив const int array[], она кладется на -24 позицию в стеке
	mov	DWORD PTR -28[rbp], esi # Передаваемая переменная size, она кладется на -28 позицию в стеке
	mov	DWORD PTR -32[rbp], edx # Передаваемая переменная x, она записывается на - 32 позицию в стеке
	mov	QWORD PTR -40[rbp], rcx # Передаваемый указатель на массив B, он записывается на -40 позицию в стеке 

	mov	DWORD PTR -4[rbp], 0 # Объявление переменной j, лежащей на -4 позиции, присвоение j значения 0
	mov	DWORD PTR -8[rbp], 0 # Объявление переменной i, лежащей на -8 позиции, присвоение i значения 0

	jmp	.L2 # Начало цикла
.L4:
	mov	eax, DWORD PTR -8[rbp] 
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] 
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -32[rbp], eax
	je	.L3
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR [rcx]
	mov	DWORD PTR [rdx], eax
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L4
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	ret
	.size	task, .-task
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
