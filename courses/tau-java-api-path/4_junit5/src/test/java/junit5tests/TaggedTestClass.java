package junit5tests;

import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

// This annotation means you don't have to declare beforeAll and afterAll as static
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class TaggedTestClass {

    @BeforeAll
    void beforeAll(){
        // example would be initialising the browser
        System.out.println("--Before All--");
    }

    @BeforeEach
    void beforeEach(){
        System.out.println("----Before Each----");
    }

    @AfterAll
    void afterAll(){
        System.out.println("--After All--");
    }

    @AfterEach
    void afterEach(){
        System.out.println("----After Each----");
    }

    //accessModifier, returnType, nameOfMethod(params)
    //not required - does not allow private, must be void,
    @Test
    @Tag("sanity")
    void firstMethod() {
        System.out.println("First test method");
        //AssertEquals(1,1);
    }

    @Test
    @Tag("sanity")
    @Tag("acceptance")
    @DisplayName("PRNT-1422 - TC-1768 - Functionality Description Here")
    void secondMethod(){
        System.out.println("Second test method");
    }

    @Test
    @Tag("acceptance")
    void thirdMethod() {
        System.out.println("This is the third test method");
    }


    @Tag("acceptance")
    @ParameterizedTest(name = "Run: {index}  -  value: {arguments}")
    @ValueSource(ints = {1, 5, 6})
    void intValues(int theParam) {
        System.out.println("theParam = " + theParam);
    }

}
