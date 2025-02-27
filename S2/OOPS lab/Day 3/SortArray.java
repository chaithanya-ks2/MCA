import java.util.Scanner;

class SortArray {
    public static void main(String[] args) {
        int size;
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the size of the array: ");
        size = sc.nextInt();
        int arr[] = new int[size];

        System.out.println("Enter the elements: ");
        for (int i=0; i<size; i++) {
            arr[i]=sc.nextInt();
        }

        System.out.println("The Array is: ");
        for (int i=0; i<size; i++) {
            System.out.print(arr[i]+" ");
        }

        System.out.println();
        System.out.println("The sorted array is: ");
        for (int i=0; i<size; i++) {
            for (int j=0; j<size; j++) {
                if (arr[i] < arr[j]) {
                    int temp = arr[j];
                    arr[j] = arr[i];
                    arr[i] = temp;
                }
            }
        }
        for (int i=0; i<size; i++) {
            System.out.print(arr[i]+" ");
        }
    }
}