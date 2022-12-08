section .data
	myarray dd 10,5,20,4,50,-1
	msg db "The maximum element of the array is %d",10, 0
section .text
	global main
	extern printf
	
main:
	xor esi,esi
	xor ecx,ecx
	mov ebx , myarray
lp2:	mov esi , dword[ebx]
lp:	mov ebx , myarray
	mov eax ,4
	mul ecx
	add ebx ,eax
	cmp dword[ebx] , -1
	jz endof
	cmp esi, dword[ebx]
	jl lp2
	inc ecx
	jmp lp

	
endof :
	
	push esi
	push msg
	call printf
	add esp , 8
	ret
