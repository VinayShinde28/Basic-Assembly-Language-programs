section .data
		a dq 2.3
		b dq 1.5
		input 
		
section .text
		global main
		extern printf
		
main:
		fld qword[a]
		fld qword[b]
		
		fcom
		
		fstsw ax
		sahf
		
		ret
