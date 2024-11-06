#include<stdio.h>
void main()
{
    int  a[100],b[100],c[100],i,m,n;
    printf("Enter the first array limit :");
    scanf("%d",&m);
    printf("Enter the first array elements :");
    for(i=0;i<m;i++)
    {
        scanf("%d",&a[i]);
    }
    printf("Enter the second array limit :");
    scanf("%d",&n);
    printf("Enter the second array elements :");
    for(i=0;i<n;i++)
    {
        scanf("%d",&b[i]);
    }
    
    for(i=0;i<=m;i++)
    {
        c[i]=a[i];

    }   
    for(i=0;i<=n;i++)
    {
        c[i+m]=b[i];
    }


    printf("Array after merging :");
    for(i=0;i<m+n;i++)
    {
        printf("%d",c[i]);
    }



}