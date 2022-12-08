section .data
	input db "%d",0
	msg db "Enter the count : ",0
	msg1 db "Entered valued is : %d",10,0
	msg2 db "Maximum is %d",10,0
	
section .bss 
	n resd 1
	myarray resd 10
	
section .text
	global main
	extern printf,scanf
	
main:
	push msg
	call printf
	add esp,4
	
	push n
	push input
	call scanf
	add esp , 8
	
	push dword[n]
	push msg1
	call printf
	add esp , 8
	
	xor ecx, ecx
lp:	mov ebx , myarray
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
	jl lp
	
	xor ecx ,ecx
	mov ebx , myarray
lp3:	mov esi,dword[ebx]
	cmp esi,myarray[0]
	jnz lp4
lp2:	mov ebx ,myarray
	mov eax,4
	mul ecx
	add ebx,eax
	
	cmp dword[ebx],esi
	jg lp3
lp4:	inc ecx
	cmp ecx,dword[n]
	jl lp2
	
	push esi
	push msg2
	call printf
	add esp,8
	
	ret	
