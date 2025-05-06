package c5_methodsAndScope;

import java.util.Scanner;

/*
 * VARIABLE SCOPE
 * Write an 'instant credit check' program that approves
 * anyone who makes €25,000 or more and has a credit score
 * of 700 or better. Reject all others.
 */
public class InstantCreditChecker {
    private static int requiredSalary = 25000;
    private static int requiredCreditScore = 700;
    private static Scanner sc = new Scanner(System.in);


    public static void main(String[] args){

        // get what we don't know
        double salary = getSalary();
        int creditScore = getCreditScore();

        //check is user qualifies
        boolean qualified = isUserQualified(salary, creditScore);
        sc.close();
        //notify user
        notifyUser(qualified);
    }

    public static double getSalary(){
        double salary;
        System.out.print("Enter your salary: ");
        salary = sc.nextDouble();
        return salary;
    }

    public static int getCreditScore(){
        int creditScore;
        System.out.print("Enter your credit score: ");
        creditScore = sc.nextInt();
        return creditScore;
    }

    public static boolean isUserQualified(double salary, int creditScore){
        return (salary >= requiredSalary && creditScore >= requiredCreditScore);
    }

    public static void notifyUser(boolean isQualified){
        String message = isQualified ? "Congrats, you've been approved" : "Unfortunately you do not qualify";
        System.out.println(message);
    }

}
