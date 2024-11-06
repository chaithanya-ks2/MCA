#include<stdio.h>
int largest(int x,int y,int z);
void main()
{
    int a,b,c,large;
    printf("Enter the numbers :");
    scanf("%d %d %d",&a,&b,&c);
    large=largest(a,b,c);
    printf("Largest is %d",large);

}

int largest(int x,int y,int z)
{
   int lar;
   lar=x>y?x>z?x:z:y>z?y:z; 
}