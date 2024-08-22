bits 64

section .text
	global ft_list_size

	ft_list_size:
		mov rax, 0
		jmp _loop

	_loop:
		cmp rdi, 0
		je _exit
		inc rax
		mov rdi, [rdi + 8]
		jmp _loop

	_exit:
		ret
