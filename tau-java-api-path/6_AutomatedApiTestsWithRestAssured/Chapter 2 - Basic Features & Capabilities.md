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
