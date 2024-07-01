bits 64

extern ft_strlen
extern malloc
extern ft_strcpy

section .text
	global ft_strdup

	ft_strdup:
		mov rax, 0
		call ft_strlen
		mov rbx, rdi
		mov rdi, rax
		inc rdi
		call malloc
		mov rdi, rax
		mov rsi, rbx
		call ft_strcpy
		ret
