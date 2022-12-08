section .data
		a dd 20
		b dd 40

section .text
		global main


main:
		mov eax,dword[a]
		mov ebx,dword[b]
		cmp eax,ebx
		cmovnbe eax,ebx
		ret
