package c5_methodsAndScope;

import java.util.Scanner;

public class GreetingsDemo {

    public static void main(String[] args){

        System.out.print("Enter your name: ");
        Scanner sc = new Scanner(System.in);
        String name = sc.next();
        greetUser(name);
    }

    private static void greetUser(String name){
        System.out.printf("Hello %s", name);
    }
}
