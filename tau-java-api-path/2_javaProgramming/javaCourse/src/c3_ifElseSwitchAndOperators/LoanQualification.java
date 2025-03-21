package c3_ifElseSwitchAndOperators;

/*
 * NESTED IFS:
 * To qualify for a loan, a person must make at least $30,000
 * and have been working at their current job for at least 2 years.
 */

import java.util.Scanner;

public class LoanQualification {

    public static void main(String[] args){
        //Initialize what we know
        int requiredSalary = 30000;
        int requiredYearsEmployed = 2;

        //Get what we don't
        System.out.println("Enter your salary:");

        Scanner scanner = new Scanner(System.in);
        double salary = scanner.nextDouble();

        System.out.println("How many years have you been at your job:");
        double years = scanner.nextDouble();

        scanner.close();
        //Make decision
        if(salary >= requiredSalary){
            if(years >= requiredYearsEmployed)
                System.out.println("Granted");
            else
                System.out.println("Rejected - tenure too short");
        }
        else
            System.out.println("Rejected - salary too low");
    }
}
