section .data
		input dd "%d",10,0
		msg1 db "Enter the number ",10,0
		msg db "Factorial of %d is %d",10,0
		
section .bss
		x resd 1
		
section .text
		global main
		extern printf,scanf
		
main:
		push msg1
		call printf
		add esp,4
		
		push x
		push input
		call scanf
		add esp,8
		
		xor esi,esi
		mov eax,1
		mov ecx,[x]
lp:		cmp ecx,0
		jz endof
		mul ecx
		add esi,eax
		dec ecx
		jmp lp
		
endof:	
		push eax
		push dword[x]
		push msg
		call printf
		add esp ,12
		
		ret
