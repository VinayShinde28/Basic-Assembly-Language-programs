section .data
	Source db "Source string",10,0
	len equ $-Source
	
section .bss
	Destination resb len
	
section .text
	global main
	
main:
	mov esi,Source
	mov edi,Destination
	mov ecx,len
	xor eax,eax
	add esi,len
	dec esi
	
lp:	std
	lodsb	;	internally uses esi
	cld	
	stosb		; internally uses edi
	loop lp
	
	mov eax,4
	mov ebx,1
	mov ecx,Destination
	mov edx,len
	int 0x80
	
	ret
