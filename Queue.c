#include<stdio.h>
#include<stdlib.h>


struct node {
    int data;
    struct node* next;
};
struct Queue{
    int max;
    struct node* head;
    struct node* current;
};

void traversal(struct node*);
void insertionBeginning(struct node*);
int main()
{
    struct node *newnode, *current, *head = NULL ;
    int n, i, data ,item;
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
    traversal(head);
    printf("\nEnter the element: ");
    scanf("%d", &item);
    newnode = (struct node*)malloc(sizeof(struct node));
    newnode->data = item;
    newnode->next = NULL;
    current->next = newnode;
    current = newnode;
    
    //insertion(current);
    traversal(head);
    printf("\n");
    head = head->next;
    traversal(head);




}

void traversal(struct node *head){
    struct node *curr;
    curr = head;
    while (curr != NULL){
        printf("%d\t", curr->data);
        curr = curr->next;
    }
}

void insertion(struct node *current){
    struct node *new;
    int item;
    printf("Enter the element: ");
    scanf("%d", &item);
    new = (struct node*)malloc(sizeof(struct node));
    new->data = item;
    new->next = NULL;
    current = new;
    
}