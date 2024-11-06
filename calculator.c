#include<stdio.h>
void main()
{
int op,a,b,answer=0;
printf("Welcome to MY CALCULATOR\n\n");
printf("Enter the values to be calculated :");
scanf("%d %d",&a,&b);

printf("Select the operation from below list ::\n");
printf("1 for Addition\n");
printf("2 for Substraction\n");
printf("3 for Multiplication\n");
printf("4 for Division\n");
printf("5 for Modulas\n");
scanf("%d",&op);

switch(op)
{
case 1:answer=a+b;
       break;
case 2:answer=a-b;
       break;
case 3:answer=a*b;
       break;
case 4:answer=a/b;
       break;
case 5:answer=a%b;
       break;
default:printf("\nEnter a valid option ");
} 


printf("Answer is :%d",answer);
}