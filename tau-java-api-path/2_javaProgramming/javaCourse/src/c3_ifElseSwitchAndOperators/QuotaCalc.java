package c3_ifElseSwitchAndOperators;

import java.util.Scanner;

/*
 * IF ELSE
 * All salespeople are expected to make at least 10 sales each week.
 * For those who do, they receive a congratulatory message.
 * For those who don't, they are informed of how many sales they were short.
 */
public class QuotaCalc {
    public static void main(String[] args){

        //Initialize values we know
        int quota = 10;

        //Get unknown values
        System.out.println("How many sales did the employee make this week? :");
        Scanner scanner = new Scanner(System.in);
        int sales = scanner.nextInt();
        scanner.close();

        //Make a decision on the path to take – Output
        if(sales >= quota)
            System.out.println("Congratulations");
        else{
            int difference = quota - sales;
            System.out.printf("You needed %d more sales to reach the quote", difference);
        }
    }
}
