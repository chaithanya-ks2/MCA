public class SB {
    public static void main(String[] args) {
        StringBuffer st = new StringBuffer("ABC");
        System.out.println(st);

        StringBuffer st1 = new StringBuffer("XYZ");
        System.out.println(st+" "+st1);
        
        st.append(st1);
        System.out.println(st);

        String s = new String("STR");
        System.out.println(s);

        st1.append(s);
        System.out.println(st1);
        
        st.insert(2, 1);
        System.out.println(st);

        st.delete(0, 2);
        System.out.println(st);

    }
    
}
