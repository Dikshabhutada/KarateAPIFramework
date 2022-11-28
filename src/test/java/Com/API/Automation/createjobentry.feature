Feature: to create a job entry in test application

Scenario: to create a job entry in JSON format
 Given url "https://reqres.in/api/users"
 * def getStringValue = function(arg1) {return "Hello "+ arg1;}
 * def id = getStringValue('world')
 And request { "name": "morpheus","job": "#(id)"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
