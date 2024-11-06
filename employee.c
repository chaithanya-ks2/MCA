#include<stdio.h>
#include<string.h>
struct Employee
{
    char Name[20];
    int Employee_ID;
    long int Salary;

}E1,E2,E3;
void main()
{
    printf("Enter the 1st 2nd and 3rd Employee Names  :");
    scanf("%s %s %s",E1.Name,E2.Name,E3.Name);

    printf("Enter the 1st 2nd and 3rd Employee ID  :");
    scanf("%d %d %d",&E1.Employee_ID,&E2.Employee_ID,&E3.Employee_ID);

    printf("Enter the 1st 2nd and 3rd Employee Salary  :");
    scanf("%ld %ld %ld",&E1.Salary,&E2.Salary,&E3.Salary);

    printf("\nThe Details of 1st Employee is :");
    printf("\nName : %s\n Employee ID :%d\n Salary :%ld",E1.Name,E1.Employee_ID,E1.Salary);

    printf("\nThe Details of 2nd Employee is :");
    printf("\nName : %s\n Employee ID :%d\n Salary :%ld",E2.Name,E2.Employee_ID,E2.Salary);

    printf("\nThe Details of 3rd Employee is :");
    printf("\nName : %s\n Employee ID :%d\n Salary :%ld",E3.Name,E3.Employee_ID,E3.Salary);

    

    
}