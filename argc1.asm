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
     ;mov ecx,[ebp+4]
     mov ecx,[ebp+8]
     cmp ecx,2
     jb end1
     xor edx,edx
     mov esi,[ebp+12]
     push dword[esi+4]
     push msg3
     call printf
     add esp,8
     jmp terminater
     
end1:  push msg1
       call printf
       add esp,4

terminater:

     mov esp, ebp
     pop ebp
     ret
