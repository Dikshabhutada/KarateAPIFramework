#it can be only executed by callimg from another
@ignore
Feature: To get the JWT token for the user

Scenario: Register the user and generate the token
#Register the user
Given url "https://jobapplicationjwt.herokuapp.com/users/sign-up"
And headers {Accept: 'appilcation/json',Content-type: 'application/json'}
#instead of harded coded value of username and password will be passed as parameter to this feature file
And request {"password": "#(password)","username": "#(username)"}
When method post
Then status 200

#get the Token
Given url "https://jobapplicationjwt.herokuapp.com/users/authenticate"
And headers {Accept: 'appilcation/json',Content-type: 'application/json'}
And request {"password": "#(password)","username": "#(username)"}
When method post
Then status 200
#this variable will be used by callimg the feature file to get the token value
* def authToken = response.token

