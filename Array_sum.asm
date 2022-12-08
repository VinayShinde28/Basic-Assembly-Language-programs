section .data
		arr dd 10,20,30,40,-1,0
		msg db "Addition of array is %d",10,0
		
section .text
		global main
		extern printf
		
main:
		xor esi,esi
		xor ecx,ecx
		xor eax,eax
lp:		mov ebx,arr
		mov eax,4
		mul ecx
		add ebx,eax
		cmp dword[ebx],-1
		jz endof
		add esi,dword[ebx]
		inc ecx
		jmp lp
		
endof:	push esi
		push msg
		call printf
		add esp,8
		ret		
