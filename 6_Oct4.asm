section .data
		a dd 20
		b dd 20

section .text
		global main


main:
		mov eax,dword[a]
		mov ebx,dword[b]
		xor eax,ebx
		mov eax,dword[a]
		cmovnc eax,ebx
		ret
