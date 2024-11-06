package basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CountingSort {
    public static void main (String[] args){
        List<Integer> arr = new ArrayList<>();

        //for (int i = 0; i < args.length; i++)arr.add(Integer.valueOf(args[i]));
        for(String num : args)arr.add(Integer.valueOf(num)); // valueOf() methods ignore leading and trailing whitespace in the input string.

        System.out.println("LIST: " + countingSort(arr));

    }
    public static List<Integer> countingSort(List<Integer> arr) {
        int size = 100;
        int defaultValue = 0;

        // Create an ArrayList of the specified size, filled with the default value
        ArrayList<Integer> occurrences = new ArrayList<>(Collections.nCopies(size, defaultValue)); // fills with 0s

        //System.out.println("ArrayList with default values: " + occurrences);

        for(Integer i : arr){
            occurrences.set(i, occurrences.get(i) + 1); // increment value at the specified index
        }

        return occurrences;
    }

}
