Feature: To get the variables set by karate-config.js file

Background: to get the value of myVarName
* def localmyVarName = myVarName
Given print "Background variable value =>" , localmyVarName

Scenario: To get the value of username and password
* def localusername = username
Given print "Username variable value =>" , username
#also you can the variable directly
And print "Password variable value =>" , password
