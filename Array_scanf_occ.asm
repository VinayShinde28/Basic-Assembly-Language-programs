section .data
	input dd "%d",0
	msg db "%d number occured %d times in the array ",10,0
	msg1 db "Enter the count required : ",0
	msg2 db "Number entered by you is %d",10,0
	msg3 db "Enter the number that you want to search : ",0
	
section .bss
	n resd 1
	x resd 1
	Array resd 10
	
section .text
	global main
	extern printf , scanf
	
main:
	push msg1
	call printf 
	add esp,4
	
	push n
	push input
	call scanf
	add esp,8
	
	xor ecx,ecx
lp:	mov ebx , Array
	mov eax,4
	mul ecx
	add ebx,eax

	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx ,dword[n]
	jl lp
	
	push msg3
	call printf
	add esp,4
	
	push x
	push input
	call scanf
	add esp,8
	
	xor ecx,ecx
	xor esi,esi
	xor edi , edi
	mov edi,[x]
lp2:	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	cmp dword[ebx],edi
	jz lp3
lp4:	inc ecx
	cmp ecx,dword[n]
	jl lp2
	jmp endof
	
lp3: inc esi
	jmp lp4
	
endof:
	push esi
	push edi
	
	push msg	
	call printf
	add esp,12
	
	ret
