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


  Scenario: Get 10 articles from the page
    * def timeValidator = read('classpath:utils/timeValidator.js')

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
    And match each response..following == '#boolean'
    And match each response..favoritesCount == '#number'
    # '##string' means the field can be a string, null, or completely absent from the response
    And match each response..bio == '##string'
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


