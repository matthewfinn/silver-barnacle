package basic;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DiagonalDifference {

    public static void main (String[] args){
        List<List<Integer>> arr = new ArrayList<>();
        List<Integer> row1 = Arrays.asList(11, 2, 4);
        List<Integer> row2 = Arrays.asList(4, 5, 6);
        List<Integer> row3 = Arrays.asList(10, 8, -12);

        arr.add(row1); arr.add(row2); arr.add(row3);

        int result = diagonalDifference(arr);
        System.out.println(result);
    }
    public static int diagonalDifference(List<List<Integer>> arr) {
        int arrSize = arr.size();
        int diag1 = 0;
        int diag2 = 0;

        for (int i = 0; i < arrSize; i++) {
            int v1 = arr.get(i).get(i); // gets [0][0], [1][1], [2][2] where array is of size [3][3]
            int v2 = arr.get(arrSize - 1 - i).get(i); // gets [2][0], [1][1], [0][2] where array is of size [3][3]

            diag1 += v1;
            diag2 += v2;
        }

        return Math.abs(diag1 - diag2); // Returns the absolute value i.e. it's distance from zero on a number line
    }
}
