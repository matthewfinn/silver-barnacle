package junit5tests;

import org.junit.jupiter.api.*;

//@TestMethodOrder(MethodOrderer.MethodName.class) // Run tests in alphanumeric order based on method names
@TestMethodOrder(MethodOrderer.DisplayName.class) // Run tests in alphanumeric order based on DisplayName



@TestInstance(TestInstance.Lifecycle.PER_CLASS) // This annotation means you don't have to declare beforeAll and afterAll as static
public class OrderedTestClass1 {

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
    }

    @Test
    @DisplayName("PRNT-1422 - TC-1768 - Functionality Description Here")
    void secondMethod(){
        System.out.println("Second test method");
    }

    @Test
    @DisplayName("A test display name")
    void thirdTest() {
        System.out.println("Third test method");
    }
}
