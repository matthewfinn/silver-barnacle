package junit5tests;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;

public class AssumptionsTest {

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @ValueSource(ints = {1, 3, 5}) // ValueSource can only pass 1 parameter
    void intTest(int param){
        Assumptions.assumeTrue(param >= 3);
        System.out.println("int Parameter = " + param);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"kurt,cobain", "josh,homme", "dave,gilmour"})
    void csvSource_StringString(String param1, String param2){
        Assumptions.assumeFalse(param1.equals("kurt"),
                "The assumption failed for params " + param1 + "," + param2);
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }


    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"kurt,27,false", "josh,55,true","dave,74,true"})
    void csvSource_StringIntBoolean(String param1, int param2, boolean param3){
        Assumptions.assumingThat(param2 > 30, () -> System.out.printf("This code ran for params %s %d %b%n", param1, param2, param3));
        System.out.println("param1 = " + param1 + ", param2 = " + param2 + ", param3 = " + param3);
    }
}
