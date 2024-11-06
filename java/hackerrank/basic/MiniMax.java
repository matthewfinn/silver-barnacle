package basic;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers.
 * Then print the respective minimum and maximum values as a single line of two space-separated long integers.
 *
 * CLI Instructions
 * Compile: javac ./MiniMax.java
 *
 * Run Option 1: java MiniMax
 *
 * Run Option 2: java MiniMax 256741038 623958417 467905213 714532089 713932779
 */
public class MiniMax {

    public static void miniMaxSum(List<Integer> arr) {
        // Write your code here
        long max = 0, min = 0;

        Collections.sort(arr);

        // list is in ascending order so iterate through first 4 and sum
        for(int i =0 ; i <4 ; i ++){
            min += arr.get(i);
        }

        // reverse sort the list
        arr.sort(Collections.reverseOrder());
        // list is in descending order so iterate through first 4 and sum
        for(int i =0 ; i <4 ; i ++){
            max += arr.get(i);
        }

        System.out.print(String.format("%d %d", min, max));
    }
    public static void main(String[] args) throws IOException {

        List<Integer> arr = new ArrayList<>();

        /**
         * Option 1 - declare an array here to be categorised.
         */
        //256741038 623958417 467905213 714532089
//        arr.add(256741038);
//        arr.add(623958417);
//        arr.add(467905213);
//        arr.add(714532089);
//        arr.add(938071625);

        /**
         * Option 2 - read in from the cli args
         */
        for (int i = 0; i < 5; i++) {
            int arrItem = Integer.parseInt(args[i]);
            arr.add(arrItem);
        }

        miniMaxSum(arr);

    }

}
