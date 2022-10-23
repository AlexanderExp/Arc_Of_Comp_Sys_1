# вместо -4[rbp] используем r12d => стало быстрее и лучше
# вместо -8[rbp] используем r12d => стало быстрее и лучше
# вместо -12[rbp] используем r12d => стало быстрее и лучше
# вместо -16[rbp] используем r12d => стало быстрее и лучше
# вместо -20[rbp] используем r12d => стало быстрее и лучше
# вместо -24[rbp] используем r12d => стало быстрее и лучше

# загружаем input_option(-156[rbp]) в регистр r13d
# загружаем length(-148[rbp]) в регистр r14d 

# удалены макросы cdq, cdqe

# task
# вместо -4[rbp] используем r12d => стало быстрее и лучше
# вместо -8[rbp] используем r12d => стало быстрее и лучше

	
	
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
	mov r13d, -156[rbp] # загружаем input_option в регистр r13d
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -152[rbp] # На -152 позицию в стеке записываем считанный int x
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, r12d
	call	__isoc99_scanf@PLT
	mov	eax, r13d # Перемещаем в eax значение input_option
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
	mov r14d, -148[rbp] # загружаем length в регистр r14d
	mov	eax, r14d # записываем считанное значение в length на -148 позицию в стеке
	test	eax, eax
	jle	.L4
	mov	eax, r14d
	cmp	eax, 10
	jle	.L5
.L4:
	mov	eax, r14d
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L5:
	mov	r12d, 0 # Записываем в переменную i значение 0
	jmp	.L7
.L8:
	mov	eax, r12d # Записываем в eax значение переменной i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, r12d # Записываем в eax значение переменной i
	lea	rdx, 0[0+rax*4] # 
	lea	rax, -96[rbp] # 
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	r12d, 1 # Прибавляем 1 к значению i
.L7:
	mov	eax, r14d # Записываем считанное значение в length
	cmp	r12d, eax # Записываем в i значение переменной eax
	jl	.L8
	jmp	.L9
.L3:
	mov	eax, r13d # Записываем в eax значение переменной input_option
	cmp	eax, 2 # Сравниваем input_option с 2
	jne	.L10
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	r14d, 0 # Записываем в length значение 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	r14d, eax # Записываем в length рандомное значение
.L11:
	mov	eax, r14d # Записываем в eax значение из length
	test	eax, eax
	jle	.L12
	mov	eax, r14d # Записываем в eax значение из length
	cmp	eax, 10
	jg	.L12
	mov	r12d, 0 # Объявляем переменную j, записываем ее на позицию -8 на стеке, присваиваем ей значение 0
	jmp	.L13
.L15:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1518422781
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 6
	# cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 99
	sub	eax, edx
	mov	edx, eax
	mov	eax, r12d
	mov	DWORD PTR -96[rbp+rax*4], edx
	mov	eax, r12d
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
	mov	eax, r12d
	mov	eax, DWORD PTR -96[rbp+rax*4]
	neg	eax
	mov	edx, eax
	mov	eax, r12d
	mov	DWORD PTR -96[rbp+rax*4], edx
.L14:
	add	r12d, 1 # Прибавляем к j единицу
.L13:
	mov	eax, r14d
	cmp	r12d, eax
	jl	.L15
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0 # Объявляем переменную j, записываем ее на позицию -12 на стеке, присваиваем ей значение 0
	jmp	.L16
.L17:
	mov	eax, r12d
	mov	eax, DWORD PTR -96[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1 # Прибавляем к j единицу
.L16:
	mov	eax, r14d
	cmp	r12d, eax # Сравниваем j с length
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
	mov	eax, r14d
	test	eax, eax
	jle	.L18
	mov	eax, r14d
	cmp	eax, 10
	jle	.L19
.L18:
	mov	eax, r14d
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L19:
	mov	r12d, 0 # Объявляем переменную j, записываем ее на позицию -16 на стеке, присваиваем ей значение 0
	jmp	.L20
.L21:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]
	lea	rax, -96[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	r12d, 1 # Прибавляем 1 к j
.L20:
	mov	eax, r14d
	cmp	r12d, eax
	jl	.L21
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT # Закрываем файл
.L9:
	mov	edx, DWORD PTR -152[rbp] # Передаем x в task
	mov	esi, r14d # Передаем length в task
	lea	rcx, -144[rbp] # Передаем массив B в task
	lea	rax, -96[rbp] # Передаем массив А в task 
	mov	rdi, rax
	call	task@PLT # task(A, length, x, B)
	mov	DWORD PTR -36[rbp], eax # lengthB = task(A, length, x, B) (Присваиваиваем lengthB результат выполнения функции task)
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
	mov	r12d, 0 # Объявляем переменную j, записываем ее на позицию -20 на стеке, присваиваем ей значение 0
	jmp	.L23
.L24:
	mov	eax, r12d
	mov	edx, DWORD PTR -144[rbp+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	r12d, 1
.L23:
	mov	eax, r12d
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
	mov	r12d, 0 # Объявляем переменную j, записываем ее на позицию -24 на стеке, присваиваем ей значение 0
	jmp	.L25
.L26:
	mov	eax, r12d
	mov	eax, DWORD PTR -144[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1
.L25:
	mov	eax, r12d
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