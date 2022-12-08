#include<stdio.h>

int main()
{
	int data1 = 10;
	int data2 = 30;
	int result;
	
	asm ( "imull %%edx , %%ecx\n\t"
		  "movl %%ecx, %%eax"
		  : "=a"(result)
		  : "d"(data1), "c"(data2));
		  
	printf("THe result is %d\n",result);
	
	return 0;
}
