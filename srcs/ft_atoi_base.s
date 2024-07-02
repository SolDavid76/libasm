bits 64

extern ft_strlen

; rdi = str (x*[whiteSpace] + x*[+-] + x*[0-9])
; rsi = base

section .text
	global ft_atoi_base

	ft_atoi_base:
		; push rdi
		; mov rdi, rsi
		; call ft_strlen

		; pop rdi
		mov rcx, -1

	_skipWhiteSpace:
		inc rcx
		; cmp BYTE [rdi + rcx], 0
		; je _exit
		cmp BYTE [rdi + rcx], 9
		je _skipWhiteSpace
		cmp BYTE [rdi + rcx], 10
		je _skipWhiteSpace
		cmp BYTE [rdi + rcx], 11
		je _skipWhiteSpace
		cmp BYTE [rdi + rcx], 12
		je _skipWhiteSpace
		cmp BYTE [rdi + rcx], 13
		je _skipWhiteSpace
		cmp BYTE [rdi + rcx], 32
		je _skipWhiteSpace
		jmp _exit

	_skipSign:
		inc rcx

	_exit:
		mov rax, rcx
		ret
