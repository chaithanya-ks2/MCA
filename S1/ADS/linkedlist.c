#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *next;
};

struct node *head=NULL, *current, *temp, *newNode;

void insertAtBeg();
void insertAtEnd();
void insertAtPos();
void display();
void delete();

void main() {
    int choice, ch;
    while(1) {
        printf("\n----Linked List Operations----\n");
        printf("1. Insert \n2. Delete \n3. Display \n4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1:
                printf("\n1. Insert At Beginning \n2. Insert At End \n3. Insert At Any Position \n");
                printf("Enter your choice: ");
                scanf("%d", &ch);
                switch(ch) {
                    case 1:
                        insertAtBeg();
                        break;
                    case 2:
                        insertAtEnd();
                        break;
                    case 3:
                        insertAtPos();
                        break;
                    default:
                        printf("Invalid choice!\n");
                        break;
                }
                break;
            case 2:
                delete();
                break;
            case 3:
                display();
                break;
            case 4:
                exit(0);
                break;
            default:
                printf("Invalid choice");
                break;
        }
    }
    
}

void createNode() {
    int item;
    printf("Enter the data: ");
    scanf("%d", &item);

    newNode = (struct node*)malloc(sizeof(struct node));
    newNode->data = item;
    newNode->next = NULL;
}

void insertAtBeg() {
    createNode();
    if (head == NULL) {
        head = newNode;
    }
    else {
        newNode->next = head;
        head = newNode;
    }
}

void insertAtEnd() {
    createNode();

    if (head == NULL) {
        head = newNode;
    }
    else {
        current = head;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = newNode;
        current = newNode;
    }
}

void insertAtPos() {
    int pos, count = 1;
    printf("Enter the position: ");
    scanf("%d", &pos);

    if (pos <= 0) {
        printf("Invalid position!\n");
        return;
    }

    createNode();

    if (pos == 1) {
        // Insert at the beginning
        newNode->next = head;
        head = newNode;
        return;
    }

    temp = head;

    // Traverse to the position before where the new node should be inserted
    while (temp != NULL && count < pos - 1) {
        temp = temp->next;
        count++;
    }

    if (temp == NULL) {
        printf("Position out of range!\n");
        free(newNode); // Free the unused node
        return;
    }

    // Insert the new node
    newNode->next = temp->next;
    temp->next = newNode;
}


void display() {
    if (head == NULL) {
        printf("LinkedList is empty!!");
    }
    else {
        temp = head;
        while (temp != NULL) {
            printf("%d ", temp->data);
            temp = temp->next;
        }
    }
}

void delete() {
    if (head == NULL) {
        printf("List is empty!");
    }
    else{
        int pos, count=2;
        printf("Enter the position to be deleted: ");
        scanf("%d", &pos);

        current = head;
        if (pos == 1) {
            head = head->next;
            free(current);
        }
        else {
            for (int i=2; i<pos; i++) {
                if (current->next == NULL) {
                    break;
                }
                current = current->next;
            }
            if (current->next == NULL) {
                printf("Element not found!");
            }
            else {
                temp = current->next;
                current->next = current->next->next;
                free(temp);
            }
        }
    }
}
