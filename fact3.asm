section .data
		msg db "Factorial of %d is %d",10,0
		
section .text
		global main
		extern printf
		
main:
		xor ecx ,ecx
		mov eax,1
		mov ecx , 5
lp:		mul ecx
		dec ecx
		cmp ecx , 0
		jnz lp
		
		push eax
		push 5
		push msg
		call printf
		add esp,12
		ret
