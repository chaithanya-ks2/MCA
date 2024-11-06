#include<stdio.h>
struct Complex
{
    int real;
    int img;
}a,b,c;

void main()
{
    
    printf("Enter the real and img part of a :");
    scanf("%d %d",&a.real,&a.img);
    printf("Enter the real and img part of b :");
    scanf("%d %d",&b.real,&b.img);

    c.real=a.real+b.real;
    c.img=a.img+b.real;

    printf("%d +%di",c.real,c.img);

}