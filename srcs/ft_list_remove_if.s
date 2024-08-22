bits 64

;rdi = 1st (r8 & r9)
;rsi = 2nd (rsi)
;rdx = 3rd (r14)
;rcx = 4th (r15)

extern free

section .text
	global ft_list_remove_if

	ft_list_remove_if:
		mov r8, [rdi]
		mov r14, rdx
		mov r15, rcx
		cmp r8, 0
		je _exit
		jmp _checkFirst

	_checkFirst:
		push rdi
		mov rdi, [r8]
		mov rdx, r14
		call rdx
		je _deleteFirst
		pop rdi
		mov r9, [r8 + 8]
		jmp _loop

	_deleteFirst:
		; mov rcx, r15
		; call rcx
		pop rdi
		mov r9, [r8 + 8]
		mov [rdi], r9
		mov rdi, r8
		; call free
		jmp _loop

	_loop:
		cmp r9, 0
		je _exit
		mov rdi, [r9]
		mov rdx, r14
		call rdx
		cmp rax, 0
		je _delete
		mov r8, [r8 + 8]
		mov r9, [r9 + 8]
		jmp _loop

	_delete:
		; mov rcx, r15
		; call rcx
		mov rdi, r9
		mov r9, [r9 + 8]; crash wen i free the data and i don't freaking know
		mov [r8 + 8], r9; ptet free le next du noeud precedant pour tout corriger ?
		mov r8, [r8 + 8]
		; call free
		jmp _loop

	_exit:
		ret
