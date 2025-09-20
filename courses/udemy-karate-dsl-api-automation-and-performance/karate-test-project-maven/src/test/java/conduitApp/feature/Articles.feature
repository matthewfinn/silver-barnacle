# [Test Application URL](https://conduit.bondaracademy.com/)
# [Test API URL](https://conduit-api.bondaracademy.com)
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

        # get the articles and check our new one is contained in the list
        # this doesn't currently work for this API for some reason. The articles returned seem to be fixed
        # FIGURED IT OUT: It returns a different list depending on whether there's a valid Authorization header token
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