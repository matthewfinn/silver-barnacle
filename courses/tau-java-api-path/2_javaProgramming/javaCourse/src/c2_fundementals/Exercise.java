package c2_fundementals;

import java.util.Scanner;

public class Exercise {

    public static void main (String[] args){

        System.out.print("Enter a season: ");
        Scanner scanner = new Scanner(System.in);
        String season = scanner.next();

        System.out.print("Enter a number: ");
        int numCups = scanner.nextInt();

        System.out.print("Enter an adjective: ");
        String adjective = scanner.next();

        scanner.close();

        System.out.printf("On a %s %s day, I drink a minimum of %d cups of coffee", adjective, season, numCups);


    }


}
