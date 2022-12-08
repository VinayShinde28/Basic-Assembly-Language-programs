section .data
		input db "%d",0
		msg db "After Insertion sort:",10,0
		output db "%d",10,0
		
section .bss
		n resd 1
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
		inc ecx
lp3:	mov esi,myArray
		mov eax,4
		mul ecx
		add esi,eax
		
		pusha
		
		mov ebx,ecx
		dec ebx
		mov ecx,dword[esi]
lp4:	mov edi,myArray
		mov eax,4
		mul ebx
		add edi,eax
		
		mov eax, dword[edi]
		cmp dword[edi+4],eax
		jl i
		mov eax,edi	
		add eax,4
		mov edx,dword[edi]
		mov dword[eax],edx

i:		dec ebx
		cmp ebx,0
		jge lp4
		
		mov eax,4
		mul ebx
		add edi,eax
		
		mov dword[edi],ecx
		popa
		
		inc ecx
		cmp ecx,dword[n]
		jl lp3
		
		
		push msg
		call printf
		add esp,4
		
		xor ecx,ecx
lp1:	mov esi,myArray
		mov eax,4
		mul ecx
		add esi,eax
		
		pusha
		push dword[esi]
		push output
		call printf
		add esp ,8
		popa
		
		inc ecx
		cmp ecx,dword[n]
		jl lp1
		
		ret
