# If you perform this request using REST Assured, the response will look something like this:Chapter 1 - Intro to REST Assured

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
