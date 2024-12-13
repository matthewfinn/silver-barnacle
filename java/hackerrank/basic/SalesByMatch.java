package basic;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class SalesByMatch {

    public static void main(String [] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\Documents\\Repositories\\silver-barnacle\\java\\hackerrank\\basic\\SalesByMatchInputFile.txt"));

        int numSocks = Integer.parseInt(bufferedReader.readLine().trim());
        String[] socks = bufferedReader.readLine().split(" ");
        List<Integer> listOfSocks = new ArrayList<>();

        for(String colour : socks){
            listOfSocks.add(Integer.parseInt(colour));
        }

        System.out.println("Number of socks: " + numSocks + " and types = " + Arrays.toString(socks));

        System.out.println(matchSocks(numSocks, listOfSocks));

    }

    public static int matchSocks(int n, List<Integer> socks){
        int pairs = 0;
        Map<Integer, Integer> colorsCount = new HashMap<>();
        for(Integer num : socks){
            if(colorsCount.get(num) == null){
                colorsCount.put(num, 1);
            }else{
                colorsCount.put(num, colorsCount.get(num) + 1);
            }
        }
        for(Map.Entry<Integer, Integer> entry : colorsCount.entrySet()){
            pairs += entry.getValue()/2;
        }
        return pairs;
    }
}
