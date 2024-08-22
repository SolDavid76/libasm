bits 64

extern ft_lstprint

section .text
	global ft_list_sort

	ft_list_sort:
		mov rdx, rsi
		mov r8, [rdi]
		cmp r8, 0
		je _exit
		mov r9, [r8 + 8]
		jmp _loop

	_loop:
		cmp r8, 0
		je _exit
		jmp _loopAux

	_resetLoopAux:
		mov r8, [r8 + 8]
		cmp r8, 0
		je _exit
		mov r9, [r8 + 8]
		jmp _loop

	_loopAux:
		cmp r9, 0
		je _resetLoopAux
		mov rdi, [r8]
		mov rsi, [r9]
		call rdx
		jns _swap
		mov r9, [r9 + 8]
		jmp _loop

	_swap:
		mov r10, [r8]
		mov r11, [r9]
		mov [r8], r11
		mov [r9], r10
		mov r9, [r9 + 8]
		jmp _loop

	_exit:
		ret
