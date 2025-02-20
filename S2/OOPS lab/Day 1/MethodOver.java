import java.util.Scanner;

class Rectangle {
    void area(float l, float b) {
        System.out.println("Area: "+l*b);
    }
}

class Square extends Rectangle {
    void area(float l) {
        System.out.println("Area: "+l*l);
    }
}

class MethodOver {
    public static void main(String args[]) {
        float l;
        float b;
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the length: ");
        l = sc.nextFloat();

        System.out.println("Enter the breadth: ");
        b = sc.nextFloat();

        Rectangle obj1 = new Rectangle();
        obj1.area(l, b);

        Square obj2 = new Square();
        obj2.area(l);
    }
}