Feature: To create the job entry in the application use post

Background: create and initialize the base url
 Given url _url
 
 Scenario: to create a job entry in JSON format
 Given path "/api/users"
 And request { "name": "morpheus","job": "leader"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 And match response.name == "morpheus"
 
 Scenario: to create a job entry in JSON format
 Given path "/api/users"
 * def body = read ("data/jobentry.json")
 #And request { "name": "morpheus","job": "leader"} #hard coded 
 And request body
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 And match response.name == "morpheus"
 
 Scenario: to create a job entry in JSON format with Embedded expression
 Given path "/api/users"
 * def getName = function() { return "diksha";}
 And request { "name": '#(getName())',"job": "leader"} 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 And match response.name == "diksha"