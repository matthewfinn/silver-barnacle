@debug
Feature: Sign Up New User

    Background: Preconditions
        * def dataGenerator = Java.type('utils.DataGenerator')
        * def randomEmail = dataGenerator.getRandomEmail();
        * def randomUsername = dataGenerator.getRandomUsername();
        * url apiURL

    Scenario: New User Sign Up
        # email and username need to be unique so need to be changed for each execution
        # Given def userData = {"email":"karate-script4@test.com", "username": "KarateTestScript4"}

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

        Scenario Outline: Validate Sign Up error messages
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