package c4_whileDoWhileForNested;

import java.util.Scanner;

/*
 * LOOP BREAK
 * Search a String to determine if it contains the letter 'A'.
 */
public class StringSearch {
    public static void main(String[] args){
        //Get text
        System.out.println("Enter some text:");
        Scanner scanner = new Scanner(System.in);
        String text = scanner.next();
        scanner.close();

        boolean letterFound = false;
        //Search for the letter A
        for(int i = 0; i < text.length(); i++){
            char currentLetter = text.charAt(i);
            if(currentLetter == 'A' || currentLetter == 'a') {
                letterFound = true;
                break;
            }
        }

        System.out.println("Letter 'A' found: " + letterFound);
    }

}
