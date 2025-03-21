package c4_whileDoWhileForNested;

import java.util.Scanner;

/*
 * WHILE LOOP:
 * Each store employee makes $15 an hour. Write a program that allows the employee
 * to enter the number of hours worked for the week. Do not allow overtime.
 */
public class GrossPayValidation {

    public static void main(String[] args){

        //Initialize known variables
        int rate = 15;
        int maxHours = 40;

        //Get input for unknown variables
        System.out.println("How many hours did you work this week?");
        Scanner scanner = new Scanner(System.in);
        double hoursWorked = scanner.nextDouble();


        while(hoursWorked > maxHours || hoursWorked < 1){
            System.out.println("Must be between 1 and 40. Try Again.");
            hoursWorked = scanner.nextDouble();
        }

        double wages = hoursWorked * rate;

        System.out.println("Wages €" + wages);

        scanner.close();

    }
}