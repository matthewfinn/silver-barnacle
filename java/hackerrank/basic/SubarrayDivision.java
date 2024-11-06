package basic;

import java.util.List;

public class SubarrayDivision {

    public static void main (String[] args){
        int day = 4;
        int month = 2;

        Integer[] aNumbers = {1,2,3,4,4,19,22,11,22,3,2,1};

        int res = birthday(List.of(aNumbers), day, month);
        System.out.println("Result: " + res);

    }

    /*
     * Complete the 'birthday' function below.
     *
     * The function is expected to return an INTEGER.
     * The function accepts following parameters:
     *  1. INTEGER_ARRAY s
     *  2. INTEGER d
     *  3. INTEGER m
     */

    public static int birthday(List<Integer> squares, int day, int month) {
        //TODO figure this out
        int count = 0;

        for(int i = 0; i < squares.size(); i++){

            int sum = 0;
            int barsCount = 0;
            for(int j = i; j < j + month ; j++){
                if(j >= squares.size() || sum >= day){
                    break;
                }
                barsCount++;
                sum += squares.get(j);
            }
            if(sum == day && barsCount == month){
                count++;
            }
        }
        return count;
    }
}
