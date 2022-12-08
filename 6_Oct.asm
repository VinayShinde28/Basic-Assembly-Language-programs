section .data
		a dd 10
		b dd 20

section .text
		global main

main:
		mov eax,dword[a]
		mov ebx,dword[b]
		cmp eax,ebx
		cmovae eax,ebx
		ret
