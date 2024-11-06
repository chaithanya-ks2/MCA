#include<stdio.h>
void main()
{
int i;
for(i=0;i<5;i++)
{

printf("%d\n",i);
break;
printf("This will not appear");
}
printf("\n Only this will appear");
}
