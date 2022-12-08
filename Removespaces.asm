section .data
	Source db "Low level String",0
	len equ $-Source
	
section .bss
	fstring resb len
	sstring resb len
	fcount resb 1
	scount resb 1
	
section .text
	global main
	
main:
	mov esi,fstring
	mov edi,source
	mov al, ' '
repnz	scasb
	mov edx,edi
	mov esi,source
	sub edx,esi
	
	push ecx
	mov eax ,4
	mov rebx,1
	mov ecx,source
	int 0x80
	pop ecx
	
	ret
