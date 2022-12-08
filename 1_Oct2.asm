section .data
		a dd 0
		b dd 30
		c dd 45
		d dd 90
		tem dd 180
		pi dq 3.14
		msg dq "cos 45 is :%f",10,0
section .text
		global main
		extern printf
		
main:
		;fild dword[a] 

		;fld qword[a]
		;fcos 
		
		;fild dword[b]
		;fcos
		
		;fild dword[c]
		;fcos
		
		fild dword[tem]
		fild dword[d]
		fdiv st0,st1
		fld qword[pi]
		fmul st0,st1
		fcos
		
		;fild dword[d]
		;fsin
		
		;fild dword[a]
		;fsin
		
		sub esp,8
		fstp qword[esp]
		push msg
		call printf
		add esp,12
		
		ret
