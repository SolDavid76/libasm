bits 64

extern __errno_location

section .text
	global ft_read

	ft_read:
		mov rax, 0
		syscall
		test rax, rax
		js _error
		ret

	_error:
		neg rax
		push rax
		call __errno_location
		pop QWORD [rax]
		mov rax, -1
		ret
