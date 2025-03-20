class Products {
    int productCode;
    String productName;
    int price;

    Products(int code, String name, int p) {
        this.productCode = code;
        this.productName = name;
        this.price = p;
    }
}

public class Product {
    public static void main(String[] args) {
        Products obj1 = new Products(1001, "Phone", 10000);
        Products obj2 = new Products(1002, "Tablet", 15000);
        Products obj3 = new Products(1003, "Chair", 18000);

        if(obj1.price < obj2.price && obj1.price < obj3.price) {
            System.out.println("Cheapest Product is " + obj1.productName);
        }
        else if(obj2.price < obj1.price && obj2.price < obj3.price) {
            System.out.println("Cheapest Product is " + obj2.productName);
        }
        else {
            System.out.println("Cheapest Product is " + obj3.productName);
        }
    }
}


