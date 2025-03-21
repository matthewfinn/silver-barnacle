package c3_ifElseSwitchAndOperators;


import java.util.Scanner;

/*
You'll ask them how many 1c would you like?
How many 5c  would you like?
How many 10c?
And then, how many 20c?
 */
public class ChangeForADollarGame {

    public static void main(String[] args){
        double oneCent = 0.01;
        double fiveCent = 0.05;
        double tenCent = 0.1;
        double twentyCent = 0.2;
        int euro = 1;

        int cents, fiveCents, tenCents, twentyCents;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter number of 1c:");
        cents = scanner.nextInt();
        System.out.println("Enter number of 5c:");
        fiveCents = scanner.nextInt();
        System.out.println("Enter number of 10c:");
        tenCents = scanner.nextInt();
        System.out.println("Enter number of 20c:");
        twentyCents = scanner.nextInt();

        double value = (cents * oneCent) + (fiveCents * fiveCent) + (tenCents * tenCent) + (twentyCents * twentyCent);

        if(value < euro){
            double amountShort = euro - value;
            System.out.println("Sorry, you lose! You were short " + String.format("%.2f", amountShort) + " cents.");

        } else if (value > euro) {
            double amountOver = value - euro;
            System.out.println("Sorry, you lose! You were over " + String.format("%.2f", amountOver) + " cents.");

        }else {
            System.out.println("Yay! That's exactly €1.00! You win!");
        }
    }
}
