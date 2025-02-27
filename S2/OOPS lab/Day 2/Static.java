
class Example {
    static void display() {
        System.out.println("Static method called without creating an object!");
    }

    public static void main(String[] args) {
        Example.display(); // Calling static method using class name
    }
}
    
   /* Output 
    Static method called without creating an object!
    
    In the above example, we have created a static method  display()  and called it without creating an object of the class. 
    You can also call a static method using an object of the class */
