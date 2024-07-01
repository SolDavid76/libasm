bits 64

section .text
	global ft_strcpy

	ft_strcpy:
		xor rax, rax
		xor rcx, rcx
		jmp _loop

	_loop:
		cmp BYTE [rsi + rcx], 0 ; if (rsi[rcx] == 0)
		mov al, [rsi + rcx]     ; al = rsi[rcx]
		mov [rdi + rcx], al     ; rdi[rcx] = al
		je _exit
		inc rcx
		jmp _loop

	_exit:
		mov rax, rdi
		ret
