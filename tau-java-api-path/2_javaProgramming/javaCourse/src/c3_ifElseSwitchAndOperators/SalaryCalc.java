package c3_ifElseSwitchAndOperators;

import java.util.Scanner;

/*
    IF Statement
    All sales people get a payment of €1000 a week.
    Salespersons who exceed 10 sales get an additional payment of €250.
 */
public class SalaryCalc {
    public static void main(String[] args){

        // init known values
        int salary = 1000;
        int bonus = 250;
        int quota = 10;

        // get values for the unknown
        System.out.println("How many sales did the employee make this week? :");
        Scanner scanner = new Scanner(System.in);
        int sales = scanner.nextInt();
        scanner.close();

        // quick detour for bonus
        if(sales > quota){
            salary += bonus;
        }

        // output
        System.out.println("Salary for this week €" + salary);

    }
}
