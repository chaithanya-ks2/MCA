import java.util.Scanner;

class Rectangle {
    public static void main(String args[]) {
        float l;
        float b;
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the length and width of the rectangle:");
        l = sc.nextFloat();
        b = sc.nextFloat();
        
        System.out.println("The area of the rectangle is: " + l * b);
    }
}
