Feature: To create job description in the test application

    #Background: Read the datafor data driven
    #* def datatest = read("Datatest.csv")


 Scenario Outline: To create job description in the test application <method>
  Given print '<url>'
  When print '<method>'
  And print '<status>'
  
  Examples: 
  | url                                   |method          |status
  |"https://reqres.in/api/users?page=2"   |get             |200
  |"https://reqres.in/api/users"          |post            |201

  Scenario Outline: Data Driven for the job description entry
  Given url "https://reqres.in/api/users"
  And request { "name": '#(Name)',"job": '#(Job)'} #hard coded
    #if we want add multiple keyword that time headers keyword we used
    And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
    When method post
    Then status <status>
    And print '<Name>'
    And print response
    
    
    Examples:
    |Name                    |Job        |status
    |diksha                  |leader     |201
    
    # this approch is ok when you have limited number of data set bt this aprroch will create a problem when you have large data set in that case it is always a better approch to store the data set in an external file system and 
    
   
    Scenario Outline: Data Driven for the job description entry using CVS Files <Name>
     Given url "https://reqres.in/api/users"
     And request { "name": '#(Name)',"job": '#(Job)'} #hard coded
    #if we want add multiple keyword that time headers keyword we used
    And headers {Accept : 'application/json' ,  Content-Type : 'application/json'}
    When method post
    Then status <status>
    
    
    Examples:
     #|datatest|
     |read("Datatest.csv")|