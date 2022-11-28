Feature: to create a job entry in test application

Scenario: to create a job entry in JSON format
#these are the two variables whose value will be supplied by the calling feature file
 Given url _url
 And print "Helper ==>", _url
 And print "Helper ==>", _id
 And request { "name": "morpheus","job": "#(_id)"} #hard coded 
 #if we want add multiple keyword that time headers keyword we used
 And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
 When method post 
 Then status 201
