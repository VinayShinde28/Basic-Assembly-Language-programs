section .data
	Array dd 10,20,30,40,-1
	msg db "Addition is %d",10,0
	section .text
	global main
	extern printf
main:	
	xor ecx,ecx,
	xor esi,esi
lp:	mov ebx , Array
	mov eax ,4
	mul ecx
	add ebx ,eax

	cmp dword[ebx],-1
	jz  endof
	add esi,dword[ebx]
	pusha
	push dword[ebx]
	;; push msg
	;; call printf
	add esp,8
	popa
	inc ecx
	jnp lp
endof:
	push msg
	call printf
        ret
