bits 64

section .text
	global ft_strcpy

	ft_strcpy:
		mov rcx, 0
		jmp _loop

	_loop:
		mov al, [rsi + rcx]     ; al = rsi[rcx]
		mov [rdi + rcx], al     ; rdi[rcx] = al
		cmp BYTE [rsi + rcx], 0 ; if (rsi[rcx] == 0)
		je _exit
		inc rcx
		jmp _loop

	_exit:
		mov rax, rdi
		ret
