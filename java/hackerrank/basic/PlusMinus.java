package basic;

import java.io.*;
import java.util.*;

/**
 * Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero.
 * Print the decimal value of each fraction on a new line with  places after the decimal.
 *
 * CLI Instructions
 * Compile: javac ./PlusMinus.java
 *
 * Run Option 1: java PlusMinus
 *
 * Run Option 2: java PlusMinus 0 1 2 3 -4 -5
 */
class PlusMinus {

    /*
     * Complete the 'plusMinus' function below.
     *
     * The function accepts INTEGER_ARRAY arr as parameter.
     */

    public static void plusMinus(List<Integer> arr) {

        List<Integer> minus = new ArrayList<>();
        List<Integer> zero = new ArrayList<>();
        List<Integer> plus = new ArrayList<>();

        for (Integer subject : arr) {

            if (subject > 0) {
                plus.add(subject);
            } else if (subject < 0) {
                minus.add(subject);
            } else {
                zero.add(subject);
            }

        }

        // print out what we know about this lists
        System.out.println("List of 'Minus' values: " + minus);
        System.out.println(String.format("There is/are %d 'Minus' values", minus.size()));
        System.out.println("List of 'Zero' values: " + zero);
        System.out.println(String.format("There is/are %d 'Zero' values", zero.size()));
        System.out.println("List of 'Plus' values: " + plus);
        System.out.println(String.format("There is/are %d 'Plus' values", plus.size()));

        float decimalPlus = (float) plus.size() / arr.size();
        float decimalMinus = (float) minus.size() / arr.size();
        float decimalZero = (float) zero.size() / arr.size();
        // cant to float to preserve decimal point on fractional values

        System.out.println(String.format("%.6f", decimalPlus));
        System.out.println(String.format("%.6f", decimalMinus));
        System.out.println(String.format("%.6f", decimalZero));



    }

    public static void main(String[] args) throws IOException {
        List<Integer> arr = new ArrayList<>(); // declare a new list

        System.out.println("Number of args: " + args.length);

        /**
         * Option 1 - declare an array here to be categorised.
         */
         //arr.add(1);arr.add(-11);arr.add(22);arr.add(0);

        /**
         * Option 2 - read in from the cli args
         */
        for(String arg: args){
            int arrItem = Integer.parseInt(arg); // parse each arg as an int
            arr.add(arrItem); //
        }

        // call the categorisation function
        plusMinus(arr);

    }
}

