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

  Scenario: Verify get all products with query parameters
    Given def limit = 20
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
      "price": 739,
      "shipping": 39,
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


  Scenario: Verify add product API Payload from file
    * def productName = "Apple iPhone 16"
    # * def jsonData = read("../testData/requestPayload.json")
    # Given request jsonData
    # OR
    Given request read("../testData/requestPayload.json")

    When method post
    # status created is 201
    Then status 201
    And match response.name == productName

  Scenario: Verify update PUT product API
    * def productName = "Apple iPhone 15"
    Given request
      """
      {
        "name": "#(productName)",
        "type": "Mobile",
        "price": 739,
        "shipping": 39,
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
    * def productId = response.id
    * print 'productId: ', productId

    Given path "products/" + productId
    And request
      """
      {
        "name": "#(productName)",
        "type": "Mobile",
        "price": 629,
        "shipping": 39,
        "upc": "string",
        "description": "#(productName)",
        "manufacturer": "Apple",
        "model": "iPhone 15",
        "url": "/apple-iphone-15",
        "image": "iphone-15.png"
      }
      """

    When method put
    Then status 200
    Then match response.price == 629

  Scenario: Verify update PATCH product API
    * def productName = "Apple iPhone 15"
    Given request
      """
      {
        "name": "#(productName)",
        "type": "Mobile",
        "price": 739,
        "shipping": 39,
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
    Then match response.price == 739
    Then match response.shipping == 39
    * def productId = response.id
    * print 'productId: ', productId

    Given path "products/" + productId
    And request
      """
      {
        "price": 609,
        "shipping": 19,
      }
      """
    When method patch
    Then status 200
    Then match response.price == 609
    Then match response.shipping == 19

  Scenario: Verify delete product API
    * def productName = "Apple iPhone 15"
    Given request
      """
      {
        "name": "#(productName)",
        "type": "Mobile",
        "price": 739,
        "shipping": 39,
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
    Then match response.price == 739
    Then match response.shipping == 39
    * def productId = response.id
    * print 'productId: ', productId

    Given path "products/" + productId
    When method delete
    Then status 200

    Given path "products/" + productId
    When method get
    Then status 404