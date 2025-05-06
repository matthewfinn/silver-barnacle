package junit5tests;

import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.params.provider.Arguments.arguments;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ParameterisedTestClass {

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @ValueSource(ints = {1, 3, 5}) // ValueSource can only pass 1 parameter
    void intTest(int params){
        //shortcut to print this is "soutp"
        System.out.println("int Parameter = " + params);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @NullSource //
    @EmptySource // only used for a String, does not work with primitives
    @NullAndEmptySource // combination of the 2 annotations above
    @ValueSource(strings = {"first", "second", "third"})
    void stringTest(String params){
        System.out.println("String Parameter = " + params);

    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"kurt,cobain", "josh,homme", "dave,gilmour"})
    void csvSource_StringString(String param1, String param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"kurt,27,false", "josh,55,true","dave,74,true"})
    void csvSource_StringIntBoolean(String param1, int param2, boolean param3){
        System.out.println("param1 = " + param1 + ", param2 = " + param2 + ", param3 = " + param3);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"nirvana,'kurt,cobain'", "queens of the stone age,'josh,homme'"})
    void csvSource_StringWithComma(String param1, String param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvSource(value = {"kurt cobain", "josh homme", "dave gilmour"}, delimiter = ' ')
    void csvSource_StringWithSpaceDelimiter(String param1, String param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvFileSource(files = "src/test/resources/params/productList.csv",
            useHeadersInDisplayName = true) // numLinesToSkip can also be used to skip some lines
    void csvFileSource_StringDoubleIntStringString(String name, double price, int qty, String unit, String supplier){
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", unit = " + unit + ", supplier = " + supplier);
    }

    @ParameterizedTest()
    @CsvFileSource(files = {"src/test/resources/params/productList.csv", "src/test/resources/params/productList2.csv"},
            useHeadersInDisplayName = true) // numLinesToSkip can also be used to skip some lines
    void csvFilesSource_StringDoubleIntStringString(String name, double price, int qty, String unit, String supplier){
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", unit = " + unit + ", supplier = " + supplier);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @CsvFileSource(files = "src/test/resources/params/productList3.csv",
            useHeadersInDisplayName = true, delimiterString = "___") // numLinesToSkip can also be used to skip some lines
    void csvFileSourceUnderscoresDelimiter_StringDoubleIntStringString(String name, double price, int qty, String unit, String supplier){
        System.out.println("name = " + name + ", price = " + price + ", qty = " + qty + ", unit = " + unit + ", supplier = " + supplier);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @MethodSource(value = "sourceString")
    void methodSource_String(String param1){
        System.out.println("param1 = " + param1);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @MethodSource(value = "sourceStringStream")
    void methodSource_StringStream(String param1){
        System.out.println("param1 = " + param1);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @MethodSource(value = "sourceListStringDouble")
    void methodSource_StringDoubleList(String param1, double param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    @ParameterizedTest(name = "Run: {index} - Value: {arguments}")
    @MethodSource(value = "junit5tests.ParamProvider#sourceStreamStringDouble")
    void methodSource_StringDoubleStream(String param1, double param2){
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }

    List<String> sourceString(){
        return Arrays.asList("Alpha", "Bravo", "Charlie", "Delta", "Echo");
    }

    Stream<String> sourceStringStream(){
        return Stream.of("Foxtrot", "Golf", "Hotel", "India", "Juliett");
    }

    List<Arguments> sourceListStringDouble(){
        return Arrays.asList(arguments("Alpha", 1.0),
                arguments("Bravo", 2.0), arguments("Charlie", 3.0));
    }

}
