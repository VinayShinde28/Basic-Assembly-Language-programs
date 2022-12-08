section .data
	msg db "Factorial is %d",10,0
		
section .text
		global main
		extern printf,fact
		
main:
		push eax
		push 5
		call fact 
		push eax
		push msg
		call printf
		add esp,8
		ret
