#include<stdio.h>
void main()
{
int i;
for(i=0;i<20;i++)
{

if(i%2==0)
continue;
printf("%d",i);
}

printf("\n Finally this will appear");
}
