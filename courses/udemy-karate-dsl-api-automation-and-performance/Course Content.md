<title>Karate DSL: API Automation and Performance from Zero to Hero</title>

[Course URL](https://www.udemy.com/course/karate-dsl-api-automation-and-performance-from-zero-to-hero/)
[Karate Site](https://www.karatelabs.io/)
[Karate GitHub](https://github.com/karatelabs/karate)

# Section 1: Introduction

## Karate Pros & Cons

| Pros                                                        | Cons                                                       |
| ----------------------------------------------------------- | ---------------------------------------------------------- |
| Easy to start with little coding knowledge (Gherkin syntax) | Own Karate scripting languages (Gherkin style)             |
| Native JSON support                                         | No intellisense support in IDE (may be plugin support now) |
| VERY powerful JSON validation                               | Difficult to find mistakes in code                         |
| Java & JavaScript support                                   |                                                            |
| Multi-thread parallel execution                             |                                                            |
| Detailed reporting & logs                                   |                                                            |
| Performance testing with Gatling                            |                                                            |

**Detailed comparison with RESTAssured**
[karate-vs-rest-assured.pdf](resources/karate-vs-rest-assured.pdf)

# Section 2: Basics

## What is JSON

**JSON** - JavaScript Object Notation

* Main type of payload for REST APIs
* **Types**
  1. **JSON Object: `{}`**
     * Key Value Pairs separated by `,`
     * Keys & values separated by `:`
     * Each key must be unique
       
       ```json
       {
         "key1": "value1",
         "key2": "value2"
       }
       ```
  2. **JSON Array: `[]`**
     * Has indexes
     * Values/Objects separated by `,`
       
       ```json
        [
            "value1",
            "value2"
        ]
       ```

### JSON Structure & Data Types

#### JSON Object: `{}`

1. **Simple Object**
   
   ```json
        { "key": "value" }
   ```

2. **Nested Object**
   
   ```json
        {
           "key": {
                "nestedKey": "nestedValue"
              }
        }
   ```

3. **Nested Array**
   
   ```json
       {
          "key": [
                "value1", "value2"
             ]
       }
   ```

#### JSON Array: `[]`

1. **Simple Array**
   
   ```json
      ["value1", "value2"]
   ```
2. **Array of Objects**
   
   ```json
     [
        {"key": "value1"},
        {"key": "value2"}
     ]
   ```

#### Data Types

1. **String**
   
   ```json
       {
         "name": "John",
         "age": "25"
       }
   ```
2. **Number**
   
   ```json
       {
         "weight": 93,
         "age": 25
       }
   ```
3. **Boolean**
   
   ```json
       {
         "isMarried": false
         "hasChildren": true
       }
   ```
4. **Null**
   
   ```json
       {
         "spouseName": null
       }
   ```
   
   ### Manipulating data in JSON
   
   **Original JSON data**

`def myObject`

```json
{
  "firstName": "John",
  "surname": "Doe",
  "age": 25,
  "cars": [
    "BMW",
    "Volvo"
  ],
  "income": {
    "q1": "€12000",
    "q2": "€15000"
  },
  "pets": [
    {
      "name": "Charlie",
      "type": "Dog"
    },
    {
      "name": "Jimmy",
      "type": "Rabbit"
    }
  ]
}
```

**Action: Get surname**

```javascript
def lastName = myObject.lastName
```

**Action: Get 2nd car**

```javascript
def secondCar = myObject.cars[1]
```

**Action: Get Q2 income**

```javascript
def income25 = myObject.income.q2
```

**Action: Get the type of the first pet**

```javascript
def firstPetType = myObject.pets[0].type
```

**Action: Update the age**

```javascript
set myObject.age = 26
```

**Action: Update dogs name to be rabbits name**

```javascript
set myObject.pets[0].name = myObject.pets[1].name
```

**Action: Add Q3 income**
As this record doesn't already exist Karate will create it inside the object

```javascript
set myObject.income.q3 = "€13750"
```

**Action: Add a new car**
A new value will be appended to the array

```javascript
set myObject.cars[] = "Toyota"
```

**Action: Replace a car**
Replaces an existing value in the array

```javascript
set myObject.cars[0] = "Audi"
```

**Action: Delete Q2 income**
Replaces an existing value in the array

```javascript
remove myObject.income.q2
```

> **Note:** 
> Keyword `remove` only works in Karate script
> In JavaScript you'll need to use keyword `delete`

**Action: Delete Toyota car record**

```javascript
remove myObject.cars[2]
```

> **Note:**
> Keyword `remove` only works in Karate script
> In JavaScript you'll need to use keyword `delete`

**Resulting Object after all the changes**

```json
{
   "firstName": "John",
   "surname": "Doe",
   "age": 26,
   "cars": [
      "Audi",
      "Volvo",
      "Toyota"
   ],
   "income": {
      "q1": "€12000",
      "q3": "€13750"
   },
   "pets": [
      {
         "name": "Jimmy",
         "type": "Dog"
      },
      {
         "name": "Jimmy",
         "type": "Rabbit"
      }
   ]
}
```

### Summary

- JSON consist of objects{} and arrays[]
- Possible structures are:
  - simple objects and simple arrays
  - nested object and nested array
  - array of objects
- Data types: String, Number, Boolean, null
- Native JSON support to manipulate data

### Resources

[Working with JSON](resources/Working%2Bwith%2BJSON.pdf)

## What is an API

**API (Application Programming Interface)**

- An API is a set of rules and tools that allows different software applications to **communicate** with each other.
- It defines **how** one program can request services or data from another using **standardized requests and responses**.

**Purpose**

- Enables systems to interact without needing to understand each other’s internal workings.

**Common Use**

- Connecting a website or mobile app to a database or third-party service.

**Examples**

- A weather app uses an API to fetch weather data from a weather service.
- A payment app like Revolut or PayPal uses APIs to connect to banks.

**REST API**

- Stands for *Representational State Transfer API*.
- A type of API that enables communication between systems over the internet.
- Works by sending **requests** and receiving **responses**, typically in **JSON** format, between a **client** and a **server**.

**Example**
![api-request-example.png](resources/api-request-example.png)

### Types of API requests

* **GET** – Retrieve specific data from an API
* **POST** – Send data to an API to **create** a new resource
* **PUT** – Send data to an API to **replace** an existing resource entirely
* **PATCH** – Send data to an API to **update** part of an existing resource i.e. certain fields
* **DELETE** – Send a request to an API to **delete** a resource

### Typical API request

* **API URL** - Https link to API. Usually called API End-point
* **Headers** - Usually it’s Content-Type or Authorization token
* **Method** - GET, POST, PUT, DELETE
* **Body** - JSON object with requested data

### HTTP Response Status Codes

* **2xx** (200, 201, 204, ...) - Success!
* **3xx** (300, 301, 302, ...) - Redirection (Client should probably follow the redirection)
* **4xx** (400, 401, 404, ...) - Client Error (Something was wrong with the request)
* **5xx** (500, 501, 502, ...) - Server Error (API accepted your request but was unable to process it)

### REST API Tips

![rest-api-tips.png](resources/rest-api-tips.png)

### Client Server Example

![client-server-example-1.png](resources/client-server-example-1.png)

![client-server-example-2.png](resources/client-server-example-2.png)

![client-server-example-3.png](resources/client-server-example-3.png)

![client-server-example-4.png](resources/client-server-example-4.png)

![client-server-example-5.png](resources/client-server-example-5.png)

### Why do we need to test APIs?

To verify that the API follows the defined contract & the logic of the API (server) is matching the expected result.

#### Contract

Contract is a kind of agreement between front end and back end or client and server on what kind of valid request server can get and what kind of valid response for this request server should provide.
**Example**

```
Valid request:
  username: String
  password: String
```

```
Valid response:
  firstName: String
  lastName: String
  age: Number
  accessToken: String
```

#### Breaking the Contract examples

**Null value**
![break-contract-1.png](resources/break-contract-1.png)

**Wrong data type**
![break-contract-2.png](resources/break-contract-2.png)

**Missing key value pair**
![break-contract-3.png](resources/break-contract-3.png)

### Summary

- API – Application Programming Interface (black box)
- Method types: Get, Post, Put, Patch, Delete
- Typical request has: URL, Headers, Request type, Body
- Status codes: 2xx (Success), 3xx (Redirect), 4xx (Client error),
  5xx (Server error)
- The purpose of API automation is to verify that API follows the defined contract and the logic of the API (server) is matching the expected result
- API automated tests are **MUCH** faster than UI automation

### Resources

[What is API](resources/What%2Bis%2BAPI.pdf)

# Section 3: Setup

## Environment Setup

* Java 8 or higher [Java Downloads](https://www.oracle.com/java/technologies/downloads/)
  `java --version`
  `echo $JAVA_HOME`
* Maven [install-maven-on-windows-linux-mac](https://www.baeldung.com/install-maven-on-windows-linux-mac) or Gradle [gradle.org/install/](https://gradle.org/install/)
  `gradle -v` or `mvn -v`
* Git
  `git --version`
* Yarn (package manager) - [Yarn Installation Guide](https://yarnpkg.com/getting-started/install)
  `yarn -version`
* Postman
* VSCode
  * Cucumber (Gherkin) Full Support
    ![](resources/cucumber-gherkin-extension.png)
  * Karate Runner
    ![](resources/karate-runner.png)
  * Java Extension Pack
    ![](resources/java-extension-pack.png)

**Might need to disable Test Runner for Java!!!!!!!!!!!**

## Test Project Overview

[Test Application URL](https://conduit.bondaracademy.com/)
[Test API URL](https://conduit-api.bondaracademy.com)

## Karate Framework Setup

[Karate GitHub Documention](https://github.com/karatelabs/karate)

Ran the following script in there to set up the project with some sample test files.
The docs have a multi-line command but I edited it to be what's below for use with git bash

```groovy
mvn archetype:generate -DarchetypeGroupId=io.karatelabs -DarchetypeArtifactId=karate-archetype -DarchetypeVersion=1.5.1 -DgroupId=com.mf -DartifactId=karate-test-project-maven -DinteractiveMode=false
```

You can then run the tests with 

```bash
mvn test
```

## Karate Framework Overview

### `pom.xml`

This is where you define dependencies, plugins, properties and build details

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.mf</groupId>
    <artifactId>karate-test-project-maven</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <java.version>21</java.version>
        <maven.compiler.version>3.11.0</maven.compiler.version>
        <maven.surefire.version>3.0.0</maven.surefire.version>
        <karate.version>1.4.1</karate.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-junit5</artifactId>
            <version>${karate.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-core</artifactId>
            <version>${karate.version}</version>
        </dependency>

    </dependencies>

    <build>
        <testResources>
            <testResource>
                <directory>src/test/java</directory>
                <excludes>
                    <exclude>**/*.java</exclude>
                </excludes>
            </testResource>
        </testResources>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven.compiler.version}</version>
                <configuration>
                    <encoding>UTF-8</encoding>
                    <source>${java.version}</source>
                    <target>${java.version}</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>${maven.surefire.version}</version>
                <configuration>
                    <environmentVariables>
                        <KARATE_KEEP_REPORTS>3</KARATE_KEEP_REPORTS>
                    </environmentVariables>
                    <argLine>-Dfile.encoding=UTF-8</argLine>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

### ``target`` folder

Temporary generated data.
This is where test reports are logged & stored.
![](resources/target-folder.png)

### ``src\test\java`` folder

Contains tests and important karate configuration files

**`logback-test.xml`**
Configures logging.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>

    <appender name="FILE" class="ch.qos.logback.core.FileAppender">
        <file>target/karate.log</file>
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>    

    <logger name="com.intuit" level="DEBUG"/>

    <root level="info">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="FILE" />
    </root>

</configuration>
```

**karate-config.js**
Main file where execution starts.

* Configure environment variables.
* Useful to execute code before tests.

```javascript
function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
```

#### `ExamplesTest.java`

This is the Karate JUnit5 runner class.

```java
package examples;

import com.intuit.karate.junit5.Karate;

class ExamplesTest {

    // this will run all *.feature files that exist in subdirectories
    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }
}
```

# Section 4: API Automation

## First GET Request

### Some VS Code Improvements

For some better file icons
![](resources/materical-icon-theme.png)

Useful for HTML reports
![](resources/open-in-default-browser.png)

[Test Application URL](https://conduit.bondaracademy.com/)
[Test API URL](https://conduit-api.bondaracademy.com)

### `HomePage.feature` GET requests

```gherkin
# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)

Feature: Tests for the home page

    Scenario: Get all tags
        Given url 'https://conduit-api.bondaracademy.com'
        And path 'api/tags'
        # Karate automatically creates headers
        When method Get
        Then status 200 

    Scenario: Get 10 articles from the page
        Given params { limit:10, offset: 0 }
        Given url 'https://conduit-api.bondaracademy.com'
        Given path 'api/articles'
        When method Get
        Then status 200
```

## Url & Path

* `path` is extension of `url`
* Once you make a call to a `path` the variable set expires
* `url` definition is valid throughout the execution of the scenario

```gherkin
# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)

Feature: Tests for the home page

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com'

    Scenario: Get all tags
        Given path 'api/tags' 
        # Karate automatically creates headers so no need to explicitly create then unless testing specific values
        When method Get
        Then status 200 

    Scenario: Get 10 articles from the page
        Given params { limit: 10, offset: 0 }
        And path 'api/articles'
        When method Get
        Then status 200
```

## Simple Assertions

### Status codes

```gherkin
...
Then status 200
...
```

```gherkin
...
Then status 403
...
```

### Assertions with `match`

[Payload Assertions - Documentation](https://github.com/karatelabs/karate?tab=readme-ov-file#payload-assertions)

**Purpose**: Compare actual data with expected data using Karate’s built-in powerful matching syntax.
**Scope**: Designed specifically for JSON, XML, and complex data structures.
**Output**: Provides detailed diff output when validation fails.
**Type-safe**: Automatically handles data types like numbers, strings, booleans, arrays, and objects.
Use ``match`` when:

* Validating API responses (JSON/XML).
* Comparing nested objects or arrays.
* Needing clear error reports.

```gherkin
# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)
Feature: Tests for the home page API

  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com'

  Scenario: Get all tags
    Given path 'api/tags'
    When method Get
    Then status 200
    # check that the array contains 1 particular value - this is case sensitive
    And match response.tags contains 'YouTube'
    # check that the array contains several values - this is case sensitive
    And match response.tags contains ['YouTube', 'GitHub', 'Zoom']
    # Uncomment line below to force a failure
    # And match response.tags contains ['youtube', 'github', 'zoom']
    # check that the value is not present in the array
    And match response.tags !contains 'reddit'
    # check that the response.tags data type is type array
    And match response.tags == '#array'
    # check that the response.tags data type is not type string
    And match response.tags != '#string'
    # check that the response.tags data type is not type number
    And match response.tags != '#number'
    # check that the response.tags data type is not null
    And match response.tags != '#null'
    # check that each value in response.tags array is of type String
    And match each response.tags == '#string'

  Scenario: Get 10 articles from the page
    Given params { limit: 10, offset: 0 }
    # alternative way to provide params
    # Given param limit = 10 
    # And param offset = 0
    And path 'api/articles'
    When method Get
    Then status 200
    # check that the response.articles is an array of size 10
    And match response.articles == '#[10]'
    # check that the response.articlesCount attribute value is a number
    And match response.articlesCount == '#number'
    # check that the response.articlesCount attribute value is 10
    And match response.articlesCount == 10
    # check that the response.articles[0].author.bio value is null
    And match response.articles[0].author.bio == '#null'
```

## First POST Request

First we need to create an account on the test [website](https://conduit.bondaracademy.com/) 
![](resources/create-account.png)

> username: karate.matt
> email: matt.finn@hotmail.com
> password: nice try - it's stored in my password manager ;)

**Login via Postman**
![](resources/login.png)

**Created a script to store this as a collection env variable**

```javascript
const response = pm.response.json();
pm.collectionVariables.set("authToken", "Token " + response.user.token)

console.log(response.user.token);
console.log("authToken = " + pm.collectionVariables.get("authToken"));
```

**Creating an article and using the auth token**
![alt text](resources/auth-token.png)

Request body

```json
{
    "article": {
        "title": "Karate Testing Postman",
        "description": "Learning karate",
        "body": "This is a sample article so I can test the API.\n\nLearning karate is interesting but not as physical as I expected.",
        "tagList": [
            "testing qa"
        ]
    }
}
```

**`Articles.feature`**

```gherkin
# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)
Feature: Articles

    Background: Define URL & Get Auth Token
        Given url 'https://conduit-api.bondaracademy.com/api'
        And path 'users/login'
        And request {"user": {"email": "matt.finn@hotmail.com","password": "********"}}
        When method post 
        Then status 200
        * def token = 'Token ' + response.user.token

    Scenario: Create a new article
        Given header Authorization = token
        And path 'articles'
        And request {"article": {"title": "Karate Testing Script","description": "Learning karate","body": "This is a sample article so I can test the API.\n\nLearning karate is interesting but not as physical as I expected.","tagList": ["testing qa"]}}
        When method POST
        Then status 201
        And match response.article.title == 'Karate Testing Script'
        * def slug = response.article.slug

        # request the article by slug
        Given header Authorization = token
        And path 'articles', slug
        When method get
        Then status 200
```

## Runner Configuration & Tags

### Running via VSCode

We can modify the karate runner extension config to be able to click *Karate:Run* on scenarios
![](resources/karate-runner-config.png)

Scenarios & features can be run using this clickable element
![](resources/karate-run.png)

In order to get this to work I had to update dependenceis in the ``pom.xml`` file

```xml
  <karate.version>1.4.1</karate.version>
      <dependencies>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-junit5</artifactId>
            <version>${karate.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-core</artifactId>
            <version>${karate.version}</version>
        </dependency>

    </dependencies>
```

### Using Tags

Added the following method to **`ConduitTest.java`**

```java
 @Karate.Test
    Karate testTags(){
        Karate testRun = Karate.run().tags("@debug").relativeTo(getClass());
        // by default it keeps last 3 reports & latest one is published to "karate-reports"
        keepLastNReports(getKeepCount()); 
        return testRun;

    }
```

You can then add the `@debug` annotation to a feature

```gherkin
  @debug
  Scenario: Get all tags
    Given path 'tags'
    When method Get
    ....
```

It can be run using the maven command

```bash
mvn test -Dtest=ConduitTest#testTags
```

### Karate Options

#### Running Specific Tags

Add a tag like `@debug` to a feature

```gherkin
  @debug
  Scenario: Get all tags
    Given path 'tags'
    When method Get
    ....
```

It can be run using the maven command

```bash
mvn test -Dkarate.options="--tags @debug"
```

You can also run multiple tags with something like

```bash
mvn test -Dkarate.options="--tags @debug,@smoke"
```

#### Ignore

You can also specify tests to ignore by adding the ``@ignore`` tag

```gherkin
  @ignore
  Scenario: Get all tags
    Given path 'tags'
    When method Get
    ....
```

When you run the below any tests with the ``@ignore`` tag won't be run

```bash
mvn test 
```

#### Skipping

Skipping tests can be achieved
Add a tag like `@skipme` to a scenario

```gherkin
  @skipme
  Scenario: Get all tags
    Given path 'tags'
    When method Get
    ....
```

When you run tests with the command below the annotated scenario will be skipped

```bash
mvn test -Dkarate.options="--tags ~@skipme"
```

#### Running a line of code

```bash
mvn test -Dkarate.options="classpath:conduitApp/feature/HomePage.feature:10"
```

![](resources/line-number.png)

## DELETE Request

**`Articles.feature`**

```gherkin
# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)
Feature: Articles

    Background: Define URL & Get Auth Token
        Given url 'https://conduit-api.bondaracademy.com/api'
        And path 'users/login'
        And request {"user": {"email": "matt.finn@hotmail.com","password": "D$kpw!px8O^ZgPsq"}}
        When method post 
        Then status 200
        * def token = 'Token ' + response.user.token

    Scenario: Create a new article
        Given header Authorization = token
        And path 'articles'
        And request {"article": {"title": "Karate Testing Script","description": "Learning karate","body": "This is a sample article so I can test the API.\n\nLearning karate is interesting but not as physical as I expected.","tagList": ["testing qa"]}}
        When method POST
        Then status 201
        And match response.article.title == 'Karate Testing Script'
        * def slug = response.article.slug

        Given header Authorization = token
        And params { limit: 10, offset: 0 }
        And path 'articles'
        When method get 
        Then status 200
        And match response.articles[0].title == 'Karate Testing Script'

        # request the article by slug
        Given header Authorization = token
        And path 'articles', slug
        When method get
        Then status 200

        # Delete the article
        Given header Authorization = token
        And path `articles`, slug
        When method delete 
        Then status 204

        # Confirm deletion
        Given header Authorization = token
        And path 'articles', slug
        When method get
        Then status 404
```

## Calling Other Features

### Setting up token retrieval in ``Background`` step

``Background`` acts like a `beforeEach` so is executed for every scenario

1. Create new folder **``src\test\java\utils``**
   ![](resources/utils.png)

2. Create a new feature file to get the auth token
   **`src\test\java\utils\CreateToken.feature`**
   
   ```gherkin
   Feature: Create Token
   
      Scenario: Create Token
          Given url 'https://conduit-api.bondaracademy.com/api'
          And path 'users/login'
          And request {"user": {"email": "matt.finn@hotmail.com","password": "*********"}}
          When method post 
          Then status 200
          * def authToken = 'Token ' + response.user.token
   ```

3. Use the generated token in the background step of a feature file
   **`src\test\java\conduitApp\feature\Articles.feature`**
   
    *Note:* classpath resolves to `src\test\java`
   
   ```gherkin
   Feature: Articles
   
       Background: Define URL & Get Auth Token
           Given url 'https://conduit-api.bondaracademy.com/api'
           * def tokenResponse = call read('classpath:utils/CreateToken.feature')
           * def token = tokenResponse.authToken
   ```
   
   ### Setting up token retrieval in ``Background`` step to execute once
   
   for this we just need to change `call` to `callonce`.
   This means it'll be called for the first scenario and used cached values thereafter.

            **`src\test\java\conduitApp\feature\Articles.feature`**    

```   gherkin
    Feature: Articles

        Background: Define URL & Get Auth Token
            Given url 'https://conduit-api.bondaracademy.com/api'
            * def tokenResponse = callonce read('classpath:utils/CreateToken.feature')
            * def token = tokenResponse.authToken
```

### Parameterised Features

**`src\test\java\conduitApp\feature\Articles.feature`**

Pass in values for `email` & `password`

```gherkin
Feature: Articles

    Background: Define URL & Get Auth Token
        Given url 'https://conduit-api.bondaracademy.com/api'
        * def tokenResponse = callonce read('classpath:utils/CreateToken.feature') {email: "matt.finn@hotmail.com", password: "********"}
        * def token = tokenResponse.authToken
        * print 'Generated tokenResponse:', tokenResponse
        * print 'Generated Token:', token
```

Then use these parameters in the token setup file
**`src\test\java\utils\CreateToken.feature`**

```gherkin
Feature: Create Token

    Scenario: Create Token
        Given url 'https://conduit-api.bondaracademy.com/api'
        And path 'users/login'
        And request {"user": {"email": "#(email)","password": "#(password)"}}
        When method post 
        Then status 200
        * def authToken = 'Token ' + response.user.token
```

## Environment Variables

Variables that are global for the framework

These can be set up in `karate-config.js`

```javascript
function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL: 'https://conduit-api.bondaracademy.com/api'
  }
  if (env == 'dev') {
    config.userEmail =  "matt.finn@hotmail.com"
    config.userPassword = "D$kpw!px8O^ZgPsq"
  } else if (env == 'qa') {
    config.userEmail =  "test@example.com"
    config.userPassword = "blabla"
  }

  // configure global Authorization header for all tests
  var accessToken = karate.callSingle('classpath:utils/CreateToken.feature', config).authToken;
  karate.configure('headers', {Authorization: accessToken})
  
  return config;
}
```

Example use of these variables in `createToken.feature`

```gherkin
Feature: Create Token

    Scenario: Create Token
        Given url apiURL
        And path 'users/login'
        And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
        When method post 
        Then status 200
        * def authToken = 'Token ' + response.user.token

```

We can specify the environment we run the tests against in the following way

`mvn test -Dkarate.env="dev"` or `mvn test -Dkarate.env="qa"`

Because we've assigned global headers for all tests we no longer need to specify them in each scenario so in that case `Articles.feature` now looks like:

```gherkin
Feature: Articles

    Background: Define URL & Get Auth Token
        Given url apiURL
     
    Scenario: Create a new article
        Given path 'articles'
        And request {"article": {"title": "Karate Testing Script","description": "Learning karate","body": "This is a sample article so I can test the API.\n\nLearning karate is interesting but not as physical as I expected.","tagList": ["testing qa"]}}
        When method POST
        Then status 201
        And match response.article.title == 'Karate Testing Script'
        * def slug = response.article.slug
        
        # new article should be first in the list
        Given params { limit: 10, offset: 0 }
        And path 'articles'
        When method get 
        Then status 200
        And match response.articles[0].title == 'Karate Testing Script'
        
        # request the article by slug
        Given path 'articles', slug
        When method get
        Then status 200

        # Delete the article
        Given path `articles`, slug
        When method delete 
        Then status 204

        # Confirm deletion
        Given path 'articles', slug
        When method get
        Then status 404
```

## Embedded & Multi-Line Expressions

The application under test to show this feature is the sign up page located [here](https://conduit.bondaracademy.com/register)

![](resources\sign-up-page.png)

**url**

`https://conduit-api.bondaracademy.com/api/users`

**payload**

```json
{
    "user": {
        "email": "karate!@test.com",
        "password": "karate1234",
        "username": "KarateTestUser!"
    }
}
```

**response**

```json
{
    "user": {
        "id": 34779,
        "email": "karate!@test.com",
        "username": "KarateTestUser!",
        "bio": null,
        "image": "https://conduit-api.bondaracademy.com/images/smiley-cyrus.jpeg",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozNDc3OX0sImlhdCI6MTc1ODMwNTY3NSwiZXhwIjoxNzYzNDg5Njc1fQ.OXJrLYs742_tsuVXwRk-2Xh1sgbcaNPesCBs4qrBNA4"
    }
}
```

**`SignUp.feature`**
``` gherkin
@debug
Feature: Sign Up New User

    Background: Preconditions
        Given url apiURL

    Scenario: New User Sign Up
        # email and username need to be unique so need to be changed for each execution
        Given def userData = {"email":"karate-script4@test.com", "username": "KarateTestScript4"}
        Given path 'users'
        # can also manipulate values like  #('TEST' + userData.email)
        And request 
        """
            {
                "user": {
                    "email": #(userData.email), 
                    "username":#(userData.username), 
                    "password":"karate1234"
                }
            }
        """
        When method post
        Then status 201
        And match response.user.username == userData.username
        And match response.user.email == userData.email
        * print response
```

## Assertions
[Assertions Documentation](https://github.com/karatelabs/karate?tab=readme-ov-file#payload-assertions)
![](resources/assert-docs.png)

``` gherkin

# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)
#@debug
Feature: Tests for the home page API

  Background: Define URL
    Given url apiURL

  @smoke
  Scenario: Get all tags
    # The list of tags returned for an authorized request is different to a non-authorized request so uncomment the line below to toggle
    # The 'match response.tags contains only' assertion is based on the list returned for my user so the test will fail without auth
    # * configure headers = {Authorization:null}
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains 'YouTube'
    And match response.tags contains ['YouTube', 'GitHub', 'Zoom']
    And match response.tags !contains 'reddit'
    And match response.tags !contains ['reddit', 'google', 'microsoft']
    And match response.tags contains any ['reddit', 'google', 'GitHub']
    # the below array is subject to change so this step can be flakey as I'm not in control of the test env
    And match response.tags contains only
    """
      ["Test",
        "Git",
        "Zoom",
        "Blog",
        "Bondar Academy",
        "YouTube",
        "Enroll",
        "Exam",
        "Community",
        "GitHub"]
    """
    And match response.tags == '#array'
    And match response.tags != '#string'
    And match response.tags != '#number'
    And match response.tags != '#null'
    And match each response.tags == '#string'

  @debug
  Scenario: Get 10 articles from the page
    Given params { limit: 10, offset: 0 }
    # alternative way to provide params
    # Given param limit = 10 
    # And param offset = 0
    And path 'articles'
    When method GET
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == '#number'
    And match response.articlesCount == 10
    And match response.articlesCount != 50
    And match response.articles[0].author.bio == '#null'
    And match response == {"articles": '#array',"articlesCount": '#number'}
    And match response == {"articles": '#array',"articlesCount": 10}
    And match response.articles[0].createdAt contains '2024'
    And match response.articles[*].favoritesCount contains 77
    # check that some articles have a favoritesCount greater than 1
    And match response.articles[*].favoritesCount contains '#? _ > 1'
    # check that some articles have a favoritesCount greater than 1000000 - this will fail
    # And match response.articles[*].favoritesCount contains '#? _ > 1000000'
    # check that at least one author.bio is null
    And match response.articles[*].author.bio contains null
    # use wildcard to find all 'bio' keys within the object
    And match response..bio contains null
    # iterate through all values
    And match each response..following == false

```
## Fuzzy Matching
[Fuzzy Matching Documentation](https://github.com/karatelabs/karate?tab=readme-ov-file#fuzzy-matching)
Fuzzy matching in Karate is when you assert the structure and data types of the response rather than exact values.
Instead of checking for a specific value, you verify that the value matches an expected type or pattern, such as a string, number, or boolean.

The supported markers are the following:

|    Marker     |                                               Description                                               |
| :-----------: | :-----------------------------------------------------------------------------------------------------: |
|   `#ignore`   |             Skip comparison for this field even if the data element or JSON key is present              |
|    `#null`    |            Expects actual value to be null, and the data element or JSON key must be present            |
|  `#notnull`   |                                   Expects actual value to be not-null                                   |
|  `#present`   | Actual value can be any type or even null, but the key must be present (only for JSON / XML, see below) |
| `#notpresent` |                Expects the key to be not present at all (only for JSON / XML, see below)                |
|   `#array`    |                                 Expects actual value to be a JSON array                                 |
|   `#object`   |                                Expects actual value to be a JSON object                                 |
|  `#boolean`   |                           Expects actual value to be a boolean true or false                            |
|   `#number`   |                                   Expects actual value to be a number                                   |
|   `#string`   |                                   Expects actual value to be a string                                   |
|    `#uuid`    |                       Expects actual (string) value to conform to the UUID format                       |
| `#regex STR`  |        Expects actual (string) value to match the regular-expression 'STR' (see examples above)         |
|   `#? EXPR`   |   Expects the JavaScript expression 'EXPR' to evaluate to true, see self-validation expressions below   |
| `#[NUM] EXPR` |                            Advanced array validation, see schema validation                             |
|   `#(EXPR)`   |                   For completeness, embedded expressions belong in this list as well                    |

**Example**
``` gherkin
    And match response.tags == '#array'
    And match response.tags != '#string'
    And match response.tags != '#number'
    And match response.tags != '#null'
    And match each response.tags == '#string'
    ...
    And match response == {"articles": '#array',"articlesCount": '#number'}
    ...
    And match each response..following == false
    And match each response..following == '#boolean'
    And match each response..favoritesCount == '#number'
    # '##string' means the field can be a string, null, or completely absent from the response
    And match each response..bio == '##string'

```

## Schema Validation
[Schema Validation Documentation](https://github.com/karatelabs/karate?tab=readme-ov-file#schema-validation)

``` gherkin
@debug
  Scenario: Get 10 articles from the page
    * def timeValidator = read('classpath:utils/timeValidator.js')

    Given params { limit: 10, offset: 0 }
    And path 'articles'
    When method GET
    Then status 200
    And match response == {"articles": '#[10]',"articlesCount": '#number'}
    And match each response.articles ==
    """
      {
              "slug": "#string",
              "title": "#string",
              "description": "#string",
              "body": "#string",
              "tagList": '#array',
              "createdAt": "#? timeValidator(_)",
              "updatedAt": "#? timeValidator(_)",
              "favorited": '#boolean',
              "favoritesCount": '#number',
              "author": {
                  "username": "#string",
                  "bio": '##string',
                  "image": "#string",
                  "following": '#boolean'
              }
        }
      """

```

**`src\test\java\utils\timeValidator.js`**
``` javascript
function fn(s) {
    var SimpleDateFormat = Java.type("java.text.SimpleDateFormat");
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.ms'Z'");
    try {
      sdf.parse(s).time;
      return true;
    } catch(e) {
      karate.log('*** invalid date string:', s);
      return false;
    }
  } 
```

## Test-Data Generator

1. Setup Maven dependency
``` xml
<dependency>
    <groupId>com.github.javafaker</groupId>
    <artifactId>javafaker</artifactId>
    <version>1.0.2</version>
</dependency>
```

1. Create data generator java class i.e. `src\test\java\utils\DataGenerator.java`
  ``` java
  package utils;
  import com.github.javafaker.Faker;

  public class DataGenerator {
    
      public static String getRandomEmail(){
          Faker faker = new Faker();
          String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";
          return email;
      }

      public static String getRandomUsername(){
          Faker faker = new Faker();
          String username = faker.name().username();
          return username;
      }

      public String getNonStaticRandomUsername(){
          Faker faker = new Faker();
          String username = faker.name().username();
          return username;
      }

    }
  
  ```

3. Use it in a feature file
``` gherkin
@debug
Feature: Sign Up New User

    Background: Preconditions
        * def dataGenerator = Java.type('utils.DataGenerator')
        * url apiURL

    Scenario: New User Sign Up
        # email and username need to be unique so need to be changed for each execution
        # Given def userData = {"email":"karate-script4@test.com", "username": "KarateTestScript4"}

        * def randomEmail = dataGenerator.getRandomEmail();
        * def randomUsername = dataGenerator.getRandomUsername();
        
        # this is how we can call non static java methods i.e. DataGenerator#getNonStaticRandomUsername()
        * def jsFunction =
        """
            function () {
                let DataGenerator = Java.type('utils.DataGenerator')
                let generator = new DataGenerator()
                return generator.getNonStaticRandomUsername()
            }
        """

        * def randomUsernameNonStatic = call jsFunction
        
        Given path 'users'
        And request 
        """
            {
                "user": {
                    "email": #(randomEmail), 
                    "username":#(randomUsernameNonStatic), 
                    "password":'karate1234'
                }
            }
        """
        When method post
        Then status 201
        And match response.user.username == randomUsernameNonStatic
        And match response.user.email == randomEmail
        And match response == 
        """
            {
                "user": {
                    "id": '#number',
                    "email": #(randomEmail),
                    "username": #(randomUsernameNonStatic),
                    "bio": null,
                    "image": '#string',
                    "token": '#string'
                }
            }

        """
        * print response

```

## Data Driven Scenario

``` gherkin
Background: Preconditions
        * def dataGenerator = Java.type('utils.DataGenerator')
        * def randomEmail = dataGenerator.getRandomEmail();
        * def randomUsername = dataGenerator.getRandomUsername();
        * url apiURL

Scenario Outline: Validate Sign Up error messages
            * def randomEmail = dataGenerator.getRandomEmail();
            * def randomUsername = dataGenerator.getRandomUsername();
            
            Given path 'users'
            And request 
            """
                {
                    "user": {
                        "email": "<email>",
                        "username": "<username>",
                        "password":"<password>"
                    }
                }
            """
        When method post
        Then status 422
        And match response == <errorResponse>

        Examples:
            | email            | password   | username               | errorResponse                                                                           |
            | #(randomEmail)   | Karate123  | KarateTestUser!        | {"errors":{"username":["has already been taken"]}}                                      |
            | karate!@test.com | Karate123  | #(randomUsername)      | {"errors":{"email":["has already been taken"]}}                                         |
            | karate!@test.com | Karate123  | KarateTestUser!        | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}}   |
            | InvalidEmail..   | Karate123  | #(randomUsername)      | {"errors":{"email":["is invalid"]}}                                                     |
            | #(randomEmail)   | Karate123  | KarateTestUser!1234567 | {"errors":{"username":["is too long (maximum is 20 characters)"]}}                      |
            | #(randomEmail)   | Kar        | #(randomUsername)      | {"errors":{"password":["is too short (minimum is 8 characters)"]}}                      |
            |                  | Karate123  | #(randomUsername)      | {"errors":{"email":["can't be blank"]}}                                                 |
            | #(randomEmail)   |            | #(randomUsername)      | {"errors":{"password":["can't be blank"]}}                                              |
            | #(randomEmail)   | Karate123  |                        | {"errors":{"username":["can't be blank"]}}                                              |
```

## Reading Other Files

## Mistakes & Debugging

## Homework

# Section 5: Advanced Features

# Section 6: Performance Testing with Gatling

# Section 7: Conclusion