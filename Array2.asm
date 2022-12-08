section .data
	input db "%d",0
	msg db "Entrr count required : ",0
	msg1 db "Number enterted by you is %d",10,0
	msg2 db "Minimum element of array is %d",10,0
	
	section .bss
		n resd 1
		myarray resd 10
		min resd 1
	
	section .text
		global main
		extern printf,scanf
		
main:
		push msg 
		call printf
		add esp ,4
		
		push n 
		push input
		call scanf
		add esp , 8
		
		push dword[n]
		push msg1
		call printf
		add esp , 8
		
		xor ecx ,ecx
lp:		mov ebx ,myarray
		mov eax , 4
		mul ecx 
		add ebx ,eax
		
		pusha
		push ebx 
		push input
		call scanf
		add esp,8
		popa
		mov min , dword[ebx]
		inc ecx
		cmp ecx ,dword[n]
		jl lp
		
		xor ecx , ecx
lp1:	mov ebx , myarray
		mov eax , 4
		mul ecx
		add ebx ,eax
		
		pusha
		cmp ecx , dword[ebx]
		jl lp2
lp2:	mov min , dword[ebx] 
		jng lp1
		inc ecx
		cmp ecx ,dword[n]
		jl lp1
		
		push min
		push msg2
		call printf
		
		
		ret
		
