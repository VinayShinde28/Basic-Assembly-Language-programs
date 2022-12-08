section .data
	first db "This is a source string containing string123",0
	lenfirst equ $-first
	second db "string123",10
	lensecond equ $-second
	found  db "sub-String found",10,0
	notfound db "Substring not Found",10,0
section .text
	global main
	extern puts
main:
	mov esi,first
	mov edi, second
lp:	mov al,byte[edi]
	cmp al,byte[esi]
	jnz lp1
	inc esi
	inc edi
	cmp byte[esi],0
	jz towardsend
	jmp lp
	
lp1:
	cmp byte[esi],' '
	jz lp2
	cmp byte[esi],0
	jz lp2
	inc esi
	jmp lp1
lp2:	
	cmp byte[edi],10
	jz towardsendother
	inc esi
	mov edi, second
	jmp lp

towardsend:
	cmp byte[edi],10
	jz towardsendother
	push notfound
	call puts
	add esp,4
	jmp endofpg


towardsendother:
	dec edi
	dec esi
	mov al ,byte[esi]
	cmp byte[edi],al
	jnz towardsend
	
	push found
	call puts
	add esp,4
 endofpg : ret
	
