section .data
	str1 db "* ",0
	str2 db "  ",0
	str3 db "",10,0
	
section .text
	global main
	extern printf
	
main:

	mov eax,str1
	mov ebx,str2
	mov edx,str3
	
	mov esi,0
lp3:
	cmp esi,5
	jz lp
	pusha
	

	mov ecx,0
lp2:
	cmp ecx,5
	jz lp1
	pusha	
	
	cmp ecx,esi
	jg lp4
	
	push eax
	call printf
	add esp,4
	jmp lp5

lp4:
	push ebx
	call printf
	add esp,4
	
lp5:
	popa
	inc ecx
	jmp lp2
	
lp1:
	push edx
	call printf
	add esp,4
	
	popa
	inc esi
	jmp lp3
		
lp:	
	ret
