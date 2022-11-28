Feature: to  test the updation of job entry in test apllication
  
  Scenario: To update the job entry for existing job in JSON format
  # create a new job entry
  #Update the job entry using the PUT Request
  # Using JSONPath verify the updation of details in job entry
  
  Scenario: to create a job entry in JSON format
 Given url "https://reqres.in/api/users"
 #* def getRandomValue = function() {return Math.floor((100) * Math.random());} # it is JSON Function to create a random job id
 * def getStringValue = function(arg1) {return "Hello "+ arg1;}
 * def id = getStringValue('world')
 And request { "name": "morpheus","job": "#(id)"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
 # put request
 Given url 'https://reqres.in/api/users/2'
 And request
 """
 {
    "name": "morpheus",
    "job": "#(id)"
}
 """
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method put
 Then status 200
 And print response
 #* def jobid = karate.jsonpath(response, '$.job')
 #SSAnd match jobid =='#[world]'
 
 
 Scenario: To update the job entry for existing job in JSON format by calling another feature file
  
 #<Gherkin keyword> <call> <read(location of feature file)>
 Given call read("../createjobentry.feature")
 # put request
 Given url 'https://reqres.in/api/users/2'
 And request
 """
 {
    "name": "morpheus",
    "job": "DIKSHA"
}
 """
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method put
 Then status 200
 And print response
 #* def jobid = karate.jsonpath(response, '$.job')
 #SSAnd match jobid =='#[world]'
 
 Scenario: To update the job entry for existing job in JSON format by calling another feature file using accessing the  variables
  
 #<Gherkin keyword> <call> <read(location of feature file)>
 #Given call read("../createjobentry.feature")
 * def postrequest = call read("../createjobentry.feature")
 And print "calling feature ==>" , postrequest.id  
 And print "calling feature ==>" , postrequest.getStringValue('world')
 # put request
 Given url 'https://reqres.in/api/users/2'
 And request
 """
 {
    "name": "morpheus",
    "job": "#(postrequest.id)"
}
 """
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method put
 Then status 200
 And print response
 #* def jobid = karate.jsonpath(response, '$.job')
 #SSAnd match jobid =='#[world]'
 
 Scenario: To update the job entry for existing job in JSON format by calling another feature file using passing the  variables
  
 #<Gherkin keyword> <call> <read(location of feature file)>
 #Given call read("../createjobentry.feature"){var1 : value, var2 : value}
 * def getStringValue = function(arg1) {return "Hello "+ arg1;}
 * def id = getStringValue('world')
 * def postrequest = call read("../createjobentrywithvariables.feature") {_url: "https://reqres.in/api/users", _id:'#(id)'}
  # put request
 Given url 'https://reqres.in/api/users/2'
 And request
 """
 {
    "name": "morpheus",
    "job": "#(id)"
}
 """
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method put
 Then status 200
 And print response
 #* def jobid = karate.jsonpath(response, '$.job')
 #SSAnd match jobid =='#[world]'
 