package basic;

import java.io.BufferedReader;
import java.io.FileReader;

public class XORStrings {

    public static void main (String args[]) throws Exception{
        BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\Documents\\Repositories\\silver-barnacle\\java\\hackerrank\\basic\\XORStrings.txt"));

        String firstString = bufferedReader.readLine().trim();
        String secondString = bufferedReader.readLine().trim();

        System.out.println("Strings are " + firstString + " and " + secondString);

        System.out.println(stringsXOR(firstString, secondString));
    }

    public static String stringsXOR(String s, String t) {
        StringBuilder res = new StringBuilder();
        for(int i = 0; i < s.length(); i++) {
            if(s.charAt(i) == t.charAt(i))
                res.append("0");
            else
                res.append("1");
        }

        return res.toString();
    }
}
