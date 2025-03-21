package c4_whileDoWhileForNested;

import java.util.Scanner;

/*
 * FOR LOOP:
 * Write a cashier program that will scan a given number of items and tally the cost.
 */
public class CashierDemo {
    public static void main(String[] args){

        //Get number of items to scan
        System.out.print("Enter the number of items you would you like to scan:");
        Scanner scanner = new Scanner(System.in);

        int quantity = scanner.nextInt();

        double total = 0;

        for(int i = 0; i < quantity; i++){

            System.out.printf("Enter the price of item %d:%n", i+1);
            double price = scanner.nextDouble();
            total += price;
        }
        System.out.printf("Total price is €%.2f", total);

        scanner.close();
    }
}
