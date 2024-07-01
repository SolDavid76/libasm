bits 64

section .text
	global ft_strcmp

	ft_strcmp:
		xor rax, rax
		xor rcx, rcx
		jmp _loop

	_loop:
		mov al, [rdi + rcx] ; al = rdi[rcx]
		mov bl, [rsi + rcx] ; bl = rsi[rcx]
		cmp al, 0           ; if (al == 0)
		je _exit
		cmp al, bl          ; if (al == bl)
		jne _exit
		inc rcx             ; rcx++
		jmp _loop

	_exit:
		sub al, bl
		movsx rax, al
		ret
