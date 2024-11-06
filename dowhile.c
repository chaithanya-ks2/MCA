#include<stdio.h>
void main()
{
int i=1,sum=0,n;

printf("Enter the limit :");
scanf("%d",&n);

do
{sum+=i;
i++;

}while(i<=n);

printf("Sum of first %d natural numbers is %d",n,sum);
}