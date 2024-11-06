#include<stdio.h>
int f1(int);
void main()
{
    int a=123;
    f1(a);
    printf("Main fn :%d",a);
}
int f1(int a)
{
   a=220;
   printf("%d\n",a);
   return a;
   
}