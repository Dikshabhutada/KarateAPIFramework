Feature: To validate get end point

   Background: setup the base url
   Given url "https://reqres.in"
   
   Scenario: to get the data in json format
   Given path "/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   And print response
   And match response ==    
   """
   {
  "page": 1,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "name": "cerulean",
      "year": 2000,
      "color": "#98B2D1",
      "pantone_value": "15-4020"
    },
    {
      "id": 2,
      "name": "fuchsia rose",
      "year": 2001,
      "color": "#C74375",
      "pantone_value": "17-2031"
    },
    {
      "id": 3,
      "name": "true red",
      "year": 2002,
      "color": "#BF1932",
      "pantone_value": "19-1664"
    },
    {
      "id": 4,
      "name": "aqua sky",
      "year": 2003,
      "color": "#7BC4C4",
      "pantone_value": "14-4811"
    },
    {
      "id": 5,
      "name": "tigerlily",
      "year": 2004,
      "color": "#E2583E",
      "pantone_value": "17-1456"
    },
    {
      "id": 6,
      "name": "blue turquoise",
      "year": 2005,
      "color": "#53B0AE",
      "pantone_value": "15-5217"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
 """
 
  Scenario: to get the data in json format with negate condition 
   Given path "/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   And print response
   And match response !=
   """
   {
  "page": 1,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "name": "cerulean",
      "year": 2000,
      "color": "#98B2D1",
      "pantone_value": "15-4020"
    },
    {
      "id": 2,
      "name": "fuchsia rose",
      "year": 2001,
      "color": "#C74375",
      "pantone_value": "17-2031"
    },
    {
      "id": 3,
      "name": "true red",
      "year": 2002,
      "color": "#BF1932",
      "pantone_value": "19-1664"
    },
    {
      "id": 4,
      "name": "aqua sky",
      "year": 2003,
      "color": "#7BC4C4",
      "pantone_value": "14-4811"
    },
    {
      "id": 5,
      "name": "tigerlily",
      "year": 2004,
      "color": "#E2583E",
      "pantone_value": "17-1456"
    },
    {
      "id": 6,
      "name": "blue turquoise",
      "year": 2005,
      "color": "#53B0AE",
      "pantone_value": "15-5217"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
 """
 
 
 Scenario: to get the data in json format with specific proprty in response
   Given path "/api/users?page=2"
   And header Accept = 'application/json'
   When method get
   Then status 200
   And print response
   And match header Connection == "keep-alive"
   #And match response contain deep {"json array":[{json object}]} not preset in program its just ex form udemy
 
  
 
 Scenario: to get the data in xml format
   Given url "http://restapi.adequateshop.com/api/Traveler?page=1"
   And header Accept = 'application/xml'
   When method get
   Then status 200
   And print response
   And match response == 
   """
   <TravelerinformationResponse xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.datacontract.org/2004/07/DummyRestApi.Models">
                <page>6</page>
                <per_page>10</per_page>
                <total_pages>763</total_pages>
                <totalrecord>7624</totalrecord>
                <travelers>
                <Travelerinformation>
                <adderes>Badarpur, New Delhi, Delhi, India</adderes>
                <createdat>2020-05-31T17:03:54.9474996</createdat>
                <email>rakesh_singh_bisht@yahoo.co.in</email>
                <id>81</id>
                <name>Rakesh Singh Bisht</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-02T04:03:01.5222942</createdat>
                <email>fyizgcfray_1574354851@tfbnw.net</email>
                <id>82</id>
                <name>Harry Bushakson</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-02T05:08:58.672851</createdat>
                <email>sonam123@gmail.com</email>
                <id>84</id>
                <name>Sonam Sharma</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-02T05:14:40.7655781</createdat>
                <email>shreya.kumari4994@gmail.com</email>
                <id>85</id>
                <name>shreya</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-02T05:18:22.7652253</createdat>
                <email>ap.prak96@gmail.com</email>
                <id>86</id>
                <name>ap</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-02T12:56:51.9287121</createdat>
                <email>chandanjaishawal@gmail.com</email>
                <id>87</id>
                <name>AP</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-04T08:48:53.8471058</createdat>
                <email>295037348564302</email>
                <id>88</id>
                <name>Ajay Nagar</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-08T15:58:26.3844855</createdat>
                <email>ap.prak97@gmail.com</email>
                <id>89</id>
                <name>AP</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>10281 Mission Gorge Rd, Santee, CA 92071, USA</adderes>
                <createdat>2020-06-09T14:04:12.9065286</createdat>
                <email>alexathomas1975@gmail.com</email>
                <id>90</id>
                <name>Alexa Thomas</name>
                </Travelerinformation>
                <Travelerinformation>
                <adderes>USA</adderes>
                <createdat>2020-06-10T17:12:53.4353615</createdat>
                <email>jennifermathis.89904@gmail.com</email>
                <id>91</id>
                <name>Jennifer Mathis</name>
                </Travelerinformation>
                </travelers>
</TravelerinformationResponse>
   """
   
  
  