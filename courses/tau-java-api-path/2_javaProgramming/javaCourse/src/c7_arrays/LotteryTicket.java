package c7_arrays;

import java.util.Arrays;
import java.util.Random;

/**
 SEQUENTIAL SEARCH
 The sequential search algorithm searches every element in the array until it finds the value that it's looking for.
 Or, until it arrives at the end of the array.
 This algorithm is okay for small arrays but it's inefficient for arrays with more than several thousand elements.

 BINARY SEARCH
 For the binary search the array must first be sorted - in ascending order??
 Split the array by checking element in the middle then we know which half to look at next, do this for each iteration until you
 find what you're looking for.
 You can code all of this by hand. But if you need to use this in real life, simply use this handy util method called Arrays.binarySearch().


 */
public class LotteryTicket {
    private static final int LENGTH = 6; // Caps for a constant
    private static final int MAX_TICKET_NUMBER = 47; // Caps for a constant

    public static void main(String[] args){

        int[] ticket = generateLotteryTicket();
        Arrays.sort(ticket);
        printTicket(ticket);
    }

    private static int[] generateLotteryTicket(){
        int[] ticket = new int[LENGTH];
        Random randomInt = new Random();
        for(int i = 0; i < ticket.length; i++){
            int randomNumber;
            /*
            Generate random number then search to make sure it doesn't
            already exist in the array. If it does, regenerate and search again.
             */
            do{
                randomNumber = randomInt.nextInt(MAX_TICKET_NUMBER) + 1;// bound is exclusive - this logic is for 1 - 47
            } while(search(ticket, randomNumber));
            //Number is unique if we get here. Add it to the array.
            ticket[i] =  randomNumber;
        }
        return ticket;
    }

    private static void printTicket(int[] ticket){
        for(int i : ticket){
            System.out.print(i + " | ");
        }
    }

    /**
     * Does a sequential search on the array to find a value
     * @param array existing array to search
     * @param numberToCheck value to check for
     * @return true if found, false if not
     */
    private static boolean search(int[] array, int numberToCheck){
        for(int value : array){
            if(value == numberToCheck) return true;
        }
        // array was search and numberToCheck was not found
        return false;
    }

    private static boolean binarySearch(int[] array, int numberToCheck){
        //Sort array in ascending order
        Arrays.sort(array);

        int result = Arrays.binarySearch(array, numberToCheck);

        // binarySearch return value will be >= 0 if and only if the key is found.
        return result >= 0;
    }

}
