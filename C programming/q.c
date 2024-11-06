#include<stdio.h>
#include<stdlib.h>

struct node {
    int data;
    struct node* next;
};

void traversal(struct node*);
int main()
{
    struct node *newnode, *current, *head = NULL;
    int n, i, data;
    printf("Enter the number of nodes: ");
    scanf("%d", &n);
    for (i=0; i<n; i++){
        printf("%d",i);
        printf("Enter the data: ");
        scanf("%d", &data);
        printf("%d",data);
        newnode = (struct node*)malloc(sizeof(struct node));
        newnode->data = data;
        printf("forrr");
        printf("%d" ,&newnode);
        newnode->next = NULL;
        if (head==NULL){
            head = newnode;
            current = newnode;
            printf("inside if");
        }
        else{
            printf("else part");
            current->next = newnode;
            current = newnode;
        }
        printf("Hello");
    }
    printf("Hi");
    traversal(head);

}

void traversal(struct node *head){
    printf("inside tra");
    struct node *curr;
    curr = head;
    while (curr->next != NULL){
        printf("%d", curr->data);
        curr = curr->next;
    }
}