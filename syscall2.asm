section .data
	String db "String is to be printed",10,0
	len equ $-String
	
section .text
	global main
	extern puts
	
main:
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,String		;
	mov edx,len
	int 0x80
	
	ret
