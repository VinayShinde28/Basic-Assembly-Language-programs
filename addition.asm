section .data
	a dd 10
	b dd 20
	msg db "The addition is %d",10,0
	
section .text
	global main
	extern printf
	
main:
	mov eax ,[a]
	add eax ,[b]
	push eax
	push msg
	call printf
	add esp , 8
	ret
