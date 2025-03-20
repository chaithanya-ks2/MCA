import java.util.Scanner;
class Matrix {
    int r, c;
    Scanner sc = new Scanner(System.in);

    Matrix(int row, int column) {
        this.r = row;
        this.c = column;
        int[][] M = new int[r][c];

    }
void readValue() {
        int val;
        for (int i=0; i<r; i++) {
            for (int j=0; j<c; j++) {
                val = sc.nextInt();
            }
        }
    }
}

public class Menu{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Boolean flag = true;
        while(flag){
        System.out.print("1.Addition \n 2.Multiplications \n 3.Transpose \n 3.Break");
        int ch= sc.nextInt();
        switch (ch) {
            case 1:
                
                break;
        
            default:
                break;
        }
        }


    
        
    }
}
