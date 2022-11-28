Feature: to send the get request with JWT token

Scenario: send the get request with JWT request
#variable that will store token and information
* def token = call read('../../getToken.feature') {password: 'john snow' , username: 'diksha'}
Given url "https://jobapplicationjwt.herokuapp.com/auth/webapi/all"
And headers {Accept : "application/json" , Authentication:'#("Bearer " + token.authToken)'}
When method get
Then status 200

Scenario: send the get request without JWT request
Given url "https://jobapplicationjwt.herokuapp.com/auth/webapi/all"
And headers {Accept : "application/json"}
When method get
Then status 401



