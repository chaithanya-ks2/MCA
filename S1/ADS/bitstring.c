#include<stdio.h>
#include<stdlib.h>

void bitsring(int []);

int main()
{
    int i, j, n, temp, exist;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    int universal[n];

    printf("Enter the elements in the universal set: ");
    for (i=0; i<n; i++){
        scanf("%d", &temp);
        exist = 0;
        for (j=0; j<=i; j++){
            if (universal[j] == temp){
                exist = 1;
                break;
            }
        if (!exist){
            universal[i] = temp;
        }
        }
    }
    printf("{");
    for (i=0; i<n; i++){
        printf("%d\t", universal[i]);
    }
    printf("\b}");
    
    // Sub
    int m1, m2, bit1[n], bit2[n];

    //sub1
    printf("\nEnter the number of elements in first sub array: ");
    scanf("%d", &m1);
    int sub1[m1];

    printf("\nEnter the elements of the first sub array: ");
    for (i=0; i<m1; i++){
        scanf("%d", &sub1[i]);
    }

    for (i=0; i<n; i++){
        exist = 0;
        for (j=0; j<m1; j++){
            if (universal[i] == sub1[j]){
                exist = 1;
                break;
            }
        }
        if (exist){
            bit1[i] = 1;
        }
        else{
            bit1[i] = 0;
        }
    }

    for (i=0; i<n; i++){
        printf("%d\t", bit1[i]);
    }


    //sub2
    printf("\nEnter the number of elements in second sub array: ");
    scanf("%d", &m2);
    int sub2[m2];

    printf("\nEnter the elements of the second sub array: ");
    for (i=0; i<m2; i++){
        scanf("%d", &sub2[i]);
    }

    for (i=0; i<n; i++){
        exist = 0;
        for (j=0; j<m2; j++){
            if (universal[i] == sub2[j]){
                exist = 1;
                break;
            }
        }
        if (exist){
            bit2[i] = 1;
        }
        else{
            bit2[i] = 0;
        }
    }

    for (i=0; i<n; i++){
        printf("%d\t", bit2[i]);
    }
    
    int setUnion[n];
	for (int i = 0; i < n; i++) {
		if (bit1[i] == 1 || bit2[i] == 1)
			setUnion[i] = 1;
		else
			setUnion[i] = 0;
	}

	int setIntersection[n];
	for (int i = 0; i < n; i++) {
		if (bit1[i] == 1 && bit2[i] == 1)
			setIntersection[i] = 1;
		else
			setIntersection[i] = 0;
	}

    printf("\nUnion set :\n");
    for(int i=0;i<n;i++)
    {
        printf("%d\t",setUnion[i]);
    }
    printf("\nIntersection set :\n");
    for(int i=0;i<n;i++)
    {
        printf("%d\t",setIntersection[i]);
    }
    

    return 0;
}
