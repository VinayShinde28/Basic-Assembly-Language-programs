section .data
		a dd 30
		b dd 20

section .text
		global main


main:
		
		mov eax,dword[a]
		mov ebx,dword[b]
		cmp eax,ebx
		cmova eax,ebx
		ret
