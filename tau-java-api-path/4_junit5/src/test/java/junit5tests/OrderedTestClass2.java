package junit5tests;

import org.junit.jupiter.api.*;


@TestMethodOrder(MethodOrderer.OrderAnnotation.class) // required to be able to define @Order(int) annotation on each test method
@TestInstance(TestInstance.Lifecycle.PER_CLASS)// This annotation means you don't have to declare beforeAll and afterAll as static
public class OrderedTestClass2 {

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
    @Order(2)
    void firstMethod() {
        System.out.println("First test method");
    }

    @Test
    @Order(3)
    @DisplayName("PRNT-1422 - TC-1768 - Functionality Description Here")
    void secondMethod(){
        System.out.println("Second test method");
    }

    @Test
    @Order(1)
    void thirdTest() {
        System.out.println("Third test method");
    }
}
