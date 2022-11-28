Feature: Validate the JSON Schema
  
  Background: create and initialize the base url
  Given url "https://reqres.in"

  Scenario: to create a job entry in JSON format
    Given path "/api/users"
    * def body = read ("data/jobentry.json")
    #And request { "name": "morpheus","job": "leader"} #hard coded
    And request body
    #if we want add multiple keyword that time headers keyword we used
    And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
    When method post
    Then status 201
    And match response ==
      """
      {
      "name": '#string',
         "job": '#string',
         "id": '#string',
         "createdAt":'#string'
         
       }
      """
      
       Scenario: Complex schema validation for GET end point
         Given url "https://reqres.in/api/users?page=2"
         And header Accept = 'application/json'
         When method get # send the get request
         Then status 200 # the status code response should be 200
         * def dataschema = {"id":'#number', "email":'#string', "first_name": '#string', "last_name":'#string',"avatar": '#string'}
         * def mainschema = {"page": '#number', "per_page": '#number',"total":'#number', "total_pages": '#number',"data": '#[] ##(dataschema)'}
         And match response == 
         """
         '##(mainschema)'
         """
        