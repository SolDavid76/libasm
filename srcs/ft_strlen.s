bits 64

section .text
	global ft_strlen

	ft_strlen:
		mov rax, 0
		jmp _loop

	_loop:
		cmp BYTE [rdi + rax], 0 ; if (rdi[rax] == 0)
		je _exit
		inc rax                 ; rax++
		jmp _loop

	_exit:
		ret
