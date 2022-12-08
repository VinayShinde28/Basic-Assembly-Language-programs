section .data
	input db "%d",0
	msg dq "Sum of 1/i factorial is:%f",10,0
section .bss
		n resd 1		
		sum resq 1
		tem resq 1
		
section .text
		global main
		extern scanf,printf,fact
		
main:
		push n
		push input
		call scanf
		add esp,8
		
		fldz
		fstp qword[sum]
		
		mov ecx,dword[n]
lp:		push ecx
		push ecx
		call fact
		add esp,4
		
		mov dword[tem],eax
		
		fild dword[tem]
		fld1
		fdiv st0,st1
		fadd qword[sum]
		fstp qword[sum]
		fstp qword[tem]
		
		pop ecx
		loop lp
		
		sub esp,8
		fild qword[sum]
		fstp qword[esp]
		push msg
		call printf
		add esp,12
		ret
