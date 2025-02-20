class ConstructorOver {
    int num1, num2, num3;
    ConstructorOver(int a, int b, int c) {
        num1 = a;
        num2 = b;
        num3 = c;
    }

    ConstructorOver(int a) {
        num1 = num2 = num3 = a;
    }

    ConstructorOver() {
        num1 = num2 = num3 = 0;
    }

    void result() {
        System.out.println("Result is "+num1*num2*num3);
    }

    public static void main(String[] args) {
        ConstructorOver obj1 = new ConstructorOver();
        ConstructorOver obj2 = new ConstructorOver(1);
        ConstructorOver obj3 = new ConstructorOver(1, 2, 3);

        obj1.result();
        obj2.result();
        obj3.result();
    }
}