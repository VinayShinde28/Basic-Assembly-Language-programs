section .data
		input db "%d",0
		msg2 db "After Bubble sort :",10,0
		output db "%d",10,0
section .bss 
		n resd 1
		myarray resd 10
	
section .text
		global main
		extern printf,scanf
	
main:	
		push n
		push input
		call scanf
		add esp,8
		
		xor ecx,ecx
lp:		mov ebx,myarray
		mov eax , 4
		mul ecx
		add ebx,eax

		pusha
		push ebx
		push input
		call scanf
		add esp,8
		popa
		
		inc ecx
		cmp ecx , dword[n]
		jne lp
		
		xor ecx,ecx
lp2:	mov ebx,myarray
		mov eax,4
		mul ecx
		add ebx,eax
		
		pusha
		xor edi,edi
lp3:	mov esi,myarray
		mov eax,4
		mul edi
		add esi,eax
		
		pusha
		mov eax,dword[esi]
		cmp eax,dword[esi+4]
		jl i
		mov eax,dword[esi]
		mov edx,dword[esi+4]
		mov dword[esi],edx
		mov dword[esi+4],eax

i:		popa
		inc edi
		mov edx,dword[n]
		sub edx,ecx
		sub edx,1
		cmp edi,edx
		jl lp3
		popa
		inc ecx
		mov esi,dword[n]
		dec esi
		cmp ecx,esi
		jne lp2
			
		push msg2
		call printf
		add esp,4
		
		xor ecx,ecx	
lp4:	mov ebx,myarray
		mov eax , 4
		mul ecx
		add ebx,eax

		pusha
		push dword[ebx]
		push output
		call printf
		add esp,8
		popa
		inc ecx
		cmp ecx ,dword[n]
		jl lp4
		
		ret
