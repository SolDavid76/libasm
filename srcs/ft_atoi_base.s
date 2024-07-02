bits 64

extern ft_strlen

; rdi = str (x*[whiteSpace] + x*[+-] + x*[0-9])
; rsi = base

section .text
	global ft_atoi_base

	ft_atoi_base: ; need a base parse but the core work !! :)
		push rdi
		mov rdi, rsi
		call ft_strlen
		mov r9, rax

		pop rdi
		mov rax, 0
		mov rcx, -1
		mov r8, 1

	_checkWhiteSpace:
		inc rcx
		cmp BYTE [rdi + rcx], 9
		je _checkWhiteSpace
		cmp BYTE [rdi + rcx], 10
		je _checkWhiteSpace
		cmp BYTE [rdi + rcx], 11
		je _checkWhiteSpace
		cmp BYTE [rdi + rcx], 12
		je _checkWhiteSpace
		cmp BYTE [rdi + rcx], 13
		je _checkWhiteSpace
		cmp BYTE [rdi + rcx], 32
		je _checkWhiteSpace
		jmp _endCheckWhiteSpace

	_endCheckWhiteSpace:
		add rdi, rcx
		mov rcx, -1
		jmp _checkSign

	_checkSign:
		inc rcx 
		cmp BYTE [rdi + rcx], 43
		je _checkSign
		cmp BYTE [rdi + rcx], 45
		jne _endCheckSign
		neg r8 ; use rdx then push it on stack
		jmp _checkSign

	_endCheckSign:
		add rdi, rcx
		mov rcx, -1
		jmp _digitConvertion

	_digitConvertion:
		inc rcx
		mov dl, BYTE [rdi] ; rdx
		cmp BYTE [rsi + rcx], dl
		jne _digitConvertion
		imul rax, r9
		add rax, rcx
		mov rcx, -1
		inc rdi
		cmp BYTE [rdi], 0
		jne _digitConvertion
		jmp _exit

	_exit:
		imul rax, r8
		ret
