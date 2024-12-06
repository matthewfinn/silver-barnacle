package basic;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

public class SubarrayDivision {

    public static void main (String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\Documents\\Repositories\\silver-barnacle\\java\\hackerrank\\basic\\SubarrayDivisionInputFile.txt"));

        int n = Integer.parseInt(bufferedReader.readLine().trim());

        List<Integer> s = Stream.of(bufferedReader.readLine().replaceAll("\\s+$", "").split(" "))
                .map(Integer::parseInt)
                .collect(toList());

        String[] firstMultipleInput = bufferedReader.readLine().replaceAll("\\s+$", "").split(" ");

        int d = Integer.parseInt(firstMultipleInput[0]);

        int m = Integer.parseInt(firstMultipleInput[1]);

        int result = birthday(s, d, m);
        System.out.print("Result : " + result);
        bufferedReader.close();
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
        //TODO figure this out... look up sliding window approach
        
        int count = 0;


        // iterate through all the squares
        for(int i = 0; i < squares.size(); i++){

            int sum = 0;
            int barsCount = 0;
            // j is set to i,
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
