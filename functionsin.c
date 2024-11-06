#include<stdio.h>
int add(int x,int y);
void main()
{
    int a,b,sum;
    printf("Enter the numbers :");
    scanf("%d %d",&a,&b);
    sum=add(a,b);
    printf("Answer is %d",sum);

}

int add(int x,int y)
{
    int answer;
    answer =x+y;
    return answer;
}