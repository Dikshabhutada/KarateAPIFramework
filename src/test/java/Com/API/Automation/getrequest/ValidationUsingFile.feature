Feature: To validate get end point

   Background: setup the base url
   Given url "https://reqres.in"
   
   Scenario: to get the data in json format validate from file
   Given path "/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   
   #Create a variable to store the data from external file
   * def ActualResponse = read("../JsonResponse.json") 
   And match response == ActualResponse
   And print "Response actual==>" , ActualResponse
   
  