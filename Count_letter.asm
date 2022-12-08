section .data
	input db "%c",0
	mystring db "Low Level Assembly Program",0
	msg db "Length is %d",10,0
	msg1 db "Number of Letters are %d",10,0	
	msg2 db "Enter the caracter that you want to search : ",10,0
	
section .bss
	x resb 1
	
section .text
	global main
	extern printf,puts,scanf
	
main:
	push msg2
	call printf
	add esp , 4
	
	push x
	push input
	call scanf
	add esp,8
	
	mov esi,mystring
	xor ecx,ecx
lp:	xor eax,eax
	cmp byte[esi],0
	jz lp1
	mov al, byte[x]
	cmp byte[esi],al
	jnz lp2
	inc ecx
lp2:	inc esi
	jmp lp
lp1:	push ecx
	push msg1
	call printf
	add esp,8
	
	ret
