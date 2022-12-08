section .text
		global fact
		
fact:	
		enter 0,0	
		mov ecx,dword[ebp+8]
		mov eax,1
lp:		xor edx,edx
		mul ecx
		loop lp
		leave
		ret			
