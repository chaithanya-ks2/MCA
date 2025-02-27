// Main class to demonstrate equality check
public class Equality {
    public static void main(String[] args) {
        // Create instances of the Test class
        Test o1 = new Test(10, 20);
        Test o2 = new Test(10, 20);
        Test o3 = new Test(1, 5);

        // Check if o1 is equal to o2
        System.out.println("o1==o2 " + o1.equals(o2));
        // Check if o1 is equal to o3
        System.out.println("o1==o3 " + o1.equals(o3));
    }
}

// Test class with two integer properties
class Test {
    int a, b;

    // Constructor to initialize the properties
    Test(int x, int y) {
        a = x;
        b = y;
    }

    // Method to check equality based on the properties
    public boolean equals(Test ob) {
        // Return true if both 'a' and 'b' are equal, otherwise return false
        if (ob.a == a & ob.b == b) {
            return true;
        } else {
            return false;
        }
    }
}
