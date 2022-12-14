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
	.string	"w"
.LC12:
	.string	"output.txt"
.LC13:
	.string	"Array B: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 176
	mov	DWORD PTR -164[rbp], edi # int argc поместили на -164 позицию
	mov	QWORD PTR -176[rbp], rsi # char* argv[] поместили на -176 позицию 
	cmp	DWORD PTR -164[rbp], 1 # сравниваем argc с 1 
	jne	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rax, -156[rbp] # на -156 позицию в стеке записываем считанный int input_option
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -152[rbp] # На -152 позицию в стеке записываем считанный int x
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -156[rbp] # Перемещаем в eax значение input_option
	cmp	eax, 1 # Сравниваем input_option с 1
	jne	.L3
	mov	esi, 10
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -148[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -148[rbp] # записываем считанное значение в length на -148 позицию в стеке
	test	eax, eax
	jle	.L4
	mov	eax, DWORD PTR -148[rbp]
	cmp	eax, 10
	jle	.L5
.L4:
	mov	eax, DWORD PTR -148[rbp]
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L5:
	mov	DWORD PTR -4[rbp], 0 # Записываем в переменную i значение 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp] # Записываем в eax значение переменной i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp] # Записываем в eax значение переменной i
	cdqe
	lea	rdx, 0[0+rax*4] # 
	lea	rax, -96[rbp] # 
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1 # Прибавляем 1 к значению i
.L7:
	mov	eax, DWORD PTR -148[rbp] # Записываем считанное значение в length
	cmp	DWORD PTR -4[rbp], eax # Записываем в i значение переменной eax
	jl	.L8
	jmp	.L9
.L3:
	mov	eax, DWORD PTR -156[rbp] # Записываем в eax значение переменной input_option
	cmp	eax, 2 # Сравниваем input_option с 2
	jne	.L10
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -148[rbp], 0 # Записываем в length значение 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	DWORD PTR -148[rbp], eax # Записываем в length рандомное значение
.L11:
	mov	eax, DWORD PTR -148[rbp] # Записываем в eax значение из length
	test	eax, eax
	jle	.L12
	mov	eax, DWORD PTR -148[rbp] # Записываем в eax значение из length
	cmp	eax, 10
	jg	.L12
	mov	DWORD PTR -8[rbp], 0 # Объявляем переменную j, записываем ее на позицию -8 на стеке, присваиваем ей значение 0
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
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	DWORD PTR -96[rbp+rax*4], edx
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	edx, DWORD PTR -96[rbp+rax*4]
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
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	neg	eax
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	DWORD PTR -96[rbp+rax*4], edx
.L14:
	add	DWORD PTR -8[rbp], 1 # Прибавляем к j единицу
.L13:
	mov	eax, DWORD PTR -148[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L15
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -12[rbp], 0 # Объявляем переменную j, записываем ее на позицию -12 на стеке, присваиваем ей значение 0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -12[rbp] 
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1 # Прибавляем к j единицу
.L16:
	mov	eax, DWORD PTR -148[rbp] 
	cmp	DWORD PTR -12[rbp], eax # Сравниваем j с length
	jl	.L17
	mov	edi, 10
	call	putchar@PLT
	jmp	.L9
.L10:
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L9
.L2:
	cmp	DWORD PTR -164[rbp], 2 # Сравниваем argc с 2
	jne	.L9
	mov	rax, QWORD PTR -176[rbp] 
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -152[rbp], eax # Присваиваиваем переменной x считанное значение, лежащее в eax
	lea	rsi, .LC9[rip]
	lea	rdi, .LC10[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax 
	lea	rdx, -148[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -148[rbp]
	test	eax, eax
	jle	.L18
	mov	eax, DWORD PTR -148[rbp]
	cmp	eax, 10
	jle	.L19
.L18:
	mov	eax, DWORD PTR -148[rbp]
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L19:
	mov	DWORD PTR -16[rbp], 0 # Объявляем переменную j, записываем ее на позицию -16 на стеке, присваиваем ей значение 0
	jmp	.L20
.L21:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, -96[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -16[rbp], 1 # Прибавляем 1 к j
.L20:
	mov	eax, DWORD PTR -148[rbp]
	cmp	DWORD PTR -16[rbp], eax
	jl	.L21
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT # Закрываем файл
.L9:
	mov	edx, DWORD PTR -152[rbp] # Передаем x в task
	mov	esi, DWORD PTR -148[rbp] # Передаем length в task
	lea	rcx, -144[rbp] # Передаем массив B в task
	lea	rax, -96[rbp] # Передаем массив А в task 
	mov	rdi, rax
	call	task@PLT
	mov	DWORD PTR -36[rbp], eax
	cmp	DWORD PTR -164[rbp], 2 # Сравниваем argc с 2
	jne	.L22
	lea	rsi, .LC11[rip]
	lea	rdi, .LC12[rip]
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, rax
	mov	edx, 9
	mov	esi, 1
	lea	rdi, .LC13[rip]
	call	fwrite@PLT
	mov	DWORD PTR -20[rbp], 0 # Объявляем переменную j, записываем ее на позицию -20 на стеке, присваиваем ей значение 0
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	mov	edx, DWORD PTR -144[rbp+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -20[rbp], 1
.L23:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L24
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L27
.L22:
	lea	rdi, .LC13[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -24[rbp], 0 # Объявляем переменную j, записываем ее на позицию -24 на стеке, присваиваем ей значение 0
	jmp	.L25
.L26:
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	mov	eax, DWORD PTR -144[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -24[rbp], 1
.L25:
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L26
	mov	eax, 0
.L27:
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