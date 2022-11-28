Feature: To test the delete end point

Scenario: To delete the job entry from application using job
# Create a new job entry
# Delete newly created job entry
# Get Requset with query parameter and validate 404
Given url "https://reqres.in/api/users"
* def Name1 = "Diksha"
 And request { "name": "#(Name1)","job": "leader"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 And print response
 
 #Delete request
 Given url 'https://reqres.in/api/users/remove' + Name1
 And headers {Accept : 'application/json'}
 When method delete
 Then status 204
 #And print response
 
 #get request with query parameter
 Given url 'https://reqres.in/api/find'
 And params { "name": "#(Name1)","job": "leader"}
 And header Accept = 'application/json'
 When method get
 Then status 404
 
 #Scenario: To demo request chaining 
 #Create a new job entry
 # Extract the job id and job title from the response of post request
 # send the path request, value of query parameter will be set by, info extracted from previous request
 # extract the job id and job title from the response of patch request
 # get request with query parameter, value of query param is set by info extracted from response of patch request.
 # add the validation on job description in the response of get request
 
 
 
 
 