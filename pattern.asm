section .data
	str1 db "*",0
	str2 db " ",0
	str3 db "",10,0
	
section .text
	global main
	extern printf
	
main:
	mov eax,str1
	mov ebx,str2
	mov edx,str3
	
	mov ecx,5
lp2:	pusha
	
	
	mov ecx,5
lp:	pusha
	push str1
	call printf
	add esp,4
	push str2 
	call printf
	add esp,4
	popa

	dec ecx 
	cmp ecx,0
	jz lp1
	jmp lp
	
lp1:
	push str3
	call printf
	add esp,4 
	popa
	dec	ecx
	cmp ecx ,0
	jz lp3
	jmp lp2	
	

lp3:
	ret
