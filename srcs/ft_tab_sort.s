bits 64

extern ft_list_size

section .text
	global ft_list_sort

	ft_list_sort:
		mov rcx, -1
		call ft_list_size
		mov rdx, rax
		add rdx, 1
		mov r8, -1
		jmp _loop

	_loop:
		inc rcx
		cmp rcx, rdx
		jne _loopAux
		jmp _exit

	_initLoopAux:
		mov r8, rcx
		jmp _loopAux

	_loopAux:
		inc r8
		cmp r8, rdx
		je _initLoopAux
		call rsi

	_exit:
		ret
