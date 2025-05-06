package c8_dataTypesAndStrings;

public class Strings {

    public static void main(String[] args){

        String abc = "abc";
        //is equivalent to
        char[] data = {'a', 'b', 'c'};
        String str = new String(data);

        // can get a character in a string from its index
        char a = str.charAt(0);

        //.contains checks if a string contains a sequence of characters
        boolean contains = str.contains("a");

    }
}
