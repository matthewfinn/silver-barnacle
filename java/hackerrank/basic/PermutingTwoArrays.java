package basic;

import java.util.Arrays;
import java.util.List;
import java.util.Collections;

public class PermutingTwoArrays {

    public static void main (String[] args){
        Integer[] aNumbers = {1,2,3,4,4,19,22,11,22,3,2,1};
        Integer[] bNumbers = {1,2,3,4,4,19,22,11,22,3,2,1};
        //Arrays.asList(numbers);

        System.out.print(twoArrays(10,Arrays.asList(aNumbers), Arrays.asList(bNumbers)));

    }

    /**
     * Complete the 'twoArrays' function below.
     *
     * The function is expected to return a STRING.
     * The function accepts following parameters:
     *  1. INTEGER k
     *  2. INTEGER_ARRAY A
     *  3. INTEGER_ARRAY B
     *
     *  Put more simply
     *  Given two arrays of unequal and an integer k.
     *  The task is to permute both arrays such that sum of their corresponding element is greater than or equal to k i.e a[i] + b[i] >= k.
     *  The task is to print “Yes” if any such permutation exists, otherwise print “No”.
     *
     *  Helpful article: '<a href="https://medium.com/@amritavidhate/permuting-two-arrays-b32f577f5df1">...</a>'
     *
     */

    public static String twoArrays(int k, List<Integer> A, List<Integer> B) {
        Collections.sort(A); // sort A in ascending order
        B.sort(Collections.reverseOrder()); // sort B in descending order

        int num = Math.min(A.size(), B.size()); // find the size of the smallest list, otherwise we'll run into indexOOB issues

        //iterate through
        for(int i = 0; i < num; i++){
            if(A.get(i) + B.get(i) < k)
                return "NO";
        }


        return "YES";

    }
}
