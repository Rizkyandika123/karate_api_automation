Feature: Petstore user

  Background:
    Given url 'https://petstore.swagger.io/v2'
    When header Content-Type = 'application/json'

  Scenario: Create new user
    * def user =
    """
      {
        "id": 12,
        "username": "lionelmessi",
        "firstName": "lionel",
        "lastName": "messi",
        "email": "lionelmessi@gmail.com",
        "password": "123456",
        "phone": "0823721",
        "userStatus": 0
      }
      """
    When path '/user'
    And request user
    When method post
    And status 200
    Then print response
    Then match response == {"code": 200, "type": "unknown", "message": "12"}


  Scenario: Creates list of users with given input array
    * def user =
    """
    [
      {
      "id": 1,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
      }
    ]
    """
    When path '/user/createWithArray'
    And request user
    When method post
    And status 200
    Then print response
    Then match response == {"code": 200, "type": "unknown", "message": "ok"}

  Scenario: Creates list of users with given input list
    * def user =
    """
    [
      {
      "id": 1,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
      }
    ]
    """
    When path '/user/createWithList'
    And request user
    When method post
    And status 200
    Then print response
    Then match response == {"code": 200, "type": "unknown", "message": "ok"}

  Scenario: User login
    When path '/user/login'
    And request {username: 'username', password:'123456'}
    When method get
    And status 200
    Then print response
    Then match response == {"code": 200,"type": "unknown","message": "#string"}
#
  Scenario: User logout
    When path '/user/logout'
    When method get
    And status 200
    Then print response
    Then match response == {"code": 200, "type": "unknown", "message": "ok"}

  Scenario: Get user by user name
    When path '/user'
    And request { username: 'lionelmessi'}
    And header Accept = 'application/json'
    When method get
    And status 200
    Then print response
    Then match response == {"id": 12,"username": "lionelmessi","firstName": "lionel","lastName": "messi","email": "lionelmessi@gmail.com","password": "123456","phone": "0823721","userStatus": 0}

  Scenario: Update user
    * def user =
    """
    [
      {
        "id": 12,
        "username": "lionelmessi",
        "firstName": "lionel",
        "lastName": "messi",
        "email": "lionelmessi@gmail.com",
        "password": "123456",
        "phone": "0822893",
        "userStatus": 0
      }
    ]
    """
    When path '/user'
    And request {username: 'lionelmessi'}
    Then request user
    When method put
    And status 200
    Then print response
    Then match response == {"code": 200, "type": "unknown", "message": "ok"}

  Scenario: delete user
    When path '/user'
    And request {username: 'lionelmessi'}
    When method delete
    And status 200
    Then print response