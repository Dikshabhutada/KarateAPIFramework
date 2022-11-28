Feature: To use the json path expression

Scenario: to get the value of property using json path expression
  Given url "https://reqres.in/api/users?page=2"
  When method get
  Then status 200
  # Karate.jsonPath(doc, jsonPathExpression)
  * def page = karate.jsonPath(response ,"$.page")
  And print "page =>",page
  * def id = karate.jsonPath(response , "$..id")
  And print "id => ",id