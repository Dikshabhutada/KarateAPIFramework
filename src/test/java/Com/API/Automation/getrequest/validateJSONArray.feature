Feature: To validate get end point

   #Background: setup the base url
   #Given url "https://reqres.in"
   
   Scenario: to get the data in json format
   Given url "https://reqres.in/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   And match response.page == 2
   And match response.data[0].id == 7
   And match response.data[2].id == 9
   
   # validate size of JSON Array
   And match response.data == '#[6]'
   
   # Using wild card char [*] -> to validate entire value in order
   # ex in udemy bcoz our code is not applicable : And match response[0].experience[*] == ['apple','google']
   
   # Contain Keyword: 1. to specify single or multiple value 2. order doed not matter
    # ex in udemy And match response[0].experience[*] contains ['google','apple']
    
    Scenario: to get the data in json format with Fuzzy matcher
   Given url "https://reqres.in/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   And match response.page == "#present"
   And match response.page == "#number"
   And match response.data == "#array"
   And match response.data[0].first_name == "#string"
   And match response.data.id == "#notpresent"
   
   #complex fuzzy matcher
   And match response.page == '#?_== 2'
   And match response.data[0].id == '#?_==7'
   And match response.data[0].first_name == '#string? _.length >= 1'
   
   #to validate the array
   And match response.data == '#[]'
   And match response.data == '#[6]'
   
   #to make sure that it is array of string
   # Ex in udemy And match response.data == '#[6] #string'
   
   
   