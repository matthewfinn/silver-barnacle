package junit5tests;

import org.junit.jupiter.params.provider.Arguments;

import java.util.stream.Stream;

import static org.junit.jupiter.params.provider.Arguments.arguments;

public class ParamProvider {

    // must be declared as static if not within test class that uses it
    static Stream<Arguments> sourceStreamStringDouble(){
        return Stream.of(arguments("Delta", 4.0),
                arguments("Echo", 5.0), arguments("Foxtrot", 6.0));
    }
}
