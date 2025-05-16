Feature: Verify the CRUD operations for Product APIs
  From Best Buy Application

  Background:
    Given url 'http://localhost:3030'
    And path 'products'

  Scenario: Verify Get all products API from Best Buy
    When method get
    Then status 200
    And match response.limit == 10
    And match response.skip != 5
    And match response.data[0].name == "Duracell - AAA Batteries (4-Pack)"
    And match response.data[0] contains deep {"model": "MN2400B4Z"}
    And match response.data[0].categories contains deep {"name": "Alkaline Batteries"}
    # attribute 'total' is present
    And match response.total == '#present'
    # attribute 'total' is a number
    And match response.total == '#number'
    # attribute 'id' is NOT present
    And match response.id == '#notpresent'
    # attribute 'data' is an Array
    And match response.data == '#array'
    # size of the response data Array is 10
    And match response.data == '#[10]'
    # query parameters

  Scenario: Verify get all products with query parameters
    * def limit = 20
    And param $limit = limit
    When method get
    Then status 200
    And match response.limit == limit
    And match response.data == '#[' + limit + ']'

  Scenario: Verify add product API
    * def productName = "Apple iPhone 15"
    Given request
    """
    {
      "name": "#(productName)",
      "type": "Mobile",
      "price": 0,
      "shipping": 739,
      "upc": "string",
      "description": "#(productName)",
      "manufacturer": "Apple",
      "model": "iPhone 15",
      "url": "/apple-iphone-15",
      "image": "iphone-15.png"
    }
    """
    When method post
    # status created is 201
    Then status 201
    And match response.name == productName