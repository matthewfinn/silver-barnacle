package examples;

import io.restassured.builder.RequestSpecBuilder;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import static io.restassured.RestAssured.given;

public class Chapter4Test {
    private static RequestSpecification requestSpec;
    private static ResponseSpecification responseSpec;

    @BeforeClass
    public static void createRequestSpecification() {
        /*
        There are many other types of request characteristics that you can set through the RequestSpecification builder,
        such as a base path, a standard content type for all of your requests. You can set default cookies for your requests.
        You can set default form and query parameters for your tests.
        You can add other types of headers. You also set default authentication schemes for all of your requests.
         */
        requestSpec = new RequestSpecBuilder().
            setBaseUri("http://api.zippopotam.us").
            build();
    }

    @BeforeClass
    public static void createResponseSpecification() {

        responseSpec = new ResponseSpecBuilder().
                expectStatusCode(200).
                expectContentType(ContentType.JSON).
                build();
    }

    @Test
    public void requestUsZipCode90210_checkPlaceNameInResponseBody_expectBeverlyHills_withRequestSpec() {

        given().
            spec(requestSpec).
        when().
            get("us/90210").
        then().
            spec(responseSpec).
        and().
            assertThat().
            statusCode(200);
    }

    @Test
    public void requestUsZipCode90210_extractPlaceNameFromResponseBody_assertEqualToBeverlyHills() {

        String placeName =
                given().
                        spec(requestSpec).
                        when().
                        get("http://zippopotam.us/us/90210").
                        then().
                        extract().
                        path("places[0].'place name'");

        Assert.assertEquals("Beverly Hills", placeName);
    }


}
