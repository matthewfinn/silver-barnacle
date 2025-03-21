package c4_whileDoWhileForNested;

import java.util.Random;

public class RollTheDieGame {

    public static void main(String[] args){
        int target = 20;
        int score = 0;
        int maxRolls = 5;
        Random random = new Random();

        for(int i = 1; i <= maxRolls; i ++){
            /* random.nextInt takes exclusive upper bound as input param. So random.nextInt(6)
               will generate random values in the range of 0 - 5. If we +1 we then get random values in the range 1 - 6 */
            int die = random.nextInt(6) + 1;
            System.out.printf("Roll #%d: You've rolled a %d. ", i, die);

            score+=die;

            if(score==target){
                System.out.println("Yay");
                break;
            }else if(score > target){
                System.out.println("Too far!!");
            }else if(i == maxRolls){
                System.out.println("You didn't make it but you got to " + score);
            }else{
                int left = target-score;
                System.out.println("You're now on " + score + " so you have " +left+" to go");
            }



        }

    }
}
