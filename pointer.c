#include<stdio.h>
void modify(int *p);
void main()
{
    int a=123;

    modify(&a);
    printf("a=%d\n",a);
}
void modify(int *p)
{
    *p=567;
}