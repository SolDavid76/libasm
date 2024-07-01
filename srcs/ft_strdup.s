bits 64

extern ft_strlen
extern malloc
extern ft_strcpy

section .text
	global ft_strdup

	ft_strdup:
		call ft_strlen
		push rdi
		add rdi, 1
		mov rdi, rax
		call malloc
		mov rdi, rax
		pop rsi
		call ft_strcpy
		ret
