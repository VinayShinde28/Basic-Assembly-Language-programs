#include<stdio.h>


int a = 5;
int result;

int main()
{
	asm( //"movl a , %ecx\n\t"
		 "movl 1, %eax\n\t"
		 "movl 1 , %ebx\n\t"
		 "lp: imull %ebx ,%eax\n\t"
		 "inc %ebx"
		 "cmp %ebx ,a"
		 "jnz lp"
		 "movl %eax,result\n\t"	
	);
	printf("%d\n",result);
	
	return 0;
}
