#include<stdio.h>

int a;
int b; 
int result;

int main()
{
	asm (	
			"movl a, %eax\n\t"
			"movl b, %ebx\n\t"
			"imull %ebx ,%eax\n\t"
			"movl %eax , result\n\t");
		
	printf("The answer is %d\n", result);
		

	return 0;
}
