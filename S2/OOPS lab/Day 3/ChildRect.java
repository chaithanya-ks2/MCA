class Rect {
    int l, b;

    Rect(int x, int y) {
        l = x;
        b = y;
    }

    void area() {
        System.out.println("Area: "+l*b);
    }
}

class ChildRect extends Rect {
    int h;
    ChildRect(int x, int y, int z) {
        super(x, y);
        h = z;
        System.out.println("Height: "+h);
    }

    void volume() {
        System.out.println("Volume: "+l*b*h);
    }

    public static void main(String[] args) {
        ChildRect ob = new ChildRect(1, 2, 3);
        ob.area();
        ob.volume();
    }

}


