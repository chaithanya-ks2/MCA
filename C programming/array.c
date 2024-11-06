#include<stdio.h>
void main()
{
    int arr[10]={0},n,i,ch,p,item,j,del,search=0,temp,small=0,sel;
    
    
    printf("Enter the array limit :");
    scanf("%d",&n);

    printf("Enter the array elements :");
    for(i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
        if(arr[i]<small)
        {
            small=arr[i];
        }
    }
     printf("The array elements are :");
    for(i=0;i<n;i++)
    {
        printf("%d\n",arr[i]);
    }
    
    
    do{
    printf("Operations \n");
    printf("_ _ _ _ _ _ _\n");
    printf("1.Insertion \n");
    printf("2.Deletion\n");
    printf("3.Search \n");
    printf("4.Sort \n");
    printf("5.Exit");


    printf("\nEnter your choice :");
    scanf("%d",&ch);

 
    switch(ch)
    {
        
        case 1:
        {
          printf("Enter the position where element has to be inserted :");
          scanf("%d",&p);

          printf("Enter the element to be inserted : ");
          scanf("%d",&item);

          for(i=n;i>=p-1;i--)
          {
            arr[i]=arr[i-1];
          }
          arr[p-1]=item;
          printf("The array after insertion :");
          for(i=0;i<=n;i++)
          {
            printf("%d\n",arr[i]);
          }
        }
        break;
        case 2:
        {
            printf("Enter the position where element as to be deleted within the size of %d :",n);
            scanf("%d",&del);
            for(i=del-1;i<n;i++)
            {
                arr[i]=arr[i+1];
            }  
             printf("The array after deletion :");
          for(i=0;i<n-1;i++)
          {
            printf("%d\n",arr[i]);
          }

        }
        break;
        case 3:
        {
            printf("Enter the element to be searched :");
            scanf("%d",&search);

            for(i=0;i<n;i++)
            {
                if(arr[i]==search)
                {
                    printf("\nElement is found at position %d",i+1);
                }
            }
        }
        break;
        case 4:
        {
            for(i=0;i<n;i++)
            {
                for(j=0;j<n;j++)
                {
                    if(arr[j]>arr[i])
                    {
                        temp=arr[i];
                        arr[i]=arr[j];
                        arr[j]=temp;
                    }
                }
            }
        printf("The array after sorting :");
          for(i=0;i<n;i++)
          {
            printf("%d\n",arr[i]);
          }


        }
        break;
    
        case 5:

        break;

        default:
        break;

        
    }
    printf("Do you want to continue 1/0");
    scanf("%d",&sel);
    }while(sel==1);

}
    






    




