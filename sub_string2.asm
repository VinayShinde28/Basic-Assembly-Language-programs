section .data
	first db "This is a source string containing string",0
	lenfirst equ $-first
	second db "string",0
	lensecond equ $-second
	found db "Sub-string Found",10,0
	notfound db "Substring not found",10,0
	
section .text
	global main
	extern printf

main:
	mov esi,first
	mov edi,second
lp:	mov al,byte[edi]
	cmp al,byte[esi]
	jnz	lp1
	inc esi
	inc edi
	cmp byte[esi],0
	jz towardsend
	jmp lp
	
lp1:	
	cmp byte[esi],' '
	jz lp2
	inc esi
	jmp lp1
	
lp2:
	inc esi
	cmp byte[edi],0
	jz towardsendother
	mov edi,second
	jmp lp
	
towardsend: 
	push notfound
	call printf
	add esp,4
	jmp endof
	
towardsendother:
	push found 
	call printf
	add esp,4
	jmp endof
	
endof:
	ret
