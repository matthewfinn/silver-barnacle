#language: en
#Feature: Defines what feature you will be testing in the tests below
#Given: Tells the pre-condition of the test
#And: Defines additional conditions of the test
#Then: States the post condition. You can say that it is the expected result of the test.

  Feature: Login Action

    Scenario: Successful login with valid credentials
      Given User is on the login page
      When User enters username and password
      #And User enters username and password
      Then Message displayed login successfully

#    Scenario: Successful logout
#      When User logs out from the application
#      Then Message displayed logout successfully