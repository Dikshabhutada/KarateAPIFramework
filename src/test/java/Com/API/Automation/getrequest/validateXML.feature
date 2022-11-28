Feature: To validate get end point

   #Background: setup the base url
   #Given url "https://reqres.in"
   
   Scenario: to get the data in XML format
   Given url "http://restapi.adequateshop.com/api/Traveler?page=1"
   And header Accept = 'application/XML'
   When method get
   Then status 200
   And match response/page == 6
   And match response/travelers/Travelerinformation/adderes[1] == 'Badarpur'
   
   #Skip the response keyword
   And match /travelers/Travelerinformation/adderes[1] == 'Badarpur'
   
   # Diiferent JSON and XML 1. JSON -> "." XML->"/"
   #                         2. JSON-> index starts from 0 XML-> index starts from 1
   
   # traverse the xml to json
    And match response.travelers.Travelerinformation.adderes[0] == 'Badarpur'
   
   Scenario: to get the data in XML format with fuzzy matcher
   Given url "http://restapi.adequateshop.com/api/Traveler?page=1"
   And header Accept = 'application/XML'
   When method get
   Then status 200
   And match response/page == "#number"
   And match response/travelers/Travelerinformation/adderes[1] == '#string'
   
   #complex fuzzy matcher
   And match response/travelers/Travelerinformation/adderes[1] == '#string? _.length >= 1
    
    