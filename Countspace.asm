section .data
	mystring db "Low Level Assembly Program",0
	msg db "Length is %d",10,0
	msg1 db "Number of space is %d",10,0
	
section .text
	global main
	extern printf,puts
	
main:
	mov esi,mystring
	xor ecx,ecx
lp:	xor eax,eax
	cmp byte[esi],0
	jz lp1
	mov al,' '
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
