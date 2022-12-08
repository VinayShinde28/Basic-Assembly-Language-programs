;Give the length of the string
section .data
	mystring db "Low Level Assembly Program",0
	msg db "Length is %d",10,0
	
section .text
	global main
	extern printf
	
main:
	xor ecx,ecx
	mov esi ,mystring
	
lp1:	cmp byte[esi],0
	jz lp
	inc ecx
	inc esi
	jmp lp1
	
lp:	push ecx
	push msg
	call printf
	add esp,8
	ret
