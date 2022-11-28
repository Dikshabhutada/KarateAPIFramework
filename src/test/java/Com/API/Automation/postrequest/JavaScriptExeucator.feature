Feature: To execute the java script function

Scenario: Execute java script function with and without parameter
* def getIntValue = function() { return 10;}
Then print "Function value=>", getIntValue()
* def getStringValue = function(arg1) {return "Hello "+ arg1;}
Then print "function value=>" ,getStringValue("world")