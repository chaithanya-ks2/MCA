class Animal {
    String colour = "Orange";
}
class Animal2 extends Animal {
   String colour = "Black";

   void colourDisplay() {
      System.out.println(colour);
   }

   public static void main(String args[]) {
      Animal2 ob = new Animal2();
   }
}
