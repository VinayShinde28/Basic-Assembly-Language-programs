section .data
	student db "Ramesh Suresh Joshi,M,Msc,2017",0
			db "Sumukhil Dinesh Rajeshwar,F,MSc,2011",0
			db "Rinku Rajendra Rane,F,MCA,2020",0
			db "Sunil Ashok Wagh,M,MSc,2011",0
			db "Jignesh Raju More,M,MSc,2017",0
	len equ $-student
	year db "2017",0
	course db "MSc"
	
section .bss
	record resb 10
		
section .text
	global main
	
main:
		mov edi,student
		mov ecx,len
lp1:		mov esi,edi
		mov al,' '
		repnz scasb
		mov edx,edi
		sub edx,esi
		push esi
		push edx
		mov al,','
		repnz scasb
		repnz scasb
		mov esi,course
		push ecx
		
		mov ecx,3
		repz cmpsb
		jnz lp
		inc edi
		mov esi,year
		mov ecx,4
		repnz cmpsb
		jnz lp
		mov edx,4
		pop edx
		pop ecx
		mov ebx,1
		int 0x80
		
lp:		mov al,0
		repnz scasb	
		cmp byte[edi],-1
		jnz lp1
		
		
terminate:		ret
		
		
			
