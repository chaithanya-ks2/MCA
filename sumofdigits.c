#include<stdio.h>
void main()
{
int sum=0,value,temp=0;
printf("Enter the value :");
scanf("%d",&value);

while(value>0)
{
temp=value%10;
sum+=temp;
value=value/10;
}

printf("Sum of digits : %d",sum);
}