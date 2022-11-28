Feature: Variables Creation in Karate Framework

Background: Create and initialize variable
* def app_name = "google"
* def page_load_timeout = 20

#Syntax 1.<Gherkin keyword> <def> <Variable_name> = <Value>
        #2.* <def> <Variable_name> = <Value>
        
Scenario: to create variables

#Use Variable for repeating value
# Storing the data from a external file
# In the Matcher expression
# passing the data from one feature file to another

Given def var_int = 10
And def var_string = "Diksha"
Then print "Int_Variable=>",var_int
And print "String_variable=>",var_string
And print "background section=>" ,app_name

* def var_int1 = 67
Then print "Int_Variable1=>",var_int1


Scenario: Access the variable in another scenario
* def var_int = 34
* def var_string = "mohan"
Given print "Previous scenario ==>", var_int
And print "Previous scenario ==>", var_string

#Note: we cant access the value from 1st scenario to another bt from background to scenario we can access