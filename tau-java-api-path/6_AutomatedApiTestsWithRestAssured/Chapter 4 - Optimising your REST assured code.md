# Chapter 4 - Optimising your REST assured code

### Reusable Request Specifications

The first type of optimization that I want to dive into is the ability to reuse request specifications. So, for example, in the tests that we've seen so far, we've always hard-coded the entire API path into our tests themselves. This might lead to a lot of rework in case an API base URL changes or you want to run your tests against multiple environments.

The mechanism that REST Assured offers to enable us to create flexible and reusable requests specifications is called a `RequestSpecification`.

Here you see a very basic example of such a request specification where I create a `new RequestSpecBuilder` and I tell it `setBaseUri("http://api.zippopotam.us")` as the base URI so that I don't need to specify that in my tests again.

```java
import io.restassured.builder.RequestSpecBuilder;
import org.junit.BeforeClass;

public class Chapter4Test {

    private static RequestSpecification requestSpec;

    @BeforeClass
    public static void createRequestSpecification() {
  
        requestSpec = new RequestSpecBuilder().
            setBaseUri("http://api.zippopotam.us").
            build();
    }
}
```
