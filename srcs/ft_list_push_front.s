bits 64

extern malloc

section .text
	global ft_list_push_front

	ft_list_push_front:
		push rdi
		mov rdi, rsi
		call _lstnew
		pop rdi
		mov r8, [rdi]
		mov [rax + 8], r8
		mov [rdi], rax
		jmp _exit

	_lstnew:
		push rdi
		mov rdi, 16
		call malloc
		pop rdi
		mov [rax], rdi
		mov QWORD [rax + 8], 0
		ret

	_exit:
		ret
