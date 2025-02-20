import java.util.Scanner;

class Area {
    public static void main(String args[]) {
        float radius;
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the radius of the circle:");
        radius = sc.nextFloat();
        
        double area = 3.14 * radius * radius;
        System.out.println("The area of the circle is: " + area);
    }
}