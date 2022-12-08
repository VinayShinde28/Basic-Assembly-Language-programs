#include<stdio.h>

int main()
{
	int a = 5;
	int result;
	asm("lp:imull %%eax,%%ecx\n\t"
		"loop lp\n\t"
		:"=a"(result)
		: "b"(a), "c"(1));
	printf("%d\n",result);
	
	return 0;
}

