Feature: To access the GET end point which is secure with basic auth

Scenario: To access the GET end point with basic auth
Given url 'https://gorest.co.in/public/v2/users'
And headers {Accept: 'application/json' , Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
When method get
Then status 200
And match response == '#notnull'

Scenario: To access the GET end point without basic auth
Given url 'https://gorest.co.in/public/v2/users'
And request {"id":508,"name":"Amb. Adwitiya Naik","email":"adwitiya_naik_amb@champlin-trantow.com","gender":"male","status":"active"} #hard coded 
And headers {Accept: 'application/json'}
When method post
Then status 401
And match response == '#notnull'

Scenario: To access the GET end point with basic auth via js function
Given url 'https://gorest.co.in/public/v2/users'
* def auth = call read('../../BasicAuth') {username:'admin',password:'welcome'}
And print "This is encoded string ==>", auth
And headers {Accept: 'application/json' , Authorization:'#(auth)'}
When method get
Then status 200
And match response == '#notnull'
