Feature: Create Token

    Scenario: Create Token
        Given url apiURL
        And path 'users/login'
        And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
        When method post 
        Then status 200
        * def authToken = 'Token ' + response.user.token
