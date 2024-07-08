bits 64

section .text
	global ft_atoi_base

	ft_atoi_base:
		mov rax, 0
		mov rcx, -1
		mov r8, 0
		jmp _baseLen

	_baseLen:
		cmp BYTE [rsi + r8], 0
		je _checkBase
		inc r8
		jmp _baseLen

	_checkBase: ; check if there is a whitespace, - or + in the base
		inc rcx
		cmp BYTE [rsi + rcx], 9
		je _exit
		cmp BYTE [rsi + rcx], 10
		je _exit
		cmp BYTE [rsi + rcx], 11
		je _exit
		cmp BYTE [rsi + rcx], 12
		je _exit
		cmp BYTE [rsi + rcx], 13
		je _exit
		cmp BYTE [rsi + rcx], 32
		je _exit
		cmp BYTE [rsi + rcx], 43
		je _exit
		cmp BYTE [rsi + rcx], 45
		je _exit
		jmp _endCheckBase

	_endCheckBase:
		push rsi
		mov rcx, 0
		jmp _parseBase

	_parseBase: ; check if there is a charater twice
		inc rcx
		cmp BYTE [rsi], 0
		je _endParseBase
		mov dl, [rsi]
		cmp dl, BYTE [rsi + rcx]
		je _exit
		cmp BYTE [rsi + rcx], 0
		jne _parseBase
		mov rcx, 0
		inc rsi
		jmp _parseBase

	_endParseBase:
		pop rsi
		mov rcx, -1
		jmp _skipWhiteSpace

	_skipWhiteSpace:
		inc rcx
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
		jmp _endSkipWhiteSpace

	_endSkipWhiteSpace:
		add rdi, rcx
		mov rcx, -1
		mov rdx, 1
		jmp _skipSign

	_skipSign:
		inc rcx 
		cmp BYTE [rdi + rcx], 43
		je _skipSign
		cmp BYTE [rdi + rcx], 45
		jne _endSkipSign
		neg rdx
		jmp _skipSign

	_endSkipSign:
		push rdx
		mov rdx, 0
		add rdi, rcx
		mov rcx, -1
		jmp _digitConvertion

	_digitConvertion:
		inc rcx
		cmp BYTE [rsi + rcx], 0
		je _exit
		mov dl, BYTE [rdi]
		cmp BYTE [rsi + rcx], dl
		jne _digitConvertion
		imul rax, r8
		add rax, rcx
		mov rcx, -1
		inc rdi
		cmp BYTE [rdi], 0
		jne _digitConvertion
		jmp _exit

	_exit:
		pop rdx
		imul rax, rdx
		ret
