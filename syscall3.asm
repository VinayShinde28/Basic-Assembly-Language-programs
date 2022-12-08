section .data
	String db "Your input character is ",0
	len equ $-String
	newl db 10 
	section .bss
	a resb 1
		
section .text
	global main
	extern puts
	
main:
	
	mov eax,3	;read system call number is 3
	mov ebx,0
	mov ecx,a
	mov edx,1
	int 80h
	
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,String		;
	mov edx,len
	int 0x80
	
	
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,a		;
	mov edx,1
	int 0x80
	
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,newl		;
	mov edx,1
	int 0x80
	
	mov eax ,4
	mov ebx ,1
	mov ecx,String
	mov edx,len
	int 0x80
	
	ret
