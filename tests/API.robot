*** Settings ***
Library    RequestsLibrary
Library    Collections    
Library    OperatingSystem    
# Test Setup    Create Session    my session    ${END POINT}

*** Variables ***
${URL}                http://localhost:8080/app
${OK CODE}      200

*** Test Cases ***
Get Request With Basic Authentication Using Username And Password
    ${auth}=    Create List    ToolsQA    TestPassword
    Create Session    my session    http://restapi.demoqa.com    auth=${auth}
    ${response}=    Get Request    my session   /authentication/CheckForAuthentication/
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}
    Log To Console    ${response.content}
    
Get Request (Get All Video Game)
    Create Session    my session    ${URL}     
    
    ${response}=    Get Request    my session    /videogames    
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    Log To Console    ${response.content}    
    
Post Request (Add A New Video Game)
    Create Session    my session    ${URL}    
    
    ${body}=    Create Dictionary    id=13    name=tester2    releaseDate=2020-05-12T07:17:11.273Z    reviewScore=1    category=test    rating=good
    ${header}=    Create Dictionary    Content-Type=application/json
    
    ${response}=    Post Request    my session    /videogames    data=${body}    headers=${header}
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    Record Added Successfully        
    
Get Request (Get Video Game Details By Id)
    Create Session    my session    ${URL}
    
    ${response}=    Get Request    my session    /videogames/10
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}
        
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    <id>10</id>    
    
Put Request (Update Video Game Details)
    Create Session    my session    ${URL}    
    
    ${body}=    Create Dictionary    id=13    name=update_tester2    releaseDate=2020-05-12T07:17:11.273Z    reviewScore=1    category=test    rating=good
    ${header}=    Create Dictionary    Content-Type=application/json
    
    ${response}=    Put Request    my session    /videogames/13    data=${body}    headers=${header}
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    update_tester2

Delete Request (Delete Video Game)
    Create Session    my session    ${URL}
    
    ${response}=    Delete Request    my session    /videogames/13
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}

    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    Record Deleted Successfully