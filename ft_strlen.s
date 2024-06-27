bits 64

section .text
	global ft_strlen

	ft_strlen:
		xor rax, rax
		jmp _loop

	_loop:
		cmp BYTE [rdi + rax], 0 ; if (rdi[rax] == 0)
		je _end
		inc rax                 ; rax++
		jmp _loop

	_end:
		ret
