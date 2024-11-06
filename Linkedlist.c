#include<stdio.h>
#include<stdlib.h>

struct node {
    int data;
    struct node* next;
};

void traversal(struct node*);
int main()
{
    struct node *newnode, *current,*temp, *head = NULL ;
    int n, i, data ,item ,pos , val , count=1;
    while(1){
        printf("\n1) Create \n2) Insertion at beginning\n3) Insertion at any position\n4) Insersion at end\n5) Display\n6) Deletion from end\n");
        int choice;
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch(choice){
            case 1:
                printf("Enter the number of nodes: ");
                scanf("%d", &n);
                for (i=0; i<n; i++){
                    printf("Enter the data: ");
                    scanf("%d", &data);
                    newnode = (struct node*)malloc(sizeof(struct node));
                    newnode->data = data;
                    newnode->next = NULL;
                    if (head==NULL){
                        head = newnode;
                        current = newnode;
                    }
                    else{
                        current->next = newnode;
                        current = newnode;
                    }
                }
                break;
            case 2:
                newnode = (struct node*)malloc(sizeof(struct node));
                printf("\nEnter the element to be added at the beginning of the list : ");
                scanf("%d",&item);
                newnode->data = item;
                newnode->next = head;
                head = newnode;
                break;
            case 3:
                temp = head;
                printf("Enter the position: ");
                scanf("%d", &pos);
                printf("Enter the value: ");
                scanf("%d", &val);
                while(count < pos-1){
                    printf("%d inside while" ,count);
                    temp=temp->next;
                    count++;
                    printf("%d",count);
                }
                newnode = (struct node*)malloc(sizeof(struct node));
                newnode->data = val;
                newnode->next = temp ->next;
                temp->next = newnode;
                break;
            case 4:
                temp = head;
                newnode = (struct node*)malloc(sizeof(struct node));
                printf("\nEnter the element to be inserted at the end of the list : ");
                scanf("%d",&item);
                while(temp->next!=NULL){
                    temp = temp->next;
                }
                newnode->data = item;
                newnode->next = NULL;
                temp->next = newnode;
                break;
            case 5:
                traversal(head);
                break;
            case 6:
                temp = head;
                while(temp->next!=NULL){
                    temp = temp->next;
                }
                temp->next =NULL;
                break;
            default:
                printf("Wrong choice");
                return 0;
        }
    }

}

void traversal(struct node *head){
    struct node *curr;
    curr = head;
    while (curr != NULL){
        printf("%d\t", curr->data);
        curr = curr->next;
    }
}