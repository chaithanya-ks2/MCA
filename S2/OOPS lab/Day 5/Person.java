class Persons {
    int age;
    String name;
    
    Persons(String n, int a) {
        this.name = n;
       this.age = a;
    }

    void display() {
        System.out.println("Name: "+name);
        System.out.println("Age: "+age);
    }
}

public class person{
    public static void main(String[] args) {
        Persons P[] = new Persons[3];

        P[0] = new Persons("Gokul", 21);
        P[1] = new Persons("Chaithaya", 28);
        P[2] = new Persons("Nandana", 20);


        for (int i=0; i<3; i++) {
            P[i].display();

        }
    }
}

