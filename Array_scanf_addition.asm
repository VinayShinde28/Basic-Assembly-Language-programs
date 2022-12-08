section .data
	input dd "%d",10,0
	msg db "Enter the count : ",0
	msg1 db "Enter the %d th number of array : ",10,0
	msg2 db "Addition is %d:",10,0
	
section .bss
	Array resd 10
	n resd 1
	
section .text
	global main
	extern printf,scanf
	
main:
	push msg
	call printf
	add esp,4
	
	push n
	push input
	call scanf
	add esp,8
	
	xor ecx,ecx
lp:	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	
	pusha
	push ecx
	push msg1
	call printf
	add esp,8
	
	push ebx
	push input
	call scanf
	add esp,8
	popa
	
	inc ecx
	cmp ecx ,dword[n]
	jl lp

	xor esi,esi	
	xor ecx,ecx
lp2:	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	
	add esi,dword[ebx]
	
	inc ecx
	cmp ecx,dword[n]
	jl lp2
	
	push esi
	push msg2
	call printf
	add esp,8
	
	ret
