import java.util.Scanner;

class Matrix {
    int r, c;
    int[][] M;
    Scanner sc = new Scanner(System.in);

    void readValue() {
        System.out.println("Enter the number of rows: ");
        r = sc.nextInt();
        System.out.println("Enter the number of columns: ");
        c = sc.nextInt();
        M = new int[r][c];
        System.out.println("Enter matrix values:");

        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                M[i][j] = sc.nextInt();
            }
        }
    }

    void display() {
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                System.out.print(M[i][j] + " ");
            }
            System.out.println();
        }
    }

    void transpose() {
        int[][] transposed = new int[c][r];
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                transposed[j][i] = M[i][j];
            }
        }
        System.out.println("Transposed Matrix:");
        for (int i = 0; i < c; i++) {
            for (int j = 0; j < r; j++) {
                System.out.print(transposed[i][j] + " ");
            }
            System.out.println();
        }
    }

    void addition(Matrix M2) {

        int[][] M3 = new int[r][c];

        if(r!=M2.r || c!=M2.c) {
            System.out.println("invalid matrix");
            return;
            
        }
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                M3[i][j] = M[i][j] + M2.M[i][j];
            }
        }

        System.out.println("Added Matrix:");
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                System.out.print(M3[i][j] + " ");
            }
            System.out.println();
        }
    }

    void mul(Matrix M2){

        if(c!=M2.r) {
            System.out.println("invalid Matrix");
            return;
        }

        int[][] M4 = new int[r][M2.c];
        for (int i = 0; i < r; i++) {        
            for (int k = 0; k < M2.c; k++) { 
                int temp = 0;
                for (int j = 0; j < c; j++) { 
                    temp += M[i][j] * M2.M[j][k]; 
                }
                M4[i][k] = temp;
            }
        }

        System.out.println("Product of the Matrices:");
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < M2.c; j++) {
                System.out.print(M4[i][j] + " ");
            }
            System.out.println();
        }
    }
}

public class Menu {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        boolean flag = true;

        // Create a Matrix object and read values for the first matrix
        Matrix obj = new Matrix();
        obj.readValue();

        while (flag) {
            System.out.print("1. Addition \n2. Multiplication \n3. Transpose \n4. Exit\n");
            int ch = sc.nextInt();

            switch (ch) {
                case 1:
                    // Ask for second matrix for addition
                    Matrix obj2 = new Matrix();
                    obj2.readValue();
                    obj.addition(obj2); // Perform addition
                    break;
                case 2:
                    Matrix obj3 = new Matrix();
                    obj3.readValue();
                    obj.mul(obj3);
                    // Add functionality for matrix multiplication
                    break;

                case 3:
                    obj.transpose(); // Perform transpose
                    break;

                case 4:
                    flag = false;  // Exit the loop
                    System.out.println("Exiting program.");
                    break;

                default:
                    System.out.println("Invalid option. Please try again.");
            }
        }
    }
}
