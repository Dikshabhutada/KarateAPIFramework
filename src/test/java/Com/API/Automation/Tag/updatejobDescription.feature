@Regression @smoke
Feature: To test update data
 
@Smoke
Scenario: To update the job for newly added job entry
# Create a new job entry
#Using the patch request update the job description of newly added job entry
Given url "https://reqres.in/api/users"
 And request { "name": "morpheus","job": "leader"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 # Patch request
* def user = "Diksha"
 Given url "https://reqres.in/api/users/2"
 And param name = user
 And header Accept = "application/json"
 And request {"name": "#(user)","job": "leader"}
 When method patch 
 Then status 200
 And print response
 And match response.name == user
 
 @Regression
 Scenario: To update the job for newly added job entry with non-existing data
# Create a new job entry
#Using the patch request update the job description of newly added job entry
Given url "https://reqres.in/api/users"
 And request { "name": "morpheus","job": "leader"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 # Patch request
* def user = "Diksha"
 Given url "https://reqres.in/api/users/2"
 And param name = user
 And header Accept = "application/json"
 And request {"name": "#(user)","job": "leader"}
 When method patch 
 Then status 404
 And print response
 #And match response.name == user
 
 
 
 
 

