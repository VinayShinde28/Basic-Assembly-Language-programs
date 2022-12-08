section .data
	mystring db "vinay",0
	len equ $-mystring
	msg1 db "String is pallendrome",10,0
	len2 equ $-msg1
	msg2 db "String is not a pallendrome",10,0
	len3 equ $-msg2

section .text
	global main
	
main:
	mov esi, mystring
	add esi , len
	mov edi , mystring
	dec esi
	dec esi
	
lp3:	xor eax,eax
	mov al , byte[edi]
	cmp byte[esi],al
	jnz lp
	inc edi
	dec esi
	cmp esi,edi
	jl lp2
	jmp lp3
	
	
lp:
	;push msg2
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,msg2	;
	mov edx,len3
	int 0x80
	jmp endof
	
	
lp2:
	;push msg1
	mov eax,4	;write system call number is 4
	mov ebx,1	;first  argument of fun
	mov ecx,msg1		;
	mov edx,len2
	int 0x80
	jmp endof	
	
endof:
	ret
