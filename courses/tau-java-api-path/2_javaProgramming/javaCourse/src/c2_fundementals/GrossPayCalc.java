package c2_fundementals;

import java.util.Scanner;

public class GrossPayCalc {

    public static void main (String[] args){

        //1. Get the number of hours worked
        System.out.print("Enter the number of hours the employee worked: ");
        Scanner scanner = new Scanner(System.in);
        int hours = scanner.nextInt();

        //2. Get the hourly pay rate
        System.out.print("Enter the hourly pay rate: ");
        double payRate = scanner.nextDouble();
        scanner.close();
        //3. Multiply hours by pay rate
        double wages = hours * payRate;
        //4. Display result
        System.out.print("Gross wages due: €" + wages);


    }


}
