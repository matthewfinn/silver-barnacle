# Chapter 1 - Intro to REST Assured

Java Domain Specific Language (DSL) for writing tests for RESTful APIs.

Runs on top of JUnit or TestNG.

Abstracts away a lot of boilerplate code.

[https://rest-assured.io/](https://rest-assured.io/)

[rest-api-examples Postman Site](https://blog.postman.com/rest-api-examples/)

## Configuring REST Assured

### Maven

```
<dependency>
      <groupId>io.rest-assured</groupId>
      <artifactId>rest-assured</artifactId>
      <version>RELEASE</version>
</dependency>
```

### Gradle

```xml
testCompile 'io.rest-assured:rest-assured:3.3.0'
```

## API Under Test

[Zippopotam Website](http://zippopotam.us/)

Supplies location data related to a given country and zip code

API location - [Zippopotam API URL](http://api.zippopotam.us)

RESTful API

## An Example Request and Response

### Request

If we want to use this API in our REST Assured tests, we can send a GET call at to this locator which contains two path parameters, namely US as a country code and 90210 as the zip code for which we want to retrieve the location data.

```java
_GET http://api.zippopotam.us/us/90210
```

### Response

If you perform this request using REST Assured, the response will look something like this:

```
{
  post code: "90210",
  country: "United States",
  country abbreviation: "US",
  places: [
    {
      place name: "Beverly Hills",
      longitude: "-118.4065",
      state: "California",
      state abbreviation: "CA",
      latitude: "34.0901"
    }
  ]
}
```

# Chapter 2 - Basic Features & Capabilities

* Supports all HTTP methods (GET, POST, PUT, PATCH, DELETE).
* Supports Gherkin Syntax (Given/When/Then) - not forced but it's an option.
* Uses Hamcrest matchers for checks.
* Uses JsonPath/GPath and XmlPath for selecting elements from response.

JsonPath is a path expression language of JSON.

It's really similar to what XmlPath does for XML and what XPath does for HTML.

One thing that's also very important to know is that REST Assured uses the GPath notation of the JsonPath query language.

If you want to see some more examples about using JsonPath and the GPath notation, you can visit [http://groovy-lang.org](http://groovy-lang.org/processing-xml.html#_gpath).

## Hamcrest Matchers

Hamcrest Matchers allow you to express expectations or checks or verifications you want to perform in your automated tests in readable language.

Some examples,

* `equalTo(X)` - used to check whether an actual element value is equal to a pre-specified expected element value
* `hasItem("value")` - used to see whether a collection of elements contains a specific pre-specified item value
* `hasSize(3)` - used to verify the actual number of elements in a collection
* `not(equalTo(X))` - inverts any given matcher that exists in the Hamcrest library

If you want to know more about Hamcrest, and especially the Java implementation of Hamcrest, and all the matchers that are available within the library, you can visit the documentation at [http://hamcrest.org](http://hamcrest.org/JavaHamcrest/javadoc/2.1/).

# Chapter 3 - Parameterising your REST Assured test

* HTTP GET to retrieve existing data from the server.
* HTTP POST to create new data on the server.
* HTTP PUT or PATCH to update existing.
* HTTP DELETE to delete existing data from a server.

## Parameters in RESTful APIs

### Path Parameters

* api.zippopotam.us/us/90210 - `us` and `90210` are path parameters here
* api.zippopotam.us/ca/B2R - `ca` and `B2R` are path parameters here

### Query Parameters

* md5.jsontest.com/?text=apple - `key = text , value = apple`
* md5.jsontest.com/?text=banana - `key = text , value = banana`

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
# Chapter 5 - Working with XML Response

The way that REST Assured determines how to process the response that's being returned by any given API, is it looks for the value of the content-type header.
If that's JSON, REST Assured will automatically treat the response as being JSON.
If the content-type header value in the response is equal to XML, REST Assured will see the response body as being XML, and so on, for all the types of response body contents.

Here's an example response in JSON format from our API:
```json
{
  post code: "90210",
  country: "United States",
  country abbreviation: "US",
  places: [
    {
      place name: "Beverly Hills",
      longitude: "-118.4065",
      state: "California",
      state abbreviation: "CA",
      latitude: "34.0901"
    }
  ]
}
```


And the XML equivalent:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<response>
  <postcode>90210</postcode>
  <country>United States</country>
  <countryAbbreviation>US</countryAbbreviation>
  <places>
    <place longitude="-118.4065" latitude="34.0901">
      <placeName>Beverly Hills</placeName>
      <state>California</state>
      <stateAbbreviation>CA</stateAbbreviation>
    </place>
  </places>
</response>
```

# Chapter 6 - (De-) Serialization of Java Objects in REST Assured Tests

### Plain Old Java Objects (POJOs)

* Straightforward Java Classes
* Properties/Fields
* Methods to access and modify those properties
