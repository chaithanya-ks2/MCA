// Program to sort an array using Bubble Sort

import java.util.Scanner; // Import Scanner class for user input

class SortArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); // Create Scanner object

        // Input: Get the size of the array from the user
        System.out.print("Enter the size of the array: ");
        int size = sc.nextInt();
        int arr[] = new int[size]; // Declare an array of given size

        // Input: Get the array elements from the user
        System.out.println("Enter the elements: ");
        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt(); // Store user input in the array
        }

        // Display the original array before sorting
        System.out.println("The original array is: ");
        for (int i = 0; i < size; i++) {
            System.out.print(arr[i] + " ");
        }

        System.out.println("\nThe sorted array is: ");

        // Bubble Sort Algorithm
        for (int i = 0; i < size - 1; i++) { // Outer loop for passes
            for (int j = 0; j < size - 1 - i; j++) { // Inner loop for comparisons also reduces time complexity
                // Swap if the current element is greater than the next element
                if (arr[j] > arr[j + 1]) { 
                    int temp = arr[j]; // Temporary variable for swapping
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }

        // Display the sorted array after Bubble Sort
        for (int i = 0; i < size; i++) {
            System.out.print(arr[i] + " ");
        }

        sc.close(); // Close the Scanner object to prevent memory leaks
    }
}
