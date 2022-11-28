Feature: To test the get end point of the application
         To test different get end point with different data formate supported by the application
         
         Background: setup the base path
         Given url "https://www.gstatic.com/youtube"
          And print '==================This is back ground keyword============'
         
         Scenario: To get the all data from application in JSON FORMAT
         #Given url "https://www.gstatic.com/youtube/img/emojis/emojis-svg-9.json"
         Given path "/img/emojis/emojis-svg-9.json" 
         When method get # send the get request
         Then status 200 # the status code response should be 200
         
         Scenario: To get the all data from application in JSON FORMAT using path keyword
         #Given url "https://www.gstatic.com/youtube"
         And path "/img/emojis/emojis-svg-9.json"
         And header Accept = 'application/json'
         When method get # send the get request
         Then status 200 # the status code response should be 200
         
         Scenario: To get the all data from application in XML FORMAT using path keyword
         #Given url "https://www.gstatic.com/youtube"
         And path "/img/emojis/emojis-svg-9.json"
         And header Accept = 'application/xml'
         When method get # send the get request
         Then status 200 # the status code response should be 200
         