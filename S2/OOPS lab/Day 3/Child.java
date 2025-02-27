class Parent {
    Parent(){
        System.out.println("This is parent class");
    }
}

class Child extends Parent {
    public static void main(String[] args) {
        System.out.println("This is child class");
        Child ob = new Child();
    }
}