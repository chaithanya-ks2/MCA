#include<stdio.h>
void main()
{
float pi=3.14, r , area,perimeter ;

printf("Enter the radius\n");
scanf("%f",&r);
area=pi*r*r;
perimeter= 2*pi*r;
printf("Area is %f\n",area);
printf("Perimeter is %f\n",perimeter);

}
