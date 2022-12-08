section .data
	input dd "%d",0
	input1 dd "%d  ",0
	msg db "Enter the count : ",0
	msg1 db "Enter the %dth number of the array : ",0
	msg2 db "Addition : %d",10,0
	msg3 db "Enter the first array",10,0
	msg4 db "Enter the second array",10,0
	
section .bss
	Array1 resd 10
	Array2 resd 10
	Array3 resd 10
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
	
	push msg3
	call printf
	add esp,4
	
	xor ecx, ecx
lp:	mov ebx , Array1
	mov eax , 4
	mul ecx
	add ebx,eax

	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx , dword[n]
	jl lp
	
	push msg4
	call printf
	add esp,4
	
	xor ecx, ecx
lp2:	mov ebx , Array2
	mov eax , 4
	mul ecx
	add ebx,eax

	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx , dword[n]
	jl lp2	
	
	xor ecx,ecx
lp3:	mov ebx,Array1
	mov esi,Array2
	mov edi,Array3
	mov eax , 4
	mul ecx
	add ebx,eax	
	add esi,eax
	add edi,eax
	
	mov edx,dword[ebx]
	add edx,dword[esi]
	mov dword[edi],edx
	
	inc ecx
	cmp ecx , dword[n]
	jl lp3
	
	xor ecx ,ecx
lp1:	mov ebx ,Array3
	mov eax , 4
	mul ecx 
	add ebx ,eax
	
	pusha
	push dword[ebx]
	push msg2
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx ,dword[n]
	jl lp1

	
	
	ret
