package junit5tests;

import org.junit.jupiter.api.*;

// This annotation means you don't have to declare beforeAll and afterAll as static
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class FirstTestClass {

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
    void firstMethod() {
        System.out.println("First test method");
        //AssertEquals(1,1);
    }

    @Test
    @DisplayName("PRNT-1422 - TC-1768 - Functionality Description Here")
    void secondMethod(){
        System.out.println("Second test method");
    }


}
