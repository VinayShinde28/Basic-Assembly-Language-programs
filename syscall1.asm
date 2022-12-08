section .data
	String db "String is tobe printed",10,0
	len equ $-String
	
section .text
	global main
	extern puts
	
main:
	push String
	call puts
	add esp,4
	ret
