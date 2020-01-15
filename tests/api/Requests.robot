*** Settings ***
Library    RequestsLibrary
Library    Collections    
Library    OperatingSystem    
Test Setup    Create Session    my session    ${URL}

*** Variables ***
${URL}                http://localhost:8080/app
${OK CODE}      200

*** Test Cases ***
Get Request (Get All Video Game)
    ${response}=    Get Request    my session    /videogames    
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    Log To Console    ${response.content}    
    
    # Validate header values
    Log To Console    ${response.headers}
    ${content type}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content type}    application/xml
    
    # Validate cookies value
    Log To Console    ${response.cookies}
    # ${cookies value}=    Get From Dictionary    ${response.cookies}    cookies_name
    # Should Be Equal    ${cookies value}    expected    
    
Post Request (Add A New Video Game)
    ${body}=    Create Dictionary    id=13    name=tester2    releaseDate=2020-05-12T07:17:11.273Z    reviewScore=1    category=test    rating=good
    ${header}=    Create Dictionary    Content-Type=application/json
    
    ${response}=    Post Request    my session    /videogames    data=${body}    headers=${header}
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    Record Added Successfully        
    
Get Request (Get Video Game Details By Id)
    ${response}=    Get Request    my session    /videogames/10
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}
        
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    <id>10</id>    
    
Put Request (Update Video Game Details)
    ${body}=    Create Dictionary    id=13    name=update_tester2    releaseDate=2020-05-12T07:17:11.273Z    reviewScore=1    category=test    rating=good
    ${header}=    Create Dictionary    Content-Type=application/json
    
    ${response}=    Put Request    my session    /videogames/13    data=${body}    headers=${header}
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}    
    
    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    update_tester2

Delete Request (Delete Video Game)
    ${response}=    Delete Request    my session    /videogames/13
    
    ${status code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status code}    ${OK CODE}

    ${response content}=    Convert To String    ${response.content}
    Should Contain    ${response content}    Record Deleted Successfully