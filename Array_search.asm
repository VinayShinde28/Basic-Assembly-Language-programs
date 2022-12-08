section .data
	input dd "%d",0
	Array dd 10,50,30,40,20,-1
	msg db "Number is found %d",10,0
	msg1 db "Number is not found %d",10,0
	msg2 db "Enter the number to search ",0
	
section .bss
	x resd 1
	
section .text
	global main
	extern printf , scanf
	
main:
	push msg2
	call printf
	add esp,4
	
	push x
	push input
	call scanf
	add esp,8
	
	xor esi,esi
	mov esi,[x]
	xor ecx,ecx
lp:	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	
	cmp dword[ebx],-1
	jz endof
	cmp dword[ebx],esi
	jz lp2
	inc ecx
	jmp lp
	
lp2:
	push esi
	push msg
	call printf
	add esp,8
	ret
	
	
	
endof:	
	push dword[x]
	push msg1
	call printf
	add esp,8
	ret
