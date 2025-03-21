package c3_ifElseSwitchAndOperators;

import java.util.Scanner;

/*
 * SWITCH
 * Have a user enter their letter grade, and using a switch statement,
 * print out a message letting them know how they did.
 */
public class GradeMsg {

    public static void main(String[] args){
        System.out.println("Enter your letter grade:");
        Scanner scanner = new Scanner(System.in);

        String grade = scanner.next();
        String message;
        scanner.close();

        switch (grade.toLowerCase()){
            case "a":
                message = "Excellent";
                break;
            case "b":
                message = "Great";
                break;
            case "c":
                message = "Good";
                break;
            case "d":
                message = "Needs work";
                break;
            case "f":
                message = "Boo hoo";
                break;
            default:
                message = "Not a valid entry";
                break;
        }
        System.out.println(message);


    }
}