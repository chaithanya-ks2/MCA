class Shape {
    void area(int radius) {
        System.out.println(3.14 * radius * radius);
    }

    void area(int length, int breadth) {
        System.out.println(length * breadth);
    }

    public static void main(String args[]) {
        Shape circle = new Shape();
        circle.area(5);
        circle.area(1, 2);
    }
}

