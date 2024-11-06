package basic;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * Given an array of integers, where all elements but one occur twice, find the unique element.
 */

public class LonelyInteger {

    /*
     * Complete the 'lonelyinteger' function below.
     *
     * The function is expected to return an INTEGER.
     * The function accepts INTEGER_ARRAY a as parameter.
     */

    public static int lonelyInteger(List<Integer> a) {
        for(Integer number : a){
            int count = 0; // int to count the matches, resets on each iteration
            for(Integer numberToCompare: a){
                if(Objects.equals(number, numberToCompare)) count++; // if the int matches we increment the count.
            }
            // if the count of occurrences of a certain number is equal to 1
            // after checking it against all elements in the array we should return it as we've met our match
            if(count==1) {
                System.out.println("Our lonely number is " + number);
                return number;
            }
        }
        return -1;
    }

    public static void main(String[] args){
        Integer[] numbers = {1,2,3,4,4,19,22,11,22,3,2,1};

        lonelyInteger(Arrays.asList(numbers));

    }



}
