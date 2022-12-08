section .data
		input dd "%d",10,0
		msg db "Enter the size of Array",10,0
		msg1 db "Enter the elemete at [%d]: ",10,0
		msg2 db "Addition of array is %d",10,0
		
section .bss
		arr resd 10
		len resd 1
		
section .text
		global main
		extern printf,scanf
		
main:
		push msg
		call printf
		add esp,4
		
		push len
		push input
		call scanf
		add esp,8
		
		xor ecx,ecx
		xor ebx,ebx
lp:		mov ebx,arr
		mov eax,4
		mul ecx
		add ebx,eax
		pusha
		push ecx
		push msg1
		call printf
		add esp,8
		popa
		
		pusha
		push ebx
		push input
		call scanf
		add esp,8
		popa
		
		inc ecx
		cmp ecx,[len] 
		jnz lp
		
		xor ecx,ecx
		xor ebx,ebx
		xor esi,esi
lp2:	mov ebx,arr
		mov eax,4
		mul ecx
		add ebx,eax
		
		add esi,dword[ebx]
		
		inc ecx
		cmp ecx,[len]
		jnz lp2
		
;endof:	
		push esi
		push msg2
		call printf
		add esp,8
		ret
