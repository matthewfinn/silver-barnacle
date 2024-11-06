package basic;

public class Pangram {

    public static void main (String[] args){

        String s = "We promptly judged antique ivory buckles for the next prize";
        System.out.println(pangrams(s));

    }

    /*
     * Complete the 'pangrams' function below.
     *
     * The function is expected to return a STRING.
     * The function accepts STRING s as parameter.
     */

    public static String pangrams(String s) {
        s =  s.toLowerCase();
        int index = 0;
        boolean[] mark = new boolean[26];

        for(char character :  s.toCharArray()){
            System.out.printf("The value of character %s is %d%n", character, Character.getNumericValue(character));
            // characters have a numeric value from 10 - 35. i.e. a=10, z=35
            if ('a' <= character
                    && character <= 'z')

                index = character - 'a';

                // If this character is other than english
                // lowercase and uppercase characters.
            else
                continue;
            mark[index] = true;
        }

        for(boolean b: mark) if(b==false) return "not pangram";
        return "pangram";

    }
}
