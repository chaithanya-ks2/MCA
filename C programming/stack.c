#include<stdio.h>
void main(){
    int stack[100],sel,top=-1,max,item,i,ch;
    printf("Enter stack limit :");
    scanf("%d",&max);
    do{
    printf("Operations \n");
    printf("_ _ _ _ _ _ _\n");
    printf("1.Push \n");
    printf("2.Pop\n");
    printf("3.Peak Element\n");
    printf("4.Count \n");
    printf("5.Display Stack \n");
    printf("6.Exit");

    printf("\n Enter your choice :");
    scanf("%d",&ch);

    switch(ch)
    {
        case 1:
        {
            
            if(top==max-1)
            {
                printf("Overflow");
            }
            else
            {
                printf("Enter the element to be inserted : ");
                scanf("%d",&item);
                top=top+1;
                stack[top]=item;

            }
        }
        break;
        case 2:
        {
            if(top==-1){
                printf("Underflow , No element to delete");
            }
            else{
                top=top-1;
            }
        }
        break;
        case 3:{
            if(top==-1){
                printf("No Elements in stack");
            }
            else{
                printf("Peak Element in array is %d",stack[top]);
            }
        }
        break;
        case 4:
        {
            if(top==-1)
            {
                printf("No Elements in stack");
            }
            else
            {
                printf("Number of elements in stack is %d",top+1);
            }
        }
        break;
        case 5:
        {
            if(top==-1)
            {
                printf("No Elements in stack");
            }
            else{
                printf("Stack: ");
                for(i=0;i<=top;i++)
                {
                    printf("%d",stack[i]);
                }
            }
            
        }
        break;
        case 6:
        break;
        default:
        break;
    }
    printf("\n Do you want to continue 1/0");
    scanf("%d",&sel);

    }while(sel==1);
}