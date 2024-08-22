bits 64

extern ft_strlen
extern malloc
extern ft_strcpy

section .text
	global ft_strdup

	ft_strdup:
		call ft_strlen
		push rdi
		mov rdi, rax
		add rdi, 1
		call malloc
		mov rdi, rax
		pop rsi
		call ft_strcpy
		ret
