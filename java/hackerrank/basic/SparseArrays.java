import java.util.ArrayList;
import java.util.List;

/**
 * There is a collection of input strings and a collection of query strings.
 * For each query string, determine how many times it occurs in the list of input strings. Return an array of the results.
 */
public class SparseArrays {

    /*
     * Complete the 'matchingStrings' function below.
     *
     * The function is expected to return an INTEGER_ARRAY.
     * The function accepts following parameters:
     *  1. STRING_ARRAY strings
     *  2. STRING_ARRAY queries
     */

    public static List<Integer> matchingStrings(List<String> strings, List<String> queries) {
        List<Integer> results = new ArrayList<>();

        for(String q : queries){
            int count = 0; // int to count the matches, resets on each iteration
            for(String s: strings){
                if(s.equals(q)) count++; // if the string matches the query string we increment the count.
            }
            results.add(count); // add the number of query strings found

        }
        System.out.print("results: " + results);

        return results;
    }

    public static void main(String[] args){

        List<String> queries = new ArrayList<>();
        queries.add("ab"); queries.add("abc");queries.add("bc");

        List<String> strings = new ArrayList<>();
        strings.add("ab"); strings.add("ab");strings.add("abc");


        matchingStrings(strings, queries);

    }
}
