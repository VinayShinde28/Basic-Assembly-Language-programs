section .data
    msg1 db "Insufficient parameters/argruments",10,0
    msg2 db "envp[%d] = %s and argv[%d] = %s",10,0
    msg3 db "%s",10,0
section .bss
section .text
   global main
   extern printf
   
main:  
     push ebp
     mov ebp, esp
    
     mov ecx,[ebp+8]
     cmp ecx,2
     jb end1
     xor edx,edx
lp:  push edx
     mov esi,[ebp+12]                ;argv        
     mov edi,[ebp+16]                ;envp
     push dword[esi+edx*4]           ;argv[i]
     push edx                        ;i
     push dword[edi+edx*4]           ;envp[i]
     push edx                        ;i
     push msg2
     call printf
     add esp,20
     pop edx
     inc edx
     cmp edx,5
     jb lp
     jmp terminater
     
end1:  push msg1
       call printf
       add esp,4

terminater:

     mov esp, ebp
     pop ebp
     ret
