section .data
		input db "%d",0
		msg db "After Selection Sort : ",10,0
		output db "%d",10,0
		
section .bss
		n resd 1
		temp resd 1
		myArray resd 10
		
section .text
		global main
		extern printf,scanf
		
main:
		push n
		push input
		call scanf
		add esp,8
		
		xor ecx,ecx
lp:		mov esi,myArray
		mov eax,4
		mul ecx
		add esi,eax
		
		pusha
		push esi
		push input
		call scanf
		add esp,8
		popa
		
		inc ecx
		cmp ecx,dword[n]
		jne lp
	
		xor ecx,ecx
lp1:	mov esi,myArray
		mov eax,4
		mul ecx
		add esi,eax
		
		pusha
		mov ebx,ecx
		add ebx,1
		mov ecx,esi
lp3:	mov edi,myArray
		mov eax,4
		mul ebx
		add edi,eax
		
		mov eax,dword[edi]
		cmp eax,dword[ecx]
		jnl i
		mov ecx,edi
		
i:		inc ebx
		cmp	ebx,dword[n]
		jne lp3
		
		cmp esi,ecx
		jz j
		mov eax,dword[ecx]
		mov edi,dword[esi]
		mov dword[ecx],edi
		mov dword[esi],eax	
		
j:		popa
		inc ecx
		mov esi,dword[n]
		dec esi
		cmp ecx,esi
		jl lp1

		push msg
		call printf
		add esp,4
		
		xor ecx,ecx
lp2:	mov esi,myArray
		mov eax,4
		mul ecx
		add esi,eax
		
		pusha
		push dword[esi]
		push output
		call printf
		add esp,8
		popa
		
		inc ecx
		cmp ecx,dword[n]
		jne lp2
		
		ret
